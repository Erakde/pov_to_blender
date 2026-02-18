// Persistence of Vision Ray Tracer Scene Description File
// File: ?.pov
// Vers: 3.5
// Desc: Created by Diamond Crystal and Molecular Structure Visualization
//       Version 4.6.8
//       (c) 1997-2022 Crystal Impact GbR, Bonn, Germany.
//       www.crystalimpact.com
//       Author: Dr. Klaus Brandenburg
// Date: Wednesday, February 11, 2026 00:59:36
// Auth: Edu
//

#version 3.5;

#include "colors.inc"
#include "textures.inc"
#include "skies.inc"
#include "stones.inc"
#include "woods.inc"
#include "metals.inc"
#include "glass.inc"
#include "ash.map"
#include "bubinga.map"
#include "cedar.map"
#include "orngwood.map"
#include "teak.map"
#include "whiteash.map"
#include "benediti.map"
#include "marbteal.map"
#include "pinkmarb.map"
#include "rdgranit.map"

global_settings {
  assumed_gamma 2.2
  ambient_light color rgb <1, 1, 1>
}

camera {
  orthographic
  location  <0.0, 0.0, -72.6985>
  right     x*image_width/image_height
  angle     17.0615
  look_at   <0.0, 0.0, -0>
}

background { color rgb<0.196078, 0.6, 0.8> }

// -- 1 light source(s) --

light_source {	// #1
  <100,100,-100>
  color rgb <1,1,1>
  parallel
  point_at <0,0,0>
  fade_distance 1
  fade_power 0
}

// -- Special declarations not included in POV-Ray's INC files --

#declare Ash = texture {
  pigment {
    P_WoodGrain3A
    color_map { M_Ash }
    scale 2
    rotate x*90
    }
  };

#declare Bubinga = texture {
  pigment {
    P_WoodGrain3A
    color_map { M_Bubinga }
    scale 2
    rotate x*90
    }
  };

#declare Cedar = texture {
  pigment {
    P_WoodGrain6A
    color_map { M_Cedar }
    }
    normal {     // Copy of WoodGrain6A pigment
      wood 0.4
      turbulence <0.05, 0.08, 1>
      octaves 4
      scale <0.15, .15, 1>
      translate -x*100
    }
    scale 0.6
    rotate z*35
    rotate x*85
  };

#declare OrangeWood = texture {
  pigment {
    P_WoodGrain3A
    color_map { M_Orangewood }
    scale 2
    rotate x*85
    }
  };

#declare Teak = texture {
  pigment {
    P_WoodGrain3A
    color_map { M_Teak }
    scale 2
    rotate x*90
    }
  };

#declare WhiteAsh = texture {
  pigment {
    P_WoodGrain3A
    color_map { M_WhiteAsh }
    rotate x*85
    }
  };

#declare Benediti = texture {
  pigment {
    crackle
    turbulence 0.8
    octaves 5
    lambda 2.25
    omega 0.707
    color_map { M_Benediti }
    phase 0.97
    scale 1.3
    }
  finish { specular 0.85 roughness 0.0015 }
  };

#declare MarbTeal = texture {
  pigment {
    agate
    color_map { M_MarbTeal }
    scale 0.25
    }
  finish { specular 0.35 roughness 0.015 }
  };

#declare PinkMarb = texture {
  pigment {
    granite
    color_map { M_PinkMarb }
    scale 2
    }
  finish { specular 0.35 roughness 0.015 }
  };

#declare RedGranite = texture {
  pigment {
    granite
    color_map { M_RedGranite }
    scale 0.4
    }
  finish { specular 0.75 roughness 0.0085 }
  };

// -- This plane defines the floor --

// -- No floor to be shown (boundNone) --


////////////////////////////////////////////////////////////

// -- Global finish, normal, and interior settings for objects
//    that use no individual material properties --

#declare F_Global = finish {
  ambient 0.1
  diffuse 0.6
  brilliance 1
  phong 0
  phong_size 40
  specular 0
  roughness 0.05
  metallic 0
  reflection {
    0
    0
    fresnel on
    metallic 0
  }
  conserve_energy
}
#declare N_Global = normal {
  bumps 0
  turbulence 0
  scale 1
}
#declare I_Global = interior {
  ior 1
  fade_power 1000
  fade_distance 0
  fade_color <0,0,0>
}

// -- Pigments, finishes, normals, and interiors for 10 atom designs --

#declare P_AD0_1 = pigment { color rgb<0.752941, 0.752941, 0.752941> filter 0 transmit 0 }
#declare P_AD0_2 = pigment { color rgb<1, 1, 1> filter 0 transmit 0 }
#declare P_AD0_3 = pigment { color rgb<0.752941, 0.752941, 0.752941> filter 0 transmit 0 }
#declare F_AD0 = finish { F_Global }
#declare N_AD0 = normal { N_Global }
#declare I_AD0 = interior { I_Global }
#declare M_AD0 = material { texture { pigment { P_AD0_1 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare P_AD1_1 = pigment { color rgb<1, 0, 1> filter 0 transmit 0 }
#declare P_AD1_2 = pigment { color rgb<1, 1, 1> filter 0 transmit 0 }
#declare P_AD1_3 = pigment { color rgb<1, 0, 1> filter 0 transmit 0 }
#declare F_AD1 = finish { F_Global }
#declare N_AD1 = normal { N_Global }
#declare I_AD1 = interior { I_Global }
#declare M_AD1 = material { texture { pigment { P_AD1_1 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare P_AD2_1 = pigment { color rgb<0, 0, 0> filter 0 transmit 0 }
#declare P_AD2_2 = pigment { color rgb<1, 1, 1> filter 0 transmit 0 }
#declare P_AD2_3 = pigment { color rgb<1, 1, 1> filter 0 transmit 0 }
#declare F_AD2 = finish { F_Global }
#declare N_AD2 = normal { N_Global }
#declare I_AD2 = interior { I_Global }
#declare M_AD2 = material { texture { pigment { P_AD2_1 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare P_AD3_1 = pigment { color rgb<0.752941, 0.752941, 0.752941> filter 0 transmit 0 }
#declare P_AD3_2 = pigment { color rgb<1, 1, 1> filter 0 transmit 0 }
#declare P_AD3_3 = pigment { color rgb<0.752941, 0.752941, 0.752941> filter 0 transmit 0 }
#declare F_AD3 = finish { F_Global }
#declare N_AD3 = normal { N_Global }
#declare I_AD3 = interior { I_Global }
#declare M_AD3 = material { texture { pigment { P_AD3_1 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare P_AD4_1 = pigment { color rgb<1, 0, 1> filter 0 transmit 0 }
#declare P_AD4_2 = pigment { color rgb<1, 1, 1> filter 0 transmit 0 }
#declare P_AD4_3 = pigment { color rgb<1, 0, 1> filter 0 transmit 0 }
#declare F_AD4 = finish { F_Global }
#declare N_AD4 = normal { N_Global }
#declare I_AD4 = interior { I_Global }
#declare M_AD4 = material { texture { pigment { P_AD4_1 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare P_AD5_1 = pigment { color rgb<0.6, 0.6, 0.6> filter 0 transmit 0 }
#declare P_AD5_2 = pigment { color rgb<1, 1, 1> filter 0 transmit 0 }
#declare P_AD5_3 = pigment { color rgb<1, 1, 1> filter 0 transmit 0 }
#declare F_AD5 = finish { F_Global }
#declare N_AD5 = normal { N_Global }
#declare I_AD5 = interior { I_Global }
#declare M_AD5 = material { texture { pigment { P_AD5_1 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare P_AD6_1 = pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 }
#declare P_AD6_2 = pigment { color rgb<0, 0, 1> filter 0 transmit 0 }
#declare P_AD6_3 = pigment { color rgb<1, 1, 0> filter 0 transmit 0 }
#declare F_AD6 = finish { F_Global }
#declare N_AD6 = normal { N_Global }
#declare I_AD6 = interior { I_Global }
#declare M_AD6 = material { texture { pigment { P_AD6_1 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare P_AD7_1 = pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 }
#declare P_AD7_2 = pigment { color rgb<1, 1, 1> filter 0 transmit 0 }
#declare P_AD7_3 = pigment { color rgb<1, 0, 1> filter 0 transmit 0 }
#declare F_AD7 = finish { F_Global }
#declare N_AD7 = normal { N_Global }
#declare I_AD7 = interior { I_Global }
#declare M_AD7 = material { texture { pigment { P_AD7_1 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare P_AD8_1 = pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 }
#declare P_AD8_2 = pigment { color rgb<0, 0, 1> filter 0 transmit 0 }
#declare P_AD8_3 = pigment { color rgb<1, 1, 0> filter 0 transmit 0 }
#declare F_AD8 = finish { F_Global }
#declare N_AD8 = normal { N_Global }
#declare I_AD8 = interior { I_Global }
#declare M_AD8 = material { texture { pigment { P_AD8_1 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare P_AD9_1 = pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 }
#declare P_AD9_2 = pigment { color rgb<1, 1, 1> filter 0 transmit 0 }
#declare P_AD9_3 = pigment { color rgb<1, 0, 1> filter 0 transmit 0 }
#declare F_AD9 = finish { F_Global }
#declare N_AD9 = normal { N_Global }
#declare I_AD9 = interior { I_Global }
#declare M_AD9 = material { texture { pigment { P_AD9_1 } finish { F_Global } normal { N_Global } } interior { I_Global } }

