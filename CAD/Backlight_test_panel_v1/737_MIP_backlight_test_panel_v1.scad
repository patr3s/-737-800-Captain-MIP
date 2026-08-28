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
diffuser_t = 0.4; // empirically verified by 5s3a: 2 layers at 0.20 mm
encoder_hole = 10.2; // provisional until the selected encoder is measured
m3_clearance = 3.2; // calibrated on Anycubic Kobra X, Anycubic PETG, flow 0.96
led_channel_depth = 2.0;

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
    // Stencil font keeps counters in P/A/D attached to the face sheet.
    translate([30,42]) text("PANEL",size=8,halign="center",valign="center",
                            font="Stencil:style=Regular");
    translate([30,24]) text("DIM",size=7,halign="center",valign="center",
                            font="Stencil:style=Regular");
    translate([90,44]) text("DUAL",size=6,halign="center",valign="center",
                            font="Stencil:style=Regular");
    translate([90,16]) text("TEST",size=6,halign="center",valign="center",
                            font="Stencil:style=Regular");
    translate([58,31]) polygon(points=[[0,0],[6,4],[0,8]]);
}

module light_base() {
    difference() {
        linear_extrude(base_t) rounded_rect_2d([panel_w,panel_h],corner_r);
        mounting_holes(base_t);
        translate([90,31,-0.1]) cylinder(h=base_t+0.2,d=encoder_hole);

        // Front-open LED channel. A 0.4 mm diffuser sits directly above it,
        // between the LEDs and the dark face layer.
        translate([8,8,base_t-led_channel_depth])
            linear_extrude(led_channel_depth+0.1)
                difference() {
                    rounded_rect_2d([104,46],4);
                    translate([6,6]) rounded_rect_2d([92,34],3);
                }
        translate([108,27,base_t-led_channel_depth])
            cube([12,8,led_channel_depth+0.1]);
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
    color([1,0.8,0.25,0.65]) translate([4,4,base_t]) diffuser();
    color([0.12,0.12,0.12]) translate([0,0,base_t+diffuser_t]) dark_face();
}

if(part=="base") light_base();
else if(part=="face") dark_face();
else if(part=="diffuser") diffuser();
else assembly_preview();
