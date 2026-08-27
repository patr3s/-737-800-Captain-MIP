/*
  737-800 Captain MIP – PFD + ND carrier v1
  Units: mm

  The PFD and ND frames are independent printable modules. Their spacing is
  deliberately NOT fixed by the printed geometry. Two slotted joiner bars let
  the final DU spacing be set during assembly and locked with M3 screws.

  Export by changing `part` to:
    "pfd", "nd", "joiner", "top_interface", "assembly"
*/

$fn = 48;

part = "assembly";

du_size = 203.2;
screen_opening = 169.7;
carrier_border = 8;
carrier_size = du_size + 2 * carrier_border; // 219.2 mm
carrier_thickness = 5;
opening_clearance = 1.0;

// Service mounting points inherited from the reconstructed DU bezel v2 spec.
// Adjust only if the physical bezel uses a different pattern.
bezel_hole_edge = 10;
bezel_hole_pitch = du_size - 2 * bezel_hole_edge; // 183.2 mm
m3_clearance = 3.4;
m3_heatset_pocket = 4.6;
m3_heatset_depth = 4.2;

// Assembly preview only. Printed parts do not encode this dimension.
// Final nominal gap derived from the measured 445 mm BenQ envelope.
// 2 * 219.2 + 7.0 = 445.4 mm total carrier width.
preview_du_gap = 7.0;

joiner_length = 92;
joiner_width = 18;
joiner_thickness = 5;
joiner_slot_length = 34;

top_interface_width = 80;
top_interface_depth = 22;
top_interface_thickness = 5;

module rounded_box(size, radius=3) {
    hull() {
        for (x = [radius, size[0] - radius])
            for (y = [radius, size[1] - radius])
                translate([x, y, 0]) cylinder(h=size[2], r=radius);
    }
}

module slot(length, diameter, height) {
    hull() {
        translate([-length/2, 0, 0]) cylinder(h=height, d=diameter);
        translate([ length/2, 0, 0]) cylinder(h=height, d=diameter);
    }
}

module bezel_mount_holes() {
    offset = carrier_border + bezel_hole_edge;
    for (x = [offset, offset + bezel_hole_pitch])
        for (y = [offset, offset + bezel_hole_pitch])
            translate([x, y, -0.1]) cylinder(h=carrier_thickness+0.2, d=m3_clearance);
}

module rear_heatset_pockets() {
    offset = carrier_border + bezel_hole_edge;
    for (x = [offset, offset + bezel_hole_pitch])
        for (y = [offset, offset + bezel_hole_pitch])
            translate([x, y, carrier_thickness-m3_heatset_depth])
                cylinder(h=m3_heatset_depth+0.1, d=m3_heatset_pocket);
}

module joining_holes(side="left") {
    x = side == "left" ? carrier_size - 12 : 12;
    for (y = [42, carrier_size - 42])
        translate([x, y, -0.1]) cylinder(h=carrier_thickness+0.2, d=m3_clearance);
}

module top_interface_holes() {
    for (x = [carrier_size/2 - 25, carrier_size/2 + 25])
        translate([x, carrier_size - 10, -0.1])
            slot(8, m3_clearance, carrier_thickness+0.2);
}

module center_mip_interface_holes() {
    for (y = [carrier_size/2 - 45, carrier_size/2, carrier_size/2 + 45])
        translate([carrier_size - 10, y, -0.1])
            rotate([0,0,90]) slot(10, m3_clearance, carrier_thickness+0.2);
}

module cradle_interface_holes(side="left") {
    x = side == "left" ? 10 : carrier_size - 10;
    for (y = [38, carrier_size - 38])
        translate([x, y, -0.1])
            rotate([0,0,90]) slot(8, m3_clearance, carrier_thickness+0.2);
}

module carrier_frame(side="left") {
    difference() {
        rounded_box([carrier_size, carrier_size, carrier_thickness], 4);
        translate([(carrier_size-screen_opening-opening_clearance)/2,
                   (carrier_size-screen_opening-opening_clearance)/2, -0.1])
            cube([screen_opening+opening_clearance,
                  screen_opening+opening_clearance,
                  carrier_thickness+0.2]);
        bezel_mount_holes();
        rear_heatset_pockets();
        joining_holes(side);
        top_interface_holes();
        cradle_interface_holes(side);
        if (side == "right") center_mip_interface_holes();
    }
}

module joiner_bar() {
    difference() {
        rounded_box([joiner_length, joiner_width, joiner_thickness], 3);
        for (x = [joiner_length*0.25, joiner_length*0.75])
            translate([x, joiner_width/2, -0.1])
                slot(joiner_slot_length, m3_clearance, joiner_thickness+0.2);
    }
}

module top_interface() {
    difference() {
        rounded_box([top_interface_width, top_interface_depth, top_interface_thickness], 3);
        for (x = [15, top_interface_width-15])
            translate([x, top_interface_depth/2, -0.1])
                slot(8, m3_clearance, top_interface_thickness+0.2);
    }
}

module assembly_preview() {
    color("steelblue") carrier_frame("left");
    translate([carrier_size + preview_du_gap, 0, 0])
        color("slategray") carrier_frame("right");
    for (y = [33, carrier_size-51])
        translate([carrier_size-joiner_length/2+preview_du_gap/2, y, carrier_thickness])
            color("orange") joiner_bar();
    for (x = [carrier_size/2-top_interface_width/2,
              carrier_size+preview_du_gap+carrier_size/2-top_interface_width/2])
        translate([x, carrier_size-top_interface_depth+1, carrier_thickness])
            color("darkorange") top_interface();
}

if (part == "pfd") carrier_frame("left");
else if (part == "nd") carrier_frame("right");
else if (part == "joiner") joiner_bar();
else if (part == "top_interface") top_interface();
else assembly_preview();