// -- Pigments, finishes, normals, and interiors for 4 bond designs --

#declare M_BD0 = material { texture { pigment { color rgb<0.6, 0.6, 0.6> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BD1 = material { texture { pigment { color rgb<0.6, 0.6, 0.6> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BD2 = material { texture { pigment { color rgb<1, 1, 1> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BD3 = material { texture { pigment { color rgb<0.6, 0.6, 0.6> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }

// -- Pigments, finishes, normals, and interiors for two-colored bonds --

#declare M_BDA0_15 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_15 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_16 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_16 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_17 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_17 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_18 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_18 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_19 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_19 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_20 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_20 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_21 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_21 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_22 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_22 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_23 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_23 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_24 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_24 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_25 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_25 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_26 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_26 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_27 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_27 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_28 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_28 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_29 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_29 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_30 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_30 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_31 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_31 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_32 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_32 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_33 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_33 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_34 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_34 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_35 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_35 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_36 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_36 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_37 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_37 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_38 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_38 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_39 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_39 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_40 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_40 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_41 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_41 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_42 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_42 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_43 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_43 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_44 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_44 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_45 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_45 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_46 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_46 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_47 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_47 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_48 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_48 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_49 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_49 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_50 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_50 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_51 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_51 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_52 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_52 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_53 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_53 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_54 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_54 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_55 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_55 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_56 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_56 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_57 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_57 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_58 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_58 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_59 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_59 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_60 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_60 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_61 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_61 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_62 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_62 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_63 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_63 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_64 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_64 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_65 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_65 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_66 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_66 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_67 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_67 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_68 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_68 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_69 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_69 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_70 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_70 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_71 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_71 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_72 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_72 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_73 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_73 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_74 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_74 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_75 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_75 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_76 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_76 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_77 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_77 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_78 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_78 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_79 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_79 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_80 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_80 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_81 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_81 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_82 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_82 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_83 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_83 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_84 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_84 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_85 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_85 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA0_86 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }
#declare M_BDA1_86 = material { texture { pigment { color rgb<1, 0.6, 0> filter 0 transmit 0 } finish { F_Global } normal { N_Global } } interior { I_Global } }

// -- Coming now: 70 atoms --

union {
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <-1.87909,-3.25445,6.90541> }	// #5: "Bi1"
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <5.63691,-3.25445,6.90541> }	// #6: "Bi1" (1+x, y, z)
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <-5.63709,3.25459,6.90541> }	// #7: "Bi1" (x, 1+y, z)
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <1.87891,3.25459,6.90541> }	// #8: "Bi1" (1+x, 1+y, z)
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <1.87914,-1.08490,-0.00143> }	// #9: "Bi1" (2/3+x, 1/3+y, 1/3+z)
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <-1.87932,1.08505,-6.90701> }	// #10: "Bi1" (1/3+x, 2/3+y, 2/3+z)
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <-1.87909,-3.25445,-6.90575> }	// #11: "Bi1" (-x, -y, 1-z)
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <5.63691,-3.25445,-6.90575> }	// #12: "Bi1" (1-x, -y, 1-z)
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <-5.63709,3.25459,-6.90575> }	// #13: "Bi1" (-x, 1-y, 1-z)
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <1.87891,3.25459,-6.90575> }	// #14: "Bi1" (1-x, 1-y, 1-z)
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <1.87914,-1.08490,6.90668> }	// #15: "Bi1" (2/3-x, 1/3-y, 1/3-z)
  sphere { <0,0,0>, 0.5000  material { M_AD8 }  translate <-1.87932,1.08505,0.00110> }	// #16: "Bi1" (1/3-x, 2/3-y, 2/3-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-0.58820,-1.04478,8.69092> }	// #17: "I1"
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-4.34620,1.12517,1.78534> }	// #18: "I1" (-1/3+x, 1/3+y, 1/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <3.16981,1.12517,1.78534> }	// #19: "I1" (2/3+x, 1/3+y, 1/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <3.16958,-3.21433,-5.12150> }	// #20: "I1" (1/3+x, -1/3+y, 2/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-0.58843,3.29472,-5.12150> }	// #21: "I1" (1/3+x, 2/3+y, 2/3+z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <3.07783,-3.24134,8.69092> }	// #22: "I1" (1-y, x-y, z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-0.68017,3.26771,8.69092> }	// #23: "I1" (1-y, 1+x-y, z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-0.68040,-1.07179,1.78534> }	// #24: "I1" (2/3-y, 1/3+x-y, 1/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-4.43817,1.09776,-5.12150> }	// #25: "I1" (1/3-y, 2/3+x-y, 2/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <3.07783,1.09776,-5.12150> }	// #26: "I1" (4/3-y, 2/3+x-y, 2/3+z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-4.36890,1.03181,8.69092> }	// #27: "I1" (-x+y, 1-x, z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <3.14710,1.03181,8.69092> }	// #28: "I1" (1-x+y, 1-x, z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <3.14733,-3.30769,1.78534> }	// #29: "I1" (2/3-x+y, 1/3-x, 1/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-0.61067,3.20136,1.78534> }	// #30: "I1" (2/3-x+y, 4/3-x, 1/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-0.61067,-1.13774,-5.12150> }	// #31: "I1" (1/3-x+y, 2/3-x, 2/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <0.58801,1.04492,-8.69126> }	// #32: "I1" (1-x, 1-y, 1-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <0.58824,-3.29458,5.12116> }	// #33: "I1" (2/3-x, 1/3-y, 1/3-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-3.16976,3.21447,5.12116> }	// #34: "I1" (2/3-x, 4/3-y, 1/3-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-3.16999,-1.12503,-1.78568> }	// #35: "I1" (1/3-x, 2/3-y, 2/3-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <4.34601,-1.12503,-1.78568> }	// #36: "I1" (4/3-x, 2/3-y, 2/3-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <0.67999,-3.26756,-8.69126> }	// #37: "I1" (y, -x+y, 1-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-3.07801,3.24148,-8.69126> }	// #38: "I1" (y, 1-x+y, 1-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-3.07801,-1.09762,5.12116> }	// #39: "I1" (-1/3+y, 1/3-x+y, 1/3-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <4.43799,-1.09762,5.12116> }	// #40: "I1" (2/3+y, 1/3-x+y, 1/3-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <0.68022,1.07193,-1.78568> }	// #41: "I1" (1/3+y, 2/3-x+y, 2/3-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-3.14728,-1.03167,-8.69126> }	// #42: "I1" (x-y, x, 1-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <4.36872,-1.03167,-8.69126> }	// #43: "I1" (1+x-y, x, 1-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <0.61049,1.13788,5.12116> }	// #44: "I1" (2/3+x-y, 1/3+x, 1/3-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <0.61049,-3.20122,-1.78568> }	// #45: "I1" (1/3+x-y, -1/3+x, 2/3-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-3.14751,3.30783,-1.78568> }	// #46: "I1" (1/3+x-y, 2/3+x, 2/3-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-4.43795,-3.24152,8.69133> }	// #55: "I1" (-y, x-y, z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-0.61068,-5.47742,8.69133> }	// #56: "I1" (-x+y, -x, z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-3.14728,-5.37134,5.12157> }	// #57: "I1" (-1/3+x-y, -2/3+x, 1/3-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <6.92803,-1.04496,8.69133> }	// #58: "I1" (1+x, y, z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <6.90532,-5.47742,8.69133> }	// #59: "I1" (1-x+y, -x, z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <8.10447,-3.29476,5.12157> }	// #60: "I1" (5/3-x, 1/3-y, 1/3-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <4.36872,-5.37134,5.12157> }	// #61: "I1" (2/3+x-y, -2/3+x, 1/3-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-4.34597,5.46409,8.69133> }	// #62: "I1" (x, 1+y, z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-8.19595,3.26753,8.69133> }	// #63: "I1" (-y, 1+x-y, z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-6.83578,5.41125,5.12157> }	// #64: "I1" (-1/3+y, 4/3-x+y, 1/3-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <-6.90528,1.13770,5.12157> }	// #65: "I1" (-1/3+x-y, 1/3+x, 1/3-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <3.17003,5.46409,8.69133> }	// #66: "I1" (1+x, 1+y, z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <4.34647,3.21429,5.12157> }	// #67: "I1" (5/3-x, 4/3-y, 1/3-z)
  sphere { <0,0,0>, 0.6000  material { M_AD9 }  translate <0.68022,5.41125,5.12157> }	// #68: "I1" (2/3+y, 4/3-x+y, 1/3-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-4.34620,-3.21451,-5.12109> }	// #69: "I1" (-2/3+x, -1/3+y, 2/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-0.67995,-5.41147,-5.12109> }	// #70: "I1" (1/3-y, -1/3+x-y, 2/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-3.16976,-5.46431,-8.69085> }	// #71: "I1" (-x, -y, 1-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <6.83605,-5.41147,-5.12109> }	// #72: "I1" (4/3-y, -1/3+x-y, 2/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <6.90555,-1.13792,-5.12109> }	// #73: "I1" (4/3-x+y, 2/3-x, 2/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <4.34624,-5.46431,-8.69085> }	// #74: "I1" (1-x, -y, 1-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <8.19622,-3.26774,-8.69085> }	// #75: "I1" (1+y, -x+y, 1-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-8.10420,3.29454,-5.12109> }	// #76: "I1" (-2/3+x, 2/3+y, 2/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-4.36845,5.37113,-5.12109> }	// #77: "I1" (1/3-x+y, 5/3-x, 2/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-6.92776,1.04474,-8.69085> }	// #78: "I1" (-x, 1-y, 1-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <-6.90505,5.47720,-8.69085> }	// #79: "I1" (x-y, 1+x, 1-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <3.14755,5.37113,-5.12109> }	// #80: "I1" (4/3-x+y, 5/3-x, 2/3+z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <4.43822,3.24131,-8.69085> }	// #81: "I1" (1+y, 1-x+y, 1-z)
  sphere { <0,0,0>, 0.0600  material { M_AD9 }  translate <0.61095,5.47720,-8.69085> }	// #82: "I1" (1+x-y, 1+x, 1-z)

  rotate <78.72119,51.45667,-8.86587>
}

