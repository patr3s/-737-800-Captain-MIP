/*
  Backlight multicolor A/B technology coupon, CAL-004
  Tests: light base, multicolor dark face + translucent legends, LED cavity,
  rear service access and dual-concentric encoder panel opening.
*/

$fn = 64;
part = "assembly";

panel_w = 120;
panel_h = 62;
corner_r = 4;
base_t = 3.2;
face_t = 1.0;
legend_b_t = 0.4; // empirically verified by 5s3a: 2 layers at 0.20 mm
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
    // Normal bold font: counters are retained by the separately printed legends.
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

        // Front-open light cavity. Two straight 5 mm COB strips sit on its
        // long edges; the multicolor white legends provide final diffusion.
        translate([8,8,base_t-led_channel_depth])
            linear_extrude(led_channel_depth+0.1)
                difference() {
                    rounded_rect_2d([104,46],4);
                    // Retain a support boss around the provisional encoder.
                    translate([82,23]) circle(d=18);
                }
        translate([108,27,base_t-led_channel_depth])
            cube([12,8,led_channel_depth+0.1]);
    }
}

module face_black() {
    difference() {
        linear_extrude(face_t) rounded_rect_2d([panel_w,panel_h],corner_r);
        mounting_holes(face_t);
        translate([90,31,-0.1]) cylinder(h=face_t+0.2,d=encoder_hole);
        linear_extrude(face_t+0.2) labels_2d();
    }
}

module face_legends(h) {
    linear_extrude(h) labels_2d();
}

module assembly_preview() {
    color("ivory") light_base();
    color([0.12,0.12,0.12]) translate([0,0,base_t]) face_black();
    color([1,0.8,0.25,0.9]) translate([0,0,base_t]) face_legends(legend_b_t);
}

if(part=="base") light_base();
else if(part=="face_black") face_black();
else if(part=="legends_a") face_legends(face_t);
else if(part=="legends_b") face_legends(legend_b_t);
else assembly_preview();
