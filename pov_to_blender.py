import re
import bpy
from mathutils import Vector, Matrix
from typing import Dict, List, Tuple

class POVParser:
    def __init__(self, pov_file: str):
        self.pov_file = pov_file
        self.spheres = []
        self.cylinders = []
        self.polygons = []
        self.camera_data = {}
        self.colors = {}

        
    def parse(self):
        with open(self.pov_file, 'r') as f:
            content = f.read()

        self._extract_colors(content)
        self._extract_camera(content)
        self._extract_spheres(content)
        self._extract_cylinders(content)
        self._extract_polygons(content)
        
    
    def _extract_camera(self, content: str):
        camera_match = re.search(
            r'camera\s*\{([^}]+)\}', content, re.DOTALL
        )
        if camera_match:
            cam_block = camera_match.group(1)
            location = re.search(r'location\s*<([^>]+)>', cam_block)
            look_at = re.search(r'look_at\s*<([^>]+)>', cam_block)
            
            if location:
                self.camera_data['location'] = self._parse_vector(location.group(1))
            if look_at:
                self.camera_data['look_at'] = self._parse_vector(look_at.group(1))
    
    def _extract_spheres(self, content: str):
        # Match entire sphere definition on a line: sphere { ... } with optional comment
        sphere_pattern = r'sphere\s*\{(.*?)\}\s*(?://.*)?$'
        for match in re.finditer(sphere_pattern, content, re.MULTILINE):
            sphere_block = match.group(1)
            center_radius = re.search(r'<([^>]+)>,\s*([\d.]+)', sphere_block)
            if not center_radius:
                continue
            center = self._parse_vector(center_radius.group(1))
            radius = float(center_radius.group(2))
            color = self._extract_material(sphere_block, object='sphere')
            translate_match = re.search(r'translate\s*<([^>]+)>', sphere_block)
            if translate_match:
                center = self._parse_vector(translate_match.group(1))
                
            self.spheres.append({
                'center': center,
                'radius': radius,
                'color': color,
                'material': sphere_block
            })
    
    def _extract_cylinders(self, content: str):
        # Match entire cylinder definition on a line: cylinder { ... } with optional comment
        cyl_pattern = r'cylinder\s*\{(.*?)\}\s*(?://.*)?$'
        for match in re.finditer(cyl_pattern, content, re.MULTILINE):
            cyl_block = match.group(1)
            points_radius = re.search(r'<([^>]+)>,\s*<([^>]+)>,\s*([\d.]+)', cyl_block)
            if not points_radius:
                continue
            point1 = self._parse_vector(points_radius.group(1))
            point2 = self._parse_vector(points_radius.group(2))
            radius = float(points_radius.group(3))
            
            color = self._extract_material(cyl_block, object='cyl')
            if color is None:
                color = (1.0, 0.0, 0.0, 1.0)
            translate_match = re.search(r'translate\s*<([^>]+)>', cyl_block)
            if translate_match:
                translate_vec = self._parse_vector(translate_match.group(1))
                point1 = tuple(a + b for a, b in zip(point1, translate_vec))
                point2 = tuple(a + b for a, b in zip(point2, translate_vec))
            
            self.cylinders.append({
                'point1': point1,
                'point2': point2,
                'radius': radius,
                'color': color,
                'material': cyl_block
            })
    
    def _extract_polygons(self, content: str):
        """Extract polygons from union blocks with their colors from the union-level material declarations."""
        
        lines = content.split('\n')
        
        # Track current state using depth counter
        union_depth = 0  # 0 = outside, 1 = in outer union, 2 = in inner union
        in_polygon_union = False
        current_material = None
        current_color = None
        current_rotate = None
        polygon_vertices = []
        
        i = 0
        while i < len(lines):
            line = lines[i]
            stripped = line.strip()
            
            # Detect outer union start - check if next line has #declare M_PD
            if stripped.startswith('union') and i+1 < len(lines) and '#declare M_PD' in lines[i+1]:
                union_depth = 1
                # Look for #declare on next line(s)
                j = i + 1
                while j < len(lines) and '#declare M_PD' not in lines[j]:
                    j += 1
                if j < len(lines):
                    declare_line = lines[j]
                    declare_match = re.search(r'#declare\s+(M_PD\d+).*?color\s+rgb<([^>]+)>\s*(?:transmit\s*([\d.]+))?', declare_line)
                    if declare_match:
                        current_material = declare_match.group(1)
                        color_rgb = declare_match.group(2)
                        transmit = declare_match.group(3)
                        current_color = self._parse_color_from_rgb(color_rgb, transmit)
                
                # Look for rotate on following lines (before next union)
                j = i + 1
                while j < len(lines) and not lines[j].strip().startswith('union'):
                    rotate_match = re.search(r'rotate\s*<([^>]+)>', lines[j])
                    if rotate_match:
                        current_rotate = self._parse_vector(rotate_match.group(1))
                        break
                    j += 1
            
            # Detect inner union start (contains polygons)
            elif union_depth == 1 and stripped.startswith('union {'):
                union_depth = 2
                # Check if this inner union contains polygons (look ahead)
                j = i + 1
                has_polygon = False
                while j < len(lines) and not lines[j].strip().startswith('union'):
                    if 'polygon' in lines[j]:
                        has_polygon = True
                        break
                    if 'material' in lines[j] and current_material in lines[j]:
                        break
                    j += 1
                if has_polygon:
                    in_polygon_union = True
            
            # Detect end of polygon union (material reference)
            elif in_polygon_union and 'material' in stripped and current_material in stripped:
                in_polygon_union = False
                union_depth = 1
                # Save collected polygons
                for verts in polygon_vertices:
                    if current_rotate:
                        verts = self._apply_rotation(verts, current_rotate)
                    self.polygons.append({
                        'vertices': verts,
                        'color': current_color,
                        'material_name': current_material
                    })
                polygon_vertices = []
            
            # Detect closing brace
            elif stripped == '}':
                if union_depth == 2 and not in_polygon_union:
                    union_depth = 1
                elif union_depth == 1:
                    union_depth = 0
                    current_material = None
                    current_color = None
                    current_rotate = None
            
            # Extract polygon data - FIXED REGEX
            elif in_polygon_union and stripped.startswith('polygon'):
                # Use corrected regex: polygon\s*\{\s*(\d+)
                count_match = re.search(r'polygon\s*\{\s*(\d+)', stripped)
                if count_match:
                    vertices_count = int(count_match.group(1))
                    # Extract all vertices
                    vertices = re.findall(r'<([^>]+)>', stripped)
                    vertices = [self._parse_vector(v) for v in vertices[:vertices_count]]
                    if len(vertices) >= vertices_count:
                        polygon_vertices.append(vertices)
            
            i += 1

    def _extract_colors(self, content: str):
        color_pattern = r'#declare\s+(\w+)\s.*pigment\s*\{\s*color\s+rgb\s*<(.*)>(?:\s*filter\s*([\d.]+))?(?:\s*transmit\s*([\d.]+))?\s*\}'
        for match in re.finditer(color_pattern, content):
            name = match.group(1).strip()
            alpha = 1 - float(match.group(4)) if match.group(4) else 1.0
            color_values = self._parse_vector_4(match.group(2)+','+str(alpha))
            self.colors[name] = color_values


    def _extract_material(self, material_str: str, object) -> Tuple[float, float, float, float]:
        color_match = re.search(r'.*material\s*\{\s(.*)\s\}', material_str)
        if color_match:
            if object == 'sphere':
                return self.colors.get(color_match.group(1).replace('M', 'P')+'_1')
            elif object == 'bond':
                return self.colors.get(color_match.group(1))
            elif object == 'poly':
                return (1.0, 1.0, 1.0, 1.0)
        return (1.0, 1.0, 1.0, 1.0)


    def _parse_color_from_rgb(self, rgb_str: str, transmit: str = None) -> Tuple[float, float, float, float]:
        values = [float(v.strip()) for v in rgb_str.split(',')]
        if len(values) >= 3:
            r, g, b = values[:3]
            # Alpha = 1 - transmit (if transmit exists), otherwise 1
            alpha = 1.0 - float(transmit) if transmit else 1.0
            return (r, g, b, alpha)
        return (1.0, 1.0, 1.0, 1.0)
    
    def _apply_rotation(self, vertices: List[Tuple[float, float, float]], rotate_vec: Tuple[float, float, float]) -> List[Tuple[float, float, float]]:
        """Apply rotation (in degrees) to vertices around origin."""
        import math
        
        rx, ry, rz = rotate_vec
        result = vertices
        if rx:
            rad = math.radians(rx)
            cos_r, sin_r = math.cos(rad), math.sin(rad)
            result = [(v[0], v[1]*cos_r - v[2]*sin_r, v[1]*sin_r + v[2]*cos_r) for v in result]
        if ry:
            rad = math.radians(ry)
            cos_r, sin_r = math.cos(rad), math.sin(rad)
            result = [(v[0]*cos_r + v[2]*sin_r, v[1], -v[0]*sin_r + v[2]*cos_r) for v in result]
        if rz:
            rad = math.radians(rz)
            cos_r, sin_r = math.cos(rad), math.sin(rad)
            result = [(v[0]*cos_r - v[1]*sin_r, v[0]*sin_r + v[1]*cos_r, v[2]) for v in result]
        return result

    def _parse_vector(self, vector_str: str) -> Tuple[float, float, float]:
        values = [float(v.strip()) for v in vector_str.split(',')]
        return tuple(values[:3]) if len(values) >= 3 else (0, 0, 0)
    
    def _parse_vector_4(self, vector_str: str) -> Tuple[float, float, float, float]:
        values = [float(v.strip()) for v in vector_str.split(',')]
        return tuple(values[:4]) if len(values) >= 4 else (0, 0, 0)
    