// -- Coming now: 72 bonds, 0 H-bonds, 0 contacts --


union {
  cylinder { <-1.879090,-3.254452,6.905411>, <-1.233643,-2.149614,7.798166>, 0.090000  material { M_BDA0_15 } }	// #16: "Bi1" -- "I1"
  cylinder { <-1.233643,-2.149614,7.798166>, <-0.588195,-1.044777,8.690922>, 0.090000  material { M_BDA1_15 } }
  cylinder { <-1.879090,-3.254452,6.905411>, <-0.645423,-3.274514,6.013288>, 0.090000  material { M_BDA0_16 } }	// #17: "Bi1" -- "I1"
  cylinder { <-0.645423,-3.274514,6.013288>, <0.588244,-3.294577,5.121164>, 0.090000  material { M_BDA1_16 } }
  cylinder { <-1.879090,-3.254452,6.905411>, <-2.478549,-2.176033,6.013288>, 0.090000  material { M_BDA0_17 } }	// #18: "Bi1" -- "I1"
  cylinder { <-2.478549,-2.176033,6.013288>, <-3.078008,-1.097615,5.121164>, 0.090000  material { M_BDA1_17 } }
  cylinder { <5.636910,-3.254452,6.905411>, <4.357368,-3.247897,7.798166>, 0.090000  material { M_BDA0_18 } }	// #19: "Bi1" -- "I1"
  cylinder { <4.357368,-3.247897,7.798166>, <3.077827,-3.241342,8.690922>, 0.090000  material { M_BDA1_18 } }
  cylinder { <5.636910,-3.254452,6.905411>, <5.037451,-2.176033,6.013288>, 0.090000  material { M_BDA0_19 } }	// #20: "Bi1" -- "I1"
  cylinder { <5.037451,-2.176033,6.013288>, <4.437992,-1.097615,5.121164>, 0.090000  material { M_BDA1_19 } }
  cylinder { <-5.637090,3.254595,6.905411>, <-5.002996,2.143202,7.798166>, 0.090000  material { M_BDA0_20 } }	// #21: "Bi1" -- "I1"
  cylinder { <-5.002996,2.143202,7.798166>, <-4.368903,1.031810,8.690922>, 0.090000  material { M_BDA1_20 } }
  cylinder { <-5.637090,3.254595,6.905411>, <-4.403423,3.234532,6.013288>, 0.090000  material { M_BDA0_21 } }	// #22: "Bi1" -- "I1"
  cylinder { <-4.403423,3.234532,6.013288>, <-3.169756,3.214469,5.121164>, 0.090000  material { M_BDA1_21 } }
  cylinder { <1.878909,3.254595,6.905411>, <0.599368,3.261150,7.798166>, 0.090000  material { M_BDA0_22 } }	// #23: "Bi1" -- "I1"
  cylinder { <0.599368,3.261150,7.798166>, <-0.680173,3.267705,8.690922>, 0.090000  material { M_BDA1_22 } }
  cylinder { <1.878909,3.254595,6.905411>, <2.513003,2.143202,7.798166>, 0.090000  material { M_BDA0_23 } }	// #24: "Bi1" -- "I1"
  cylinder { <2.513003,2.143202,7.798166>, <3.147097,1.031810,8.690922>, 0.090000  material { M_BDA1_23 } }
  cylinder { <1.878909,3.254595,6.905411>, <1.244701,2.196239,6.013288>, 0.090000  material { M_BDA0_24 } }	// #25: "Bi1" -- "I1"
  cylinder { <1.244701,2.196239,6.013288>, <0.610493,1.137883,5.121164>, 0.090000  material { M_BDA1_24 } }
  cylinder { <1.879139,-1.084902,6.906675>, <0.645472,-1.064839,7.798799>, 0.090000  material { M_BDA0_47 } }	// #48: "Bi1" -- "I1"
  cylinder { <0.645472,-1.064839,7.798799>, <-0.588195,-1.044777,8.690922>, 0.090000  material { M_BDA1_47 } }
  cylinder { <1.879139,-1.084902,6.906675>, <2.478483,-2.163122,7.798799>, 0.090000  material { M_BDA0_48 } }	// #49: "Bi1" -- "I1"
  cylinder { <2.478483,-2.163122,7.798799>, <3.077827,-3.241342,8.690922>, 0.090000  material { M_BDA1_48 } }
  cylinder { <1.879139,-1.084902,6.906675>, <2.513118,-0.026546,7.798799>, 0.090000  material { M_BDA0_49 } }	// #50: "Bi1" -- "I1"
  cylinder { <2.513118,-0.026546,7.798799>, <3.147097,1.031810,8.690922>, 0.090000  material { M_BDA1_49 } }
  cylinder { <1.879139,-1.084902,6.906675>, <1.233692,-2.189740,6.013920>, 0.090000  material { M_BDA0_50 } }	// #51: "Bi1" -- "I1"
  cylinder { <1.233692,-2.189740,6.013920>, <0.588244,-3.294577,5.121164>, 0.090000  material { M_BDA1_50 } }
  cylinder { <1.879139,-1.084902,6.906675>, <3.158566,-1.091259,6.013920>, 0.090000  material { M_BDA0_51 } }	// #52: "Bi1" -- "I1"
  cylinder { <3.158566,-1.091259,6.013920>, <4.437992,-1.097615,5.121164>, 0.090000  material { M_BDA1_51 } }
  cylinder { <1.879139,-1.084902,6.906675>, <1.244816,0.026491,6.013920>, 0.090000  material { M_BDA0_52 } }	// #53: "Bi1" -- "I1"
  cylinder { <1.244816,0.026491,6.013920>, <0.610493,1.137883,5.121164>, 0.090000  material { M_BDA1_52 } }
  cylinder { <-1.879090,-3.254452,6.905411>, <-3.158518,-3.247986,7.798371>, 0.090000  material { M_BDA0_59 } }	// #60: "Bi1" -- "I1"
  cylinder { <-3.158518,-3.247986,7.798371>, <-4.437946,-3.241521,8.691331>, 0.090000  material { M_BDA1_59 } }
  cylinder { <-1.879090,-3.254452,6.905411>, <-1.244883,-4.365934,7.798371>, 0.090000  material { M_BDA0_60 } }	// #61: "Bi1" -- "I1"
  cylinder { <-1.244883,-4.365934,7.798371>, <-0.610676,-5.477416,8.691331>, 0.090000  material { M_BDA1_60 } }
  cylinder { <-1.879090,-3.254452,6.905411>, <-2.513185,-4.312897,6.013492>, 0.090000  material { M_BDA0_61 } }	// #62: "Bi1" -- "I1"
  cylinder { <-2.513185,-4.312897,6.013492>, <-3.147280,-5.371343,5.121572>, 0.090000  material { M_BDA1_61 } }
  cylinder { <5.636910,-3.254452,6.905411>, <6.282470,-2.149704,7.798371>, 0.090000  material { M_BDA0_62 } }	// #63: "Bi1" -- "I1"
  cylinder { <6.282470,-2.149704,7.798371>, <6.928030,-1.044956,8.691331>, 0.090000  material { M_BDA1_62 } }
  cylinder { <5.636910,-3.254452,6.905411>, <6.271116,-4.365934,7.798371>, 0.090000  material { M_BDA0_63 } }	// #64: "Bi1" -- "I1"
  cylinder { <6.271116,-4.365934,7.798371>, <6.905323,-5.477416,8.691331>, 0.090000  material { M_BDA1_63 } }
  cylinder { <5.636910,-3.254452,6.905411>, <6.870690,-3.274604,6.013492>, 0.090000  material { M_BDA0_64 } }	// #65: "Bi1" -- "I1"
  cylinder { <6.870690,-3.274604,6.013492>, <8.104470,-3.294756,5.121572>, 0.090000  material { M_BDA1_64 } }
  cylinder { <5.636910,-3.254452,6.905411>, <5.002814,-4.312897,6.013492>, 0.090000  material { M_BDA0_65 } }	// #66: "Bi1" -- "I1"
  cylinder { <5.002814,-4.312897,6.013492>, <4.368719,-5.371343,5.121572>, 0.090000  material { M_BDA1_65 } }
  cylinder { <-5.637090,3.254595,6.905411>, <-4.991529,4.359343,7.798371>, 0.090000  material { M_BDA0_66 } }	// #67: "Bi1" -- "I1"
  cylinder { <-4.991529,4.359343,7.798371>, <-4.345969,5.464090,8.691331>, 0.090000  material { M_BDA1_66 } }
  cylinder { <-5.637090,3.254595,6.905411>, <-6.916518,3.261060,7.798371>, 0.090000  material { M_BDA0_67 } }	// #68: "Bi1" -- "I1"
  cylinder { <-6.916518,3.261060,7.798371>, <-8.195947,3.267526,8.691331>, 0.090000  material { M_BDA1_67 } }
  cylinder { <-5.637090,3.254595,6.905411>, <-6.236436,4.332923,6.013492>, 0.090000  material { M_BDA0_68 } }	// #69: "Bi1" -- "I1"
  cylinder { <-6.236436,4.332923,6.013492>, <-6.835782,5.411252,5.121572>, 0.090000  material { M_BDA1_68 } }
  cylinder { <-5.637090,3.254595,6.905411>, <-6.271185,2.196149,6.013492>, 0.090000  material { M_BDA0_69 } }	// #70: "Bi1" -- "I1"
  cylinder { <-6.271185,2.196149,6.013492>, <-6.905281,1.137704,5.121572>, 0.090000  material { M_BDA1_69 } }
  cylinder { <1.878909,3.254595,6.905411>, <2.524470,4.359343,7.798371>, 0.090000  material { M_BDA0_70 } }	// #71: "Bi1" -- "I1"
  cylinder { <2.524470,4.359343,7.798371>, <3.170030,5.464090,8.691331>, 0.090000  material { M_BDA1_70 } }
  cylinder { <1.878909,3.254595,6.905411>, <3.112690,3.234442,6.013492>, 0.090000  material { M_BDA0_71 } }	// #72: "Bi1" -- "I1"
  cylinder { <3.112690,3.234442,6.013492>, <4.346470,3.214290,5.121572>, 0.090000  material { M_BDA1_71 } }
  cylinder { <1.878909,3.254595,6.905411>, <1.279563,4.332923,6.013492>, 0.090000  material { M_BDA0_72 } }	// #73: "Bi1" -- "I1"
  cylinder { <1.279563,4.332923,6.013492>, <0.680217,5.411252,5.121572>, 0.090000  material { M_BDA1_72 } }

