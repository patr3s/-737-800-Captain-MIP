/*
  Master assembly preview for the complete Captain PFD+ND front module v1.
  This file is for integration inspection, not a manufacturing STL.
*/

$fn = 64;

panel_w = 445;
panel_h = 266;
active_w = 410;
active_h = 232;
active_left = 18;
active_top = 18;
carrier_gap = 6.6;
carrier_size = 219.2;
carrier_y = 24.4;
pfd_center_x = 118.1;
nd_center_x = 327.9;
du_center_y = 134;
bezel_size = 203.2;
bezel_cutout = 203.6;

module rounded_rect_2d(size,r=5) {
    hull()
        for(x=[r,size[0]-r]) for(y=[r,size[1]-r])
            translate([x,y]) circle(r=r);
}

module fascia_preview() {
    difference() {
        cube([panel_w,panel_h,4.6]);
        for(cx=[pfd_center_x,nd_center_x])
            translate([cx-bezel_cutout/2,du_center_y-bezel_cutout/2,-0.1])
                linear_extrude(4.8)
                    rounded_rect_2d([bezel_cutout,bezel_cutout],5.2);
    }
}

module bezel_stack(x,y) {
    color("ivory") translate([x,y,0])
        import("../DU_bezel_v3/exports/737-MIP-001_DU-bezel-light-base_v3.stl");
    color([1,0.8,0.25,0.5]) translate([x,y,3.2])
        import("../DU_bezel_v3/exports/737-MIP-001B_DU-bezel-diffuser_v3.stl");
    color([0.08,0.08,0.08]) translate([x,y,3.6])
        import("../DU_bezel_v3/exports/737-MIP-001A_DU-bezel-dark-face_v3.stl");
}

// Measured monitor envelope; the front active plane sits just behind carriers.
color([0.12,0.12,0.12,0.35]) translate([0,0,-65]) cube([445,266,60]);

color("steelblue") translate([0,carrier_y,-5])
    import("../PFD_ND_carrier_v1/exports/737-MIP-003_PFD-carrier_v1.stl");
color("slategray") translate([carrier_size+carrier_gap,carrier_y,-5])
    import("../PFD_ND_carrier_v1/exports/737-MIP-004_ND-carrier_v1.stl");

color([0.18,0.18,0.18]) fascia_preview();
bezel_stack(pfd_center_x-bezel_size/2,du_center_y-bezel_size/2);
bezel_stack(nd_center_x-bezel_size/2,du_center_y-bezel_size/2);