class BlenderCrystalBuilder:
    def __init__(self, pov_data: POVParser):
        self.data = pov_data
        self.materials_cache = {}  # Cache materials by color tuple
    
    def _get_or_create_material(self, color: tuple, base_name: str = "Material") -> bpy.types.Material:
        """Get an existing material with the same color, or create a new one if not found."""
        # Round color values to avoid floating point precision issues
        rounded_color = tuple(round(c, 4) for c in color)
        
        # Check if we already have a material with this color
        if rounded_color in self.materials_cache:
            return self.materials_cache[rounded_color]
        
        # Create new material
        mat = bpy.data.materials.new(name=f"{base_name}_{rounded_color}")
        mat.node_tree.nodes["Principled BSDF"].inputs[0].default_value = color
        
        # Cache it
        self.materials_cache[rounded_color] = mat
        return mat
    
    def build(self):
        self._create_spheres()
        self._create_cylinders()
        self._create_polygons()
        self._set_camera()
    
    def _create_spheres(self):
        for sphere in self.data.spheres:
            bpy.ops.mesh.primitive_uv_sphere_add(
                radius=sphere['radius'],
                location=sphere['center']
            )
            obj = bpy.context.active_object
            mat = self._get_or_create_material(sphere['color'], "Sphere")
            obj.data.materials.append(mat)
    
    def _create_cylinders(self):
        for cyl in self.data.cylinders:
            p1 = Vector(cyl['point1'])
            p2 = Vector(cyl['point2'])
            mid = (p1 + p2) / 2
            height = (p2 - p1).length
            
            bpy.ops.mesh.primitive_cylinder_add(
                radius=cyl['radius'],
                depth=height,
                location=mid
            )
            obj = bpy.context.active_object
            obj.rotation_euler = (p2 - p1).to_track_quat('-Z', 'Y').to_euler()
            
            mat = self._get_or_create_material(cyl['color'], "Cylinder")
            obj.data.materials.append(mat)
    
    def _create_polygons(self):
        for i, poly in enumerate(self.data.polygons):
            mesh = bpy.data.meshes.new(f"PolyMesh_{i}")
            mesh.from_pydata(poly['vertices'], [], [list(range(len(poly['vertices'])))])  
            mesh.update()
            obj = bpy.data.objects.new(f"Polygon_{i}", mesh)
            bpy.context.collection.objects.link(obj)
            
            # Apply the color material to the polygon (reuses existing material if same color)
            if poly.get('color'):
                mat = self._get_or_create_material(poly['color'], "Polygon")
                obj.data.materials.append(mat)
    
    def _set_camera(self):
        if 'location' in self.data.camera_data:
            cam = bpy.data.cameras.new("Camera")
            cam_obj = bpy.data.objects.new("Camera", cam)
            bpy.context.collection.objects.link(cam_obj)
            cam_obj.location = self.data.camera_data['location']
            bpy.context.scene.camera = cam_obj


def import_pov_to_blender(pov_file: str):
    parser = POVParser(pov_file)
    parser.parse()
    builder = BlenderCrystalBuilder(parser)
    builder.build()


if __name__ == "__main__":
    pov_path = "../BiI3.pov"
    import_pov_to_blender(pov_path)
    print('listoquito')