  rotate <78.72119,51.45667,-8.86587>
}

// -- Coming now: 12 cell edges --

union {
  cylinder { <-1.879127,-3.254515,10.359035>, <5.636873,-3.254515,10.359035>, 0.058159  material { M_BD3 } }	// #4: * -- *
  cylinder { <-1.879127,-3.254515,10.359035>, <-5.637127,3.254531,10.359035>, 0.058159  material { M_BD3 } }	// #5: * -- *
  cylinder { <-1.879127,-3.254515,10.359035>, <-1.879127,-3.254515,-10.358966>, 0.058159  material { M_BD3 } }	// #6: * -- *
  cylinder { <5.636873,-3.254515,10.359035>, <1.878873,3.254531,10.359035>, 0.058159  material { M_BD3 } }	// #7: * -- *
  cylinder { <5.636873,-3.254515,10.359035>, <5.636873,-3.254515,-10.358966>, 0.058159  material { M_BD3 } }	// #8: * -- *
  cylinder { <-5.637127,3.254531,10.359035>, <1.878873,3.254531,10.359035>, 0.058159  material { M_BD3 } }	// #9: * -- *
  cylinder { <-5.637127,3.254531,10.359035>, <-5.637127,3.254531,-10.358966>, 0.058159  material { M_BD3 } }	// #10: * -- *
  cylinder { <1.878873,3.254531,10.359035>, <1.878873,3.254531,-10.358966>, 0.058159  material { M_BD3 } }	// #11: * -- *
  cylinder { <-1.879127,-3.254515,-10.358966>, <5.636873,-3.254515,-10.358966>, 0.058159  material { M_BD3 } }	// #12: * -- *
  cylinder { <-1.879127,-3.254515,-10.358966>, <-5.637127,3.254531,-10.358966>, 0.058159  material { M_BD3 } }	// #13: * -- *
  cylinder { <5.636873,-3.254515,-10.358966>, <1.878873,3.254531,-10.358966>, 0.058159  material { M_BD3 } }	// #14: * -- *
  cylinder { <-5.637127,3.254531,-10.358966>, <1.878873,3.254531,-10.358966>, 0.058159  material { M_BD3 } }	// #15: * -- *

  rotate <78.72119,51.45667,-8.86587>
}

// -- Coming now: 7 polyhedra --

