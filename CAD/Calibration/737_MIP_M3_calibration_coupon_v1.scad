/*
  737-800 Captain MIP – M3 print calibration coupon v1
  Units: mm

  Row A: heat-set insert pockets 4.2 / 4.4 / 4.6 / 4.8 mm
  Row B: M3 clearance holes 3.2 / 3.4 / 3.6 / 3.8 mm
*/

$fn = 64;

coupon_x = 84;
coupon_y = 46;
coupon_z = 6;
corner_r = 3;
test_x = [12, 32, 52, 72];
heatset_d = [4.2, 4.4, 4.6, 4.8];
clearance_d = [3.2, 3.4, 3.6, 3.8];
heatset_depth = 4.2;
pilot_d = 3.0;

module rounded_plate() {
    hull() {
        for (x = [corner_r, coupon_x-corner_r])
            for (y = [corner_r, coupon_y-corner_r])
                translate([x,y,0]) cylinder(h=coupon_z, r=corner_r);
    }
}

module engraved_label(label, x, y) {
    translate([x, y, coupon_z-0.5])
        linear_extrude(0.6)
            text(label, size=4, halign="center", valign="center",
                 font="Liberation Sans:style=Bold");
}

difference() {
    rounded_plate();

    // Heat-set pockets with a smaller pilot hole continuing through the base.
    for (i = [0:3]) {
        translate([test_x[i], 14, coupon_z-heatset_depth])
            cylinder(h=heatset_depth+0.1, d=heatset_d[i]);
        translate([test_x[i], 14, -0.1])
            cylinder(h=coupon_z-heatset_depth+0.2, d=pilot_d);
    }

    // Through-holes for checking printed M3 running clearance.
    for (i = [0:3])
        translate([test_x[i], 34, -0.1])
            cylinder(h=coupon_z+0.2, d=clearance_d[i]);

    // Recessed row markers.
    engraved_label("HS", 5, 14);
    engraved_label("M3", 5, 34);
}

