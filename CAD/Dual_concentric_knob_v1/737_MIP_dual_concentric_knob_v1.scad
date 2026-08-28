/*
  Provisional dual-concentric encoder knob covers.
  Shaft bores MUST be updated after measuring the selected encoder.
*/

$fn = 96;
part = "assembly";

lower_od = 28;
lower_h = 10;
lower_bore = 8.2; // provisional outer shaft
upper_od = 17;
upper_h = 14;
upper_bore = 6.2; // provisional inner shaft
wall_min = 2.4;
knurl_count = 24;
knurl_depth = 0.7;

module grip_body(od,h,bore) {
    difference() {
        union() {
            cylinder(h=h,d=od);
            for(a=[0:360/knurl_count:359])
                rotate([0,0,a])
                    translate([od/2-knurl_depth/2,0,h/2])
                        cube([knurl_depth,1.2,h],center=true);
        }
        translate([0,0,-0.1]) cylinder(h=h+0.2,d=bore);
        // Radial M3 grub-screw pilot; tap or use a small insert after testing.
        translate([0,-od/2-0.1,h/2]) rotate([-90,0,0])
            cylinder(h=od/2-bore/2+0.2,d=2.6);
    }
}

module lower_knob() { grip_body(lower_od,lower_h,lower_bore); }
module upper_knob() { grip_body(upper_od,upper_h,upper_bore); }

if(part=="lower") lower_knob();
else if(part=="upper") upper_knob();
else {
    color("dimgray") lower_knob();
    color("gray") translate([0,0,lower_h+2]) upper_knob();
}