union {	// #1: centered at: "Bi1"
#declare M_PD0 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> transmit 0.4 } finish { F_Global } normal { N_Global } } interior { I_Global } }
  union {
    polygon { 4 <3.16981, 1.12517, 1.78534> <3.14733, -3.30769, 1.78534> <-0.68040, -1.07179, 1.78534> <3.16981, 1.12517, 1.78534> }
    polygon { 4 <3.16981, 1.12517, 1.78534> <-0.68040, -1.07179, 1.78534> <0.68022, 1.07193, -1.78568> <3.16981, 1.12517, 1.78534> }
    polygon { 4 <3.16981, 1.12517, 1.78534> <4.34601, -1.12503, -1.78568> <3.14733, -3.30769, 1.78534> <3.16981, 1.12517, 1.78534> }
    polygon { 4 <3.16981, 1.12517, 1.78534> <0.68022, 1.07193, -1.78568> <4.34601, -1.12503, -1.78568> <3.16981, 1.12517, 1.78534> }
    polygon { 4 <-0.68040, -1.07179, 1.78534> <3.14733, -3.30769, 1.78534> <0.61049, -3.20122, -1.78568> <-0.68040, -1.07179, 1.78534> }
    polygon { 4 <-0.68040, -1.07179, 1.78534> <0.61049, -3.20122, -1.78568> <0.68022, 1.07193, -1.78568> <-0.68040, -1.07179, 1.78534> }
    polygon { 4 <3.14733, -3.30769, 1.78534> <4.34601, -1.12503, -1.78568> <0.61049, -3.20122, -1.78568> <3.14733, -3.30769, 1.78534> }
    polygon { 4 <4.34601, -1.12503, -1.78568> <0.68022, 1.07193, -1.78568> <0.61049, -3.20122, -1.78568> <4.34601, -1.12503, -1.78568> }
  material { M_PD0 }
  }
  union {
    cylinder { <3.16981, 1.12517, 1.78534>, <3.14733, -3.30769, 1.78534>, 0.058 }
    cylinder { <3.14733, -3.30769, 1.78534>, <-0.68040, -1.07179, 1.78534>, 0.058 }
    cylinder { <-0.68040, -1.07179, 1.78534>, <3.16981, 1.12517, 1.78534>, 0.058 }
    cylinder { <3.16981, 1.12517, 1.78534>, <-0.68040, -1.07179, 1.78534>, 0.058 }
    cylinder { <-0.68040, -1.07179, 1.78534>, <0.68022, 1.07193, -1.78568>, 0.058 }
    cylinder { <0.68022, 1.07193, -1.78568>, <3.16981, 1.12517, 1.78534>, 0.058 }
    cylinder { <3.16981, 1.12517, 1.78534>, <4.34601, -1.12503, -1.78568>, 0.058 }
    cylinder { <4.34601, -1.12503, -1.78568>, <3.14733, -3.30769, 1.78534>, 0.058 }
    cylinder { <3.14733, -3.30769, 1.78534>, <3.16981, 1.12517, 1.78534>, 0.058 }
    cylinder { <3.16981, 1.12517, 1.78534>, <0.68022, 1.07193, -1.78568>, 0.058 }
    cylinder { <0.68022, 1.07193, -1.78568>, <4.34601, -1.12503, -1.78568>, 0.058 }
    cylinder { <4.34601, -1.12503, -1.78568>, <3.16981, 1.12517, 1.78534>, 0.058 }
    cylinder { <-0.68040, -1.07179, 1.78534>, <3.14733, -3.30769, 1.78534>, 0.058 }
    cylinder { <3.14733, -3.30769, 1.78534>, <0.61049, -3.20122, -1.78568>, 0.058 }
    cylinder { <0.61049, -3.20122, -1.78568>, <-0.68040, -1.07179, 1.78534>, 0.058 }
    cylinder { <-0.68040, -1.07179, 1.78534>, <0.61049, -3.20122, -1.78568>, 0.058 }
    cylinder { <0.61049, -3.20122, -1.78568>, <0.68022, 1.07193, -1.78568>, 0.058 }
    cylinder { <0.68022, 1.07193, -1.78568>, <-0.68040, -1.07179, 1.78534>, 0.058 }
    cylinder { <3.14733, -3.30769, 1.78534>, <4.34601, -1.12503, -1.78568>, 0.058 }
    cylinder { <4.34601, -1.12503, -1.78568>, <0.61049, -3.20122, -1.78568>, 0.058 }
    cylinder { <0.61049, -3.20122, -1.78568>, <3.14733, -3.30769, 1.78534>, 0.058 }
    cylinder { <4.34601, -1.12503, -1.78568>, <0.68022, 1.07193, -1.78568>, 0.058 }
    cylinder { <0.68022, 1.07193, -1.78568>, <0.61049, -3.20122, -1.78568>, 0.058 }
    cylinder { <0.61049, -3.20122, -1.78568>, <4.34601, -1.12503, -1.78568>, 0.058 }
  pigment { color rgb<0.752941, 0.752941, 0.752941> }
  }

  rotate <78.72119,51.45667,-8.86587>
}
union {	// #2: centered at: "Bi1"
#declare M_PD1 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> transmit 0.4 } finish { F_Global } normal { N_Global } } interior { I_Global } }
  union {
    polygon { 4 <-0.58843, 3.29472, -5.12150> <-0.61067, -1.13774, -5.12150> <-4.43817, 1.09776, -5.12150> <-0.58843, 3.29472, -5.12150> }
    polygon { 4 <-0.58843, 3.29472, -5.12150> <-4.43817, 1.09776, -5.12150> <-3.07801, 3.24148, -8.69126> <-0.58843, 3.29472, -5.12150> }
    polygon { 4 <-0.58843, 3.29472, -5.12150> <0.58801, 1.04492, -8.69126> <-0.61067, -1.13774, -5.12150> <-0.58843, 3.29472, -5.12150> }
    polygon { 4 <-0.58843, 3.29472, -5.12150> <-3.07801, 3.24148, -8.69126> <0.58801, 1.04492, -8.69126> <-0.58843, 3.29472, -5.12150> }
    polygon { 4 <-4.43817, 1.09776, -5.12150> <-0.61067, -1.13774, -5.12150> <-3.14728, -1.03167, -8.69126> <-4.43817, 1.09776, -5.12150> }
    polygon { 4 <-4.43817, 1.09776, -5.12150> <-3.14728, -1.03167, -8.69126> <-3.07801, 3.24148, -8.69126> <-4.43817, 1.09776, -5.12150> }
    polygon { 4 <-0.61067, -1.13774, -5.12150> <0.58801, 1.04492, -8.69126> <-3.14728, -1.03167, -8.69126> <-0.61067, -1.13774, -5.12150> }
    polygon { 4 <0.58801, 1.04492, -8.69126> <-3.07801, 3.24148, -8.69126> <-3.14728, -1.03167, -8.69126> <0.58801, 1.04492, -8.69126> }
  material { M_PD1 }
  }
  union {
    cylinder { <-0.58843, 3.29472, -5.12150>, <-0.61067, -1.13774, -5.12150>, 0.058 }
    cylinder { <-0.61067, -1.13774, -5.12150>, <-4.43817, 1.09776, -5.12150>, 0.058 }
    cylinder { <-4.43817, 1.09776, -5.12150>, <-0.58843, 3.29472, -5.12150>, 0.058 }
    cylinder { <-0.58843, 3.29472, -5.12150>, <-4.43817, 1.09776, -5.12150>, 0.058 }
    cylinder { <-4.43817, 1.09776, -5.12150>, <-3.07801, 3.24148, -8.69126>, 0.058 }
    cylinder { <-3.07801, 3.24148, -8.69126>, <-0.58843, 3.29472, -5.12150>, 0.058 }
    cylinder { <-0.58843, 3.29472, -5.12150>, <0.58801, 1.04492, -8.69126>, 0.058 }
    cylinder { <0.58801, 1.04492, -8.69126>, <-0.61067, -1.13774, -5.12150>, 0.058 }
    cylinder { <-0.61067, -1.13774, -5.12150>, <-0.58843, 3.29472, -5.12150>, 0.058 }
    cylinder { <-0.58843, 3.29472, -5.12150>, <-3.07801, 3.24148, -8.69126>, 0.058 }
    cylinder { <-3.07801, 3.24148, -8.69126>, <0.58801, 1.04492, -8.69126>, 0.058 }
    cylinder { <0.58801, 1.04492, -8.69126>, <-0.58843, 3.29472, -5.12150>, 0.058 }
    cylinder { <-4.43817, 1.09776, -5.12150>, <-0.61067, -1.13774, -5.12150>, 0.058 }
    cylinder { <-0.61067, -1.13774, -5.12150>, <-3.14728, -1.03167, -8.69126>, 0.058 }
    cylinder { <-3.14728, -1.03167, -8.69126>, <-4.43817, 1.09776, -5.12150>, 0.058 }
    cylinder { <-4.43817, 1.09776, -5.12150>, <-3.14728, -1.03167, -8.69126>, 0.058 }
    cylinder { <-3.14728, -1.03167, -8.69126>, <-3.07801, 3.24148, -8.69126>, 0.058 }
    cylinder { <-3.07801, 3.24148, -8.69126>, <-4.43817, 1.09776, -5.12150>, 0.058 }
    cylinder { <-0.61067, -1.13774, -5.12150>, <0.58801, 1.04492, -8.69126>, 0.058 }
    cylinder { <0.58801, 1.04492, -8.69126>, <-3.14728, -1.03167, -8.69126>, 0.058 }
    cylinder { <-3.14728, -1.03167, -8.69126>, <-0.61067, -1.13774, -5.12150>, 0.058 }
    cylinder { <0.58801, 1.04492, -8.69126>, <-3.07801, 3.24148, -8.69126>, 0.058 }
    cylinder { <-3.07801, 3.24148, -8.69126>, <-3.14728, -1.03167, -8.69126>, 0.058 }
    cylinder { <-3.14728, -1.03167, -8.69126>, <0.58801, 1.04492, -8.69126>, 0.058 }
  pigment { color rgb<0.752941, 0.752941, 0.752941> }
  }

