/*
  737-800 Captain MIP – DU bezel v3, backlit-ready
  Confirmed envelope: 203.2 x 203.2 mm
  Confirmed display opening: 169.7 x 169.7 mm

  Parts: base (light PETG), face (dark PETG), diffuser (white/natural PETG),
  assembly preview. One design is used for both PFD and ND.
*/

$fn = 64;
part = "assembly";

du_size = 203.2;
display_opening = 169.7;
base_t = 3.2;
face_t = 1.2;
diffuser_t = 0.4; // empirically verified by 5s3a
outer_radius = 5;
inner_radius = 3;

m3_clearance = 3.2; // calibrated by 5s3a for Anycubic PETG at flow 0.96
mount_edge = 10;
mount_pitch = du_size - 2*mount_edge; // 183.2, matches carrier v1

led_channel_width = 5.6; // 5 mm COB strip plus placement clearance
led_channel_depth = 2.0;
led_channel_offset = 3.0;
diffuser_ring_width = 4.0;

module rounded_rect_2d(size, r) {
    hull()
        for (x=[r,size[0]-r]) for (y=[r,size[1]-r])
            translate([x,y]) circle(r=r);
}

module frame_2d(outer_size, inner_size, outer_r=5, inner_r=3) {
    difference() {
        rounded_rect_2d([outer_size,outer_size],outer_r);
        translate([(outer_size-inner_size)/2,(outer_size-inner_size)/2])
            rounded_rect_2d([inner_size,inner_size],inner_r);
    }
}

module mount_holes(h) {
    for (x=[mount_edge,mount_edge+mount_pitch])
        for (y=[mount_edge,mount_edge+mount_pitch])
            translate([x,y,-0.1]) cylinder(h=h+0.2,d=m3_clearance);
}

module led_channel() {
    inner = display_opening + 2*led_channel_offset;
    outer = inner + 2*led_channel_width;
    translate([(du_size-outer)/2,(du_size-outer)/2,base_t-led_channel_depth])
        linear_extrude(led_channel_depth+0.1)
            difference() {
                rounded_rect_2d([outer,outer],inner_radius+led_channel_width);
                translate([led_channel_width,led_channel_width])
                    rounded_rect_2d([inner,inner],inner_radius);
            }
}

module cable_exits() {
    // Four optional exits allow the LED feed to leave in the best direction.
    translate([du_size/2-4,0,base_t-led_channel_depth]) cube([8,12,led_channel_depth+0.2]);
    translate([du_size/2-4,du_size-12,base_t-led_channel_depth]) cube([8,12,led_channel_depth+0.2]);
    translate([0,du_size/2-4,base_t-led_channel_depth]) cube([12,8,led_channel_depth+0.2]);
    translate([du_size-12,du_size/2-4,base_t-led_channel_depth]) cube([12,8,led_channel_depth+0.2]);
}

module light_base() {
    difference() {
        linear_extrude(base_t)
            frame_2d(du_size,display_opening,outer_radius,inner_radius);
        mount_holes(base_t);
        led_channel();
        cable_exits();
    }
}

module dark_face() {
    difference() {
        linear_extrude(face_t)
            frame_2d(du_size,display_opening,outer_radius,inner_radius);
        mount_holes(face_t);
    }
}

module diffuser_ring() {
    inner = display_opening + 2*led_channel_offset;
    outer = inner + 2*diffuser_ring_width;
    difference() {
        translate([(du_size-outer)/2,(du_size-outer)/2,0])
            linear_extrude(diffuser_t)
                rounded_rect_2d([outer,outer],inner_radius+diffuser_ring_width);
        translate([(du_size-inner)/2,(du_size-inner)/2,-0.1])
            linear_extrude(diffuser_t+0.2)
                rounded_rect_2d([inner,inner],inner_radius);
        mount_holes(diffuser_t);
    }
}

module assembly_preview() {
    color("ivory") light_base();
    color([1,0.8,0.3,0.6]) translate([0,0,base_t]) diffuser_ring();
    color([0.15,0.15,0.15]) translate([0,0,base_t+diffuser_t]) dark_face();
}

if (part=="base") light_base();
else if (part=="face") dark_face();
else if (part=="diffuser") diffuser_ring();
else assembly_preview();
