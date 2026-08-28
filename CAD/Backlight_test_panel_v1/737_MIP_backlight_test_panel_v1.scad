/*
  Backlight technology coupon v1
  Tests: light base, dark face, translucent text/symbols, LED channel,
  diffuser, rear service access and dual-concentric encoder panel opening.
*/

$fn = 64;
part = "assembly";

panel_w = 120;
panel_h = 62;
corner_r = 4;
base_t = 3.2;
face_t = 1.0;
diffuser_t = 0.8;
encoder_hole = 10.2; // provisional until the selected encoder is measured
m3_clearance = 3.4;

module rounded_rect_2d(size,r) {
    hull()
        for(x=[r,size[0]-r]) for(y=[r,size[1]-r])
            translate([x,y]) circle(r=r);
}

module mounting_holes(h) {
    for(x=[7,panel_w-7]) for(y=[7,panel_h-7])
        translate([x,y,-0.1]) cylinder(h=h+0.2,d=m3_clearance);
}

module labels_2d() {
    translate([30,42]) text("PANEL",size=8,halign="center",valign="center",
                            font="Liberation Sans:style=Bold");
    translate([30,24]) text("DIM",size=7,halign="center",valign="center",
                            font="Liberation Sans:style=Bold");
    translate([90,44]) text("DUAL",size=6,halign="center",valign="center",
                            font="Liberation Sans:style=Bold");
    translate([90,16]) text("TEST",size=6,halign="center",valign="center",
                            font="Liberation Sans:style=Bold");
    translate([58,31]) polygon(points=[[0,0],[6,4],[0,8]]);
}

module light_base() {
    difference() {
        linear_extrude(base_t) rounded_rect_2d([panel_w,panel_h],corner_r);
        mounting_holes(base_t);
        translate([90,31,-0.1]) cylinder(h=base_t+0.2,d=encoder_hole);

        // Rear LED channel, open through a service feed at the right edge.
        translate([8,8,-0.1])
            linear_extrude(1.4)
                difference() {
                    rounded_rect_2d([104,46],4);
                    translate([6,6]) rounded_rect_2d([92,34],3);
                }
        translate([108,27,-0.1]) cube([12,8,1.6]);
    }
}

module dark_face() {
    difference() {
        linear_extrude(face_t) rounded_rect_2d([panel_w,panel_h],corner_r);
        mounting_holes(face_t);
        translate([90,31,-0.1]) cylinder(h=face_t+0.2,d=encoder_hole);
        linear_extrude(face_t+0.2) labels_2d();
    }
}

module diffuser() {
    difference() {
        linear_extrude(diffuser_t) rounded_rect_2d([panel_w-8,panel_h-8],3);
        for(x=[3,panel_w-11]) for(y=[3,panel_h-11])
            translate([x,y,-0.1]) cylinder(h=diffuser_t+0.2,d=m3_clearance);
        translate([86,27,-0.1]) cylinder(h=diffuser_t+0.2,d=encoder_hole);
    }
}

module assembly_preview() {
    color("ivory") light_base();
    color([0.12,0.12,0.12]) translate([0,0,base_t]) dark_face();
    color([1,0.8,0.25,0.65]) translate([4,4,-diffuser_t]) diffuser();
}

if(part=="base") light_base();
else if(part=="face") dark_face();
else if(part=="diffuser") diffuser();
else assembly_preview();