  rotate <78.72119,51.45667,-8.86587>
}
union {	// #3: centered at: "Bi1"
#declare M_PD2 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> transmit 0.4 } finish { F_Global } normal { N_Global } } interior { I_Global } }
  union {
    polygon { 4 <-4.34620, -3.21451, -5.12109> <-0.61067, -1.13774, -5.12150> <-0.67995, -5.41147, -5.12109> <-4.34620, -3.21451, -5.12109> }
    polygon { 4 <-4.34620, -3.21451, -5.12109> <-0.67995, -5.41147, -5.12109> <-3.16976, -5.46431, -8.69085> <-4.34620, -3.21451, -5.12109> }
    polygon { 4 <-4.34620, -3.21451, -5.12109> <-3.14728, -1.03167, -8.69126> <-0.61067, -1.13774, -5.12150> <-4.34620, -3.21451, -5.12109> }
    polygon { 4 <-4.34620, -3.21451, -5.12109> <-3.16976, -5.46431, -8.69085> <-3.14728, -1.03167, -8.69126> <-4.34620, -3.21451, -5.12109> }
    polygon { 4 <-0.67995, -5.41147, -5.12109> <-0.61067, -1.13774, -5.12150> <0.67999, -3.26756, -8.69126> <-0.67995, -5.41147, -5.12109> }
    polygon { 4 <-0.67995, -5.41147, -5.12109> <0.67999, -3.26756, -8.69126> <-3.16976, -5.46431, -8.69085> <-0.67995, -5.41147, -5.12109> }
    polygon { 4 <-0.61067, -1.13774, -5.12150> <-3.14728, -1.03167, -8.69126> <0.67999, -3.26756, -8.69126> <-0.61067, -1.13774, -5.12150> }
    polygon { 4 <-3.16976, -5.46431, -8.69085> <0.67999, -3.26756, -8.69126> <-3.14728, -1.03167, -8.69126> <-3.16976, -5.46431, -8.69085> }
  material { M_PD2 }
  }
  union {
    cylinder { <-4.34620, -3.21451, -5.12109>, <-0.61067, -1.13774, -5.12150>, 0.058 }
    cylinder { <-0.61067, -1.13774, -5.12150>, <-0.67995, -5.41147, -5.12109>, 0.058 }
    cylinder { <-0.67995, -5.41147, -5.12109>, <-4.34620, -3.21451, -5.12109>, 0.058 }
    cylinder { <-4.34620, -3.21451, -5.12109>, <-0.67995, -5.41147, -5.12109>, 0.058 }
    cylinder { <-0.67995, -5.41147, -5.12109>, <-3.16976, -5.46431, -8.69085>, 0.058 }
    cylinder { <-3.16976, -5.46431, -8.69085>, <-4.34620, -3.21451, -5.12109>, 0.058 }
    cylinder { <-4.34620, -3.21451, -5.12109>, <-3.14728, -1.03167, -8.69126>, 0.058 }
    cylinder { <-3.14728, -1.03167, -8.69126>, <-0.61067, -1.13774, -5.12150>, 0.058 }
    cylinder { <-0.61067, -1.13774, -5.12150>, <-4.34620, -3.21451, -5.12109>, 0.058 }
    cylinder { <-4.34620, -3.21451, -5.12109>, <-3.16976, -5.46431, -8.69085>, 0.058 }
    cylinder { <-3.16976, -5.46431, -8.69085>, <-3.14728, -1.03167, -8.69126>, 0.058 }
    cylinder { <-3.14728, -1.03167, -8.69126>, <-4.34620, -3.21451, -5.12109>, 0.058 }
    cylinder { <-0.67995, -5.41147, -5.12109>, <-0.61067, -1.13774, -5.12150>, 0.058 }
    cylinder { <-0.61067, -1.13774, -5.12150>, <0.67999, -3.26756, -8.69126>, 0.058 }
    cylinder { <0.67999, -3.26756, -8.69126>, <-0.67995, -5.41147, -5.12109>, 0.058 }
    cylinder { <-0.67995, -5.41147, -5.12109>, <0.67999, -3.26756, -8.69126>, 0.058 }
    cylinder { <0.67999, -3.26756, -8.69126>, <-3.16976, -5.46431, -8.69085>, 0.058 }
    cylinder { <-3.16976, -5.46431, -8.69085>, <-0.67995, -5.41147, -5.12109>, 0.058 }
    cylinder { <-0.61067, -1.13774, -5.12150>, <-3.14728, -1.03167, -8.69126>, 0.058 }
    cylinder { <-3.14728, -1.03167, -8.69126>, <0.67999, -3.26756, -8.69126>, 0.058 }
    cylinder { <0.67999, -3.26756, -8.69126>, <-0.61067, -1.13774, -5.12150>, 0.058 }
    cylinder { <-3.16976, -5.46431, -8.69085>, <0.67999, -3.26756, -8.69126>, 0.058 }
    cylinder { <0.67999, -3.26756, -8.69126>, <-3.14728, -1.03167, -8.69126>, 0.058 }
    cylinder { <-3.14728, -1.03167, -8.69126>, <-3.16976, -5.46431, -8.69085>, 0.058 }
  pigment { color rgb<0.752941, 0.752941, 0.752941> }
  }

  rotate <78.72119,51.45667,-8.86587>
}
union {	// #4: centered at: "Bi1"
#declare M_PD3 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> transmit 0.4 } finish { F_Global } normal { N_Global } } interior { I_Global } }
  union {
    polygon { 4 <3.16958, -3.21433, -5.12150> <6.90555, -1.13792, -5.12109> <6.83605, -5.41147, -5.12109> <3.16958, -3.21433, -5.12150> }
    polygon { 4 <3.16958, -3.21433, -5.12150> <6.83605, -5.41147, -5.12109> <4.34624, -5.46431, -8.69085> <3.16958, -3.21433, -5.12150> }
    polygon { 4 <3.16958, -3.21433, -5.12150> <4.36872, -1.03167, -8.69126> <6.90555, -1.13792, -5.12109> <3.16958, -3.21433, -5.12150> }
    polygon { 4 <3.16958, -3.21433, -5.12150> <4.34624, -5.46431, -8.69085> <4.36872, -1.03167, -8.69126> <3.16958, -3.21433, -5.12150> }
    polygon { 4 <6.83605, -5.41147, -5.12109> <6.90555, -1.13792, -5.12109> <8.19622, -3.26774, -8.69085> <6.83605, -5.41147, -5.12109> }
    polygon { 4 <6.83605, -5.41147, -5.12109> <8.19622, -3.26774, -8.69085> <4.34624, -5.46431, -8.69085> <6.83605, -5.41147, -5.12109> }
    polygon { 4 <6.90555, -1.13792, -5.12109> <4.36872, -1.03167, -8.69126> <8.19622, -3.26774, -8.69085> <6.90555, -1.13792, -5.12109> }
    polygon { 4 <4.34624, -5.46431, -8.69085> <8.19622, -3.26774, -8.69085> <4.36872, -1.03167, -8.69126> <4.34624, -5.46431, -8.69085> }
  material { M_PD3 }
  }
  union {
    cylinder { <3.16958, -3.21433, -5.12150>, <6.90555, -1.13792, -5.12109>, 0.058 }
    cylinder { <6.90555, -1.13792, -5.12109>, <6.83605, -5.41147, -5.12109>, 0.058 }
    cylinder { <6.83605, -5.41147, -5.12109>, <3.16958, -3.21433, -5.12150>, 0.058 }
    cylinder { <3.16958, -3.21433, -5.12150>, <6.83605, -5.41147, -5.12109>, 0.058 }
    cylinder { <6.83605, -5.41147, -5.12109>, <4.34624, -5.46431, -8.69085>, 0.058 }
    cylinder { <4.34624, -5.46431, -8.69085>, <3.16958, -3.21433, -5.12150>, 0.058 }
    cylinder { <3.16958, -3.21433, -5.12150>, <4.36872, -1.03167, -8.69126>, 0.058 }
    cylinder { <4.36872, -1.03167, -8.69126>, <6.90555, -1.13792, -5.12109>, 0.058 }
    cylinder { <6.90555, -1.13792, -5.12109>, <3.16958, -3.21433, -5.12150>, 0.058 }
    cylinder { <3.16958, -3.21433, -5.12150>, <4.34624, -5.46431, -8.69085>, 0.058 }
    cylinder { <4.34624, -5.46431, -8.69085>, <4.36872, -1.03167, -8.69126>, 0.058 }
    cylinder { <4.36872, -1.03167, -8.69126>, <3.16958, -3.21433, -5.12150>, 0.058 }
    cylinder { <6.83605, -5.41147, -5.12109>, <6.90555, -1.13792, -5.12109>, 0.058 }
    cylinder { <6.90555, -1.13792, -5.12109>, <8.19622, -3.26774, -8.69085>, 0.058 }
    cylinder { <8.19622, -3.26774, -8.69085>, <6.83605, -5.41147, -5.12109>, 0.058 }
    cylinder { <6.83605, -5.41147, -5.12109>, <8.19622, -3.26774, -8.69085>, 0.058 }
    cylinder { <8.19622, -3.26774, -8.69085>, <4.34624, -5.46431, -8.69085>, 0.058 }
    cylinder { <4.34624, -5.46431, -8.69085>, <6.83605, -5.41147, -5.12109>, 0.058 }
    cylinder { <6.90555, -1.13792, -5.12109>, <4.36872, -1.03167, -8.69126>, 0.058 }
    cylinder { <4.36872, -1.03167, -8.69126>, <8.19622, -3.26774, -8.69085>, 0.058 }
    cylinder { <8.19622, -3.26774, -8.69085>, <6.90555, -1.13792, -5.12109>, 0.058 }
    cylinder { <4.34624, -5.46431, -8.69085>, <8.19622, -3.26774, -8.69085>, 0.058 }
    cylinder { <8.19622, -3.26774, -8.69085>, <4.36872, -1.03167, -8.69126>, 0.058 }
    cylinder { <4.36872, -1.03167, -8.69126>, <4.34624, -5.46431, -8.69085>, 0.058 }
  pigment { color rgb<0.752941, 0.752941, 0.752941> }
  }

