/*
  737-800 Captain MIP – complete PFD+ND front fascia v1
  Confirmed monitor envelope: 445 x 266 mm
  Confirmed active LCD: 410 x 232 mm, offset 18 mm left / 18 mm top

  The fascia masks all unused LCD. It is split into seven printable segments;
  no segment exceeds the Anycubic Kobra X 260 x 260 mm bed.
*/

$fn = 64;
part = "assembly";
layer = "base"; // base, face, diffuser

panel_w = 445;
panel_h = 266;
active_w = 410;
active_h = 232;
active_left = 18;
active_top = 18;

du_opening = 169.7;
bezel_size = 203.2;
carrier_gap = 6.6;
du_center_pitch = bezel_size + carrier_gap; // 209.8
active_center_x = active_left + active_w/2;  // 223.0 in monitor coordinates
active_center_y = active_top + active_h/2;  // 134.0
pfd_center_x = active_center_x - du_center_pitch/2; // 118.1
nd_center_x = active_center_x + du_center_pitch/2;  // 327.9
du_center_y = active_center_y;

bezel_cutout_clearance = 0.4;
bezel_cutout = bezel_size + bezel_cutout_clearance; // 203.6
cutout_r = 5.2;

base_t = 3.2;
face_t = 1.0;
diffuser_t = 0.4;
m3_clearance = 3.2;
segment_joiner_t = 3.0;

split_x = panel_w/2;
cutout_top = du_center_y - bezel_cutout/2;
cutout_bottom = du_center_y + bezel_cutout/2;
pfd_cutout_left = pfd_center_x - bezel_cutout/2;
pfd_cutout_right = pfd_center_x + bezel_cutout/2;
nd_cutout_left = nd_center_x - bezel_cutout/2;
nd_cutout_right = nd_center_x + bezel_cutout/2;

module rounded_rect_2d(size,r=3) {
    hull()
        for(x=[r,size[0]-r]) for(y=[r,size[1]-r])
            translate([x,y]) circle(r=r);
}

module fascia_mask_2d() {
    difference() {
        square([panel_w,panel_h]);
        for(cx=[pfd_center_x,nd_center_x])
            translate([cx-bezel_cutout/2,du_center_y-bezel_cutout/2])
                rounded_rect_2d([bezel_cutout,bezel_cutout],cutout_r);
    }
}

module segment_box_2d(name) {
    if(name=="top_left") square([split_x,cutout_top]);
    else if(name=="top_right")
        translate([split_x,0]) square([panel_w-split_x,cutout_top]);
    else if(name=="bottom_left")
        translate([0,cutout_bottom]) square([split_x,panel_h-cutout_bottom]);
    else if(name=="bottom_right")
        translate([split_x,cutout_bottom]) square([panel_w-split_x,panel_h-cutout_bottom]);
    else if(name=="left_rail")
        translate([0,cutout_top]) square([pfd_cutout_left,bezel_cutout]);
    else if(name=="center_rail")
        translate([pfd_cutout_right,cutout_top])
            square([nd_cutout_left-pfd_cutout_right,bezel_cutout]);
    else if(name=="right_rail")
        translate([nd_cutout_right,cutout_top])
            square([panel_w-nd_cutout_right,bezel_cutout]);
}

module seam_holes(name,h) {
    // Top/bottom center seam uses rear joiner plates with two M3 screws.
    if(name=="top_left")
        translate([split_x-25,cutout_top/2,-0.1]) cylinder(h=h+0.2,d=m3_clearance);
    else if(name=="top_right")
        translate([split_x+25,cutout_top/2,-0.1]) cylinder(h=h+0.2,d=m3_clearance);
    else if(name=="bottom_left")
        translate([split_x-25,(cutout_bottom+panel_h)/2,-0.1]) cylinder(h=h+0.2,d=m3_clearance);
    else if(name=="bottom_right")
        translate([split_x+25,(cutout_bottom+panel_h)/2,-0.1]) cylinder(h=h+0.2,d=m3_clearance);
}

module base_segment(name) {
    difference() {
        linear_extrude(base_t)
            intersection() { fascia_mask_2d(); segment_box_2d(name); }
        seam_holes(name,base_t);
        // Rear cable route for the independent panel-dimmer circuit.
        if(name=="top_left" || name=="top_right")
            translate([name=="top_left" ? 12 : split_x+12,cutout_top-8,-0.1])
                cube([(name=="top_left" ? split_x : panel_w-split_x)-24,4,1.2]);
    }
}

module face_segment(name) {
    difference() {
        linear_extrude(face_t)
            intersection() { fascia_mask_2d(); segment_box_2d(name); }
        seam_holes(name,face_t);
    }
}

module diffuser_segment(name) {
    // Diffuser is only required under future illuminated legends on the
    // top/bottom rails. Side/center rails remain opaque masks in v1.
    if(name=="top_left" || name=="top_right" ||
       name=="bottom_left" || name=="bottom_right")
        difference() {
            linear_extrude(diffuser_t)
                intersection() { fascia_mask_2d(); segment_box_2d(name); }
            seam_holes(name,diffuser_t);
        }
}

module center_seam_joiner() {
    difference() {
        hull() {
            for(x=[3,67]) for(y=[3,13])
                translate([x,y,0]) cylinder(h=segment_joiner_t,r=3);
        }
        for(x=[10,60])
            translate([x,8,-0.1]) cylinder(h=segment_joiner_t+0.2,d=m3_clearance);
    }
}

module segment(name) {
    // Move each production segment to its own local print-bed origin.
    ox = name=="top_right" || name=="bottom_right" ? -split_x :
         name=="left_rail" ? 0 :
         name=="center_rail" ? -pfd_cutout_right :
         name=="right_rail" ? -nd_cutout_right : 0;
    oy = name=="bottom_left" || name=="bottom_right" ? -cutout_bottom :
         name=="left_rail" || name=="center_rail" || name=="right_rail" ? -cutout_top : 0;
    translate([ox,oy,0])
        if(layer=="base") base_segment(name);
        else if(layer=="face") face_segment(name);
        else diffuser_segment(name);
}

module assembly_preview() {
    names=["top_left","top_right","bottom_left","bottom_right",
           "left_rail","center_rail","right_rail"];
    for(name=names) {
        color("ivory") base_segment(name);
        color([1,0.8,0.3,0.45]) translate([0,0,base_t]) diffuser_segment(name);
        color([0.10,0.10,0.10]) translate([0,0,base_t+diffuser_t]) face_segment(name);
    }
}

if(part=="joiner") center_seam_joiner();
else if(part=="assembly") assembly_preview();
else segment(part);