  rotate <78.72119,51.45667,-8.86587>
}
union {	// #5: centered at: "Bi1"
#declare M_PD4 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> transmit 0.4 } finish { F_Global } normal { N_Global } } interior { I_Global } }
  union {
    polygon { 4 <-8.10420, 3.29454, -5.12109> <-4.36845, 5.37113, -5.12109> <-4.43817, 1.09776, -5.12150> <-8.10420, 3.29454, -5.12109> }
    polygon { 4 <-8.10420, 3.29454, -5.12109> <-4.43817, 1.09776, -5.12150> <-6.92776, 1.04474, -8.69085> <-8.10420, 3.29454, -5.12109> }
    polygon { 4 <-8.10420, 3.29454, -5.12109> <-6.90505, 5.47720, -8.69085> <-4.36845, 5.37113, -5.12109> <-8.10420, 3.29454, -5.12109> }
    polygon { 4 <-8.10420, 3.29454, -5.12109> <-6.92776, 1.04474, -8.69085> <-6.90505, 5.47720, -8.69085> <-8.10420, 3.29454, -5.12109> }
    polygon { 4 <-4.43817, 1.09776, -5.12150> <-4.36845, 5.37113, -5.12109> <-3.07801, 3.24148, -8.69126> <-4.43817, 1.09776, -5.12150> }
    polygon { 4 <-4.43817, 1.09776, -5.12150> <-3.07801, 3.24148, -8.69126> <-6.92776, 1.04474, -8.69085> <-4.43817, 1.09776, -5.12150> }
    polygon { 4 <-4.36845, 5.37113, -5.12109> <-6.90505, 5.47720, -8.69085> <-3.07801, 3.24148, -8.69126> <-4.36845, 5.37113, -5.12109> }
    polygon { 4 <-6.92776, 1.04474, -8.69085> <-3.07801, 3.24148, -8.69126> <-6.90505, 5.47720, -8.69085> <-6.92776, 1.04474, -8.69085> }
  material { M_PD4 }
  }
  union {
    cylinder { <-8.10420, 3.29454, -5.12109>, <-4.36845, 5.37113, -5.12109>, 0.058 }
    cylinder { <-4.36845, 5.37113, -5.12109>, <-4.43817, 1.09776, -5.12150>, 0.058 }
    cylinder { <-4.43817, 1.09776, -5.12150>, <-8.10420, 3.29454, -5.12109>, 0.058 }
    cylinder { <-8.10420, 3.29454, -5.12109>, <-4.43817, 1.09776, -5.12150>, 0.058 }
    cylinder { <-4.43817, 1.09776, -5.12150>, <-6.92776, 1.04474, -8.69085>, 0.058 }
    cylinder { <-6.92776, 1.04474, -8.69085>, <-8.10420, 3.29454, -5.12109>, 0.058 }
    cylinder { <-8.10420, 3.29454, -5.12109>, <-6.90505, 5.47720, -8.69085>, 0.058 }
    cylinder { <-6.90505, 5.47720, -8.69085>, <-4.36845, 5.37113, -5.12109>, 0.058 }
    cylinder { <-4.36845, 5.37113, -5.12109>, <-8.10420, 3.29454, -5.12109>, 0.058 }
    cylinder { <-8.10420, 3.29454, -5.12109>, <-6.92776, 1.04474, -8.69085>, 0.058 }
    cylinder { <-6.92776, 1.04474, -8.69085>, <-6.90505, 5.47720, -8.69085>, 0.058 }
    cylinder { <-6.90505, 5.47720, -8.69085>, <-8.10420, 3.29454, -5.12109>, 0.058 }
    cylinder { <-4.43817, 1.09776, -5.12150>, <-4.36845, 5.37113, -5.12109>, 0.058 }
    cylinder { <-4.36845, 5.37113, -5.12109>, <-3.07801, 3.24148, -8.69126>, 0.058 }
    cylinder { <-3.07801, 3.24148, -8.69126>, <-4.43817, 1.09776, -5.12150>, 0.058 }
    cylinder { <-4.43817, 1.09776, -5.12150>, <-3.07801, 3.24148, -8.69126>, 0.058 }
    cylinder { <-3.07801, 3.24148, -8.69126>, <-6.92776, 1.04474, -8.69085>, 0.058 }
    cylinder { <-6.92776, 1.04474, -8.69085>, <-4.43817, 1.09776, -5.12150>, 0.058 }
    cylinder { <-4.36845, 5.37113, -5.12109>, <-6.90505, 5.47720, -8.69085>, 0.058 }
    cylinder { <-6.90505, 5.47720, -8.69085>, <-3.07801, 3.24148, -8.69126>, 0.058 }
    cylinder { <-3.07801, 3.24148, -8.69126>, <-4.36845, 5.37113, -5.12109>, 0.058 }
    cylinder { <-6.92776, 1.04474, -8.69085>, <-3.07801, 3.24148, -8.69126>, 0.058 }
    cylinder { <-3.07801, 3.24148, -8.69126>, <-6.90505, 5.47720, -8.69085>, 0.058 }
    cylinder { <-6.90505, 5.47720, -8.69085>, <-6.92776, 1.04474, -8.69085>, 0.058 }
  pigment { color rgb<0.752941, 0.752941, 0.752941> }
  }

  rotate <78.72119,51.45667,-8.86587>
}
union {	// #6: centered at: "Bi1"
#declare M_PD5 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> transmit 0.4 } finish { F_Global } normal { N_Global } } interior { I_Global } }
  union {
    polygon { 4 <-0.58843, 3.29472, -5.12150> <3.14755, 5.37113, -5.12109> <3.07783, 1.09776, -5.12150> <-0.58843, 3.29472, -5.12150> }
    polygon { 4 <-0.58843, 3.29472, -5.12150> <3.07783, 1.09776, -5.12150> <0.58801, 1.04492, -8.69126> <-0.58843, 3.29472, -5.12150> }
    polygon { 4 <-0.58843, 3.29472, -5.12150> <0.61095, 5.47720, -8.69085> <3.14755, 5.37113, -5.12109> <-0.58843, 3.29472, -5.12150> }
    polygon { 4 <-0.58843, 3.29472, -5.12150> <0.58801, 1.04492, -8.69126> <0.61095, 5.47720, -8.69085> <-0.58843, 3.29472, -5.12150> }
    polygon { 4 <3.07783, 1.09776, -5.12150> <3.14755, 5.37113, -5.12109> <4.43822, 3.24131, -8.69085> <3.07783, 1.09776, -5.12150> }
    polygon { 4 <3.07783, 1.09776, -5.12150> <4.43822, 3.24131, -8.69085> <0.58801, 1.04492, -8.69126> <3.07783, 1.09776, -5.12150> }
    polygon { 4 <3.14755, 5.37113, -5.12109> <0.61095, 5.47720, -8.69085> <4.43822, 3.24131, -8.69085> <3.14755, 5.37113, -5.12109> }
    polygon { 4 <0.58801, 1.04492, -8.69126> <4.43822, 3.24131, -8.69085> <0.61095, 5.47720, -8.69085> <0.58801, 1.04492, -8.69126> }
  material { M_PD5 }
  }
  union {
    cylinder { <-0.58843, 3.29472, -5.12150>, <3.14755, 5.37113, -5.12109>, 0.058 }
    cylinder { <3.14755, 5.37113, -5.12109>, <3.07783, 1.09776, -5.12150>, 0.058 }
    cylinder { <3.07783, 1.09776, -5.12150>, <-0.58843, 3.29472, -5.12150>, 0.058 }
    cylinder { <-0.58843, 3.29472, -5.12150>, <3.07783, 1.09776, -5.12150>, 0.058 }
    cylinder { <3.07783, 1.09776, -5.12150>, <0.58801, 1.04492, -8.69126>, 0.058 }
    cylinder { <0.58801, 1.04492, -8.69126>, <-0.58843, 3.29472, -5.12150>, 0.058 }
    cylinder { <-0.58843, 3.29472, -5.12150>, <0.61095, 5.47720, -8.69085>, 0.058 }
    cylinder { <0.61095, 5.47720, -8.69085>, <3.14755, 5.37113, -5.12109>, 0.058 }
    cylinder { <3.14755, 5.37113, -5.12109>, <-0.58843, 3.29472, -5.12150>, 0.058 }
    cylinder { <-0.58843, 3.29472, -5.12150>, <0.58801, 1.04492, -8.69126>, 0.058 }
    cylinder { <0.58801, 1.04492, -8.69126>, <0.61095, 5.47720, -8.69085>, 0.058 }
    cylinder { <0.61095, 5.47720, -8.69085>, <-0.58843, 3.29472, -5.12150>, 0.058 }
    cylinder { <3.07783, 1.09776, -5.12150>, <3.14755, 5.37113, -5.12109>, 0.058 }
    cylinder { <3.14755, 5.37113, -5.12109>, <4.43822, 3.24131, -8.69085>, 0.058 }
    cylinder { <4.43822, 3.24131, -8.69085>, <3.07783, 1.09776, -5.12150>, 0.058 }
    cylinder { <3.07783, 1.09776, -5.12150>, <4.43822, 3.24131, -8.69085>, 0.058 }
    cylinder { <4.43822, 3.24131, -8.69085>, <0.58801, 1.04492, -8.69126>, 0.058 }
    cylinder { <0.58801, 1.04492, -8.69126>, <3.07783, 1.09776, -5.12150>, 0.058 }
    cylinder { <3.14755, 5.37113, -5.12109>, <0.61095, 5.47720, -8.69085>, 0.058 }
    cylinder { <0.61095, 5.47720, -8.69085>, <4.43822, 3.24131, -8.69085>, 0.058 }
    cylinder { <4.43822, 3.24131, -8.69085>, <3.14755, 5.37113, -5.12109>, 0.058 }
    cylinder { <0.58801, 1.04492, -8.69126>, <4.43822, 3.24131, -8.69085>, 0.058 }
    cylinder { <4.43822, 3.24131, -8.69085>, <0.61095, 5.47720, -8.69085>, 0.058 }
    cylinder { <0.61095, 5.47720, -8.69085>, <0.58801, 1.04492, -8.69126>, 0.058 }
  pigment { color rgb<0.752941, 0.752941, 0.752941> }
  }

  rotate <78.72119,51.45667,-8.86587>
}
union {	// #7: centered at: "Bi1"
#declare M_PD6 = material { texture { pigment { color rgb<0, 0.313726, 0.823529> transmit 0.4 } finish { F_Global } normal { N_Global } } interior { I_Global } }
  union {
    polygon { 4 <-4.34620, 1.12517, 1.78534> <-0.61067, 3.20136, 1.78534> <-0.68040, -1.07179, 1.78534> <-4.34620, 1.12517, 1.78534> }
    polygon { 4 <-4.34620, 1.12517, 1.78534> <-0.68040, -1.07179, 1.78534> <-3.16999, -1.12503, -1.78568> <-4.34620, 1.12517, 1.78534> }
    polygon { 4 <-4.34620, 1.12517, 1.78534> <-3.14751, 3.30783, -1.78568> <-0.61067, 3.20136, 1.78534> <-4.34620, 1.12517, 1.78534> }
    polygon { 4 <-4.34620, 1.12517, 1.78534> <-3.16999, -1.12503, -1.78568> <-3.14751, 3.30783, -1.78568> <-4.34620, 1.12517, 1.78534> }
    polygon { 4 <-0.68040, -1.07179, 1.78534> <-0.61067, 3.20136, 1.78534> <0.68022, 1.07193, -1.78568> <-0.68040, -1.07179, 1.78534> }
    polygon { 4 <-0.68040, -1.07179, 1.78534> <0.68022, 1.07193, -1.78568> <-3.16999, -1.12503, -1.78568> <-0.68040, -1.07179, 1.78534> }
    polygon { 4 <-0.61067, 3.20136, 1.78534> <-3.14751, 3.30783, -1.78568> <0.68022, 1.07193, -1.78568> <-0.61067, 3.20136, 1.78534> }
    polygon { 4 <-3.16999, -1.12503, -1.78568> <0.68022, 1.07193, -1.78568> <-3.14751, 3.30783, -1.78568> <-3.16999, -1.12503, -1.78568> }
  material { M_PD6 }
  }
  union {
    cylinder { <-4.34620, 1.12517, 1.78534>, <-0.61067, 3.20136, 1.78534>, 0.058 }
    cylinder { <-0.61067, 3.20136, 1.78534>, <-0.68040, -1.07179, 1.78534>, 0.058 }
    cylinder { <-0.68040, -1.07179, 1.78534>, <-4.34620, 1.12517, 1.78534>, 0.058 }
    cylinder { <-4.34620, 1.12517, 1.78534>, <-0.68040, -1.07179, 1.78534>, 0.058 }
    cylinder { <-0.68040, -1.07179, 1.78534>, <-3.16999, -1.12503, -1.78568>, 0.058 }
    cylinder { <-3.16999, -1.12503, -1.78568>, <-4.34620, 1.12517, 1.78534>, 0.058 }
    cylinder { <-4.34620, 1.12517, 1.78534>, <-3.14751, 3.30783, -1.78568>, 0.058 }
    cylinder { <-3.14751, 3.30783, -1.78568>, <-0.61067, 3.20136, 1.78534>, 0.058 }
    cylinder { <-0.61067, 3.20136, 1.78534>, <-4.34620, 1.12517, 1.78534>, 0.058 }
    cylinder { <-4.34620, 1.12517, 1.78534>, <-3.16999, -1.12503, -1.78568>, 0.058 }
    cylinder { <-3.16999, -1.12503, -1.78568>, <-3.14751, 3.30783, -1.78568>, 0.058 }
    cylinder { <-3.14751, 3.30783, -1.78568>, <-4.34620, 1.12517, 1.78534>, 0.058 }
    cylinder { <-0.68040, -1.07179, 1.78534>, <-0.61067, 3.20136, 1.78534>, 0.058 }
    cylinder { <-0.61067, 3.20136, 1.78534>, <0.68022, 1.07193, -1.78568>, 0.058 }
    cylinder { <0.68022, 1.07193, -1.78568>, <-0.68040, -1.07179, 1.78534>, 0.058 }
    cylinder { <-0.68040, -1.07179, 1.78534>, <0.68022, 1.07193, -1.78568>, 0.058 }
    cylinder { <0.68022, 1.07193, -1.78568>, <-3.16999, -1.12503, -1.78568>, 0.058 }
    cylinder { <-3.16999, -1.12503, -1.78568>, <-0.68040, -1.07179, 1.78534>, 0.058 }
    cylinder { <-0.61067, 3.20136, 1.78534>, <-3.14751, 3.30783, -1.78568>, 0.058 }
    cylinder { <-3.14751, 3.30783, -1.78568>, <0.68022, 1.07193, -1.78568>, 0.058 }
    cylinder { <0.68022, 1.07193, -1.78568>, <-0.61067, 3.20136, 1.78534>, 0.058 }
    cylinder { <-3.16999, -1.12503, -1.78568>, <0.68022, 1.07193, -1.78568>, 0.058 }
    cylinder { <0.68022, 1.07193, -1.78568>, <-3.14751, 3.30783, -1.78568>, 0.058 }
    cylinder { <-3.14751, 3.30783, -1.78568>, <-3.16999, -1.12503, -1.78568>, 0.058 }
  pigment { color rgb<0.752941, 0.752941, 0.752941> }
  }

  rotate <78.72119,51.45667,-8.86587>
}
