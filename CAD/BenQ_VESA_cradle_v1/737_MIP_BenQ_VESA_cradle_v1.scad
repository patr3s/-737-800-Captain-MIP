/*
  737-800 Captain MIP – BenQ 18.5 inch VESA cradle v1
  Units: mm

  Measured monitor:
    body 445 x 266 x 60
    active area 410 x 232, offset 18 left / 18 top
    VESA 100 x 100
    top-left VESA hole approx. 170 left / 80 top

  Printed joints use M3 + heat-set inserts. The four screws entering the
  monitor must match its native VESA thread (normally M4; verify physically).
*/

$fn = 48;
part = "assembly";

monitor_w = 445;
monitor_h = 266;
monitor_d = 60;
active_w = 410;
active_h = 232;
active_left = 18;
active_top = 18;

carrier_w = 445.4;
carrier_h = 219.2;
carrier_t = 5;
monitor_x = (carrier_w-monitor_w)/2;
monitor_y = 6.25; // aligns active top with the DU opening datum
monitor_front_z = 9;

vesa_pitch = 100;
vesa_tl_x = 170;
vesa_tl_y = 80;
vesa_center_x = monitor_x + vesa_tl_x + vesa_pitch/2;
vesa_center_y = monitor_y + vesa_tl_y + vesa_pitch/2;
vesa_plane_z = monitor_front_z + monitor_d;

plate_w = 170;
plate_h = 170;
plate_t = 7;
plate_corner = 5;
vesa_slot_len = 10; // ±2.4 mm around a 5.2 mm M4 clearance width
vesa_clearance = 5.2;

m3_clearance = 3.2; // calibrated by 5s3a; printed cradle remains on HOLD
m3_insert = 4.6;
m3_slot_len = 10;

wing_len = 150;
wing_w = 26;
wing_t = 7;
depth_arm_len = 78;
depth_arm_w = 26;
depth_arm_t = 7;
side_offset = 12;

stabilizer_len = 76;
stabilizer_w = 24;
stabilizer_t = 7;
pad_hole_d = 3.4;

module rounded_plate(size, r=3) {
    hull() {
        for (x = [r, size[0]-r])
            for (y = [r, size[1]-r])
                translate([x,y,0]) cylinder(h=size[2], r=r);
    }
}

module slot_x(length, diameter, height) {
    hull() {
        translate([-length/2,0,0]) cylinder(h=height,d=diameter);
        translate([ length/2,0,0]) cylinder(h=height,d=diameter);
    }
}

module slot_y(length, diameter, height) {
    rotate([0,0,90]) slot_x(length,diameter,height);
}

module adjust_hole_2d(travel, diameter, height) {
    delta = (travel-diameter)/2;
    hull()
        for (x=[-delta,delta]) for (y=[-delta,delta])
            translate([x,y,0]) cylinder(h=height,d=diameter);
}

module vesa_plate() {
    difference() {
        rounded_plate([plate_w,plate_h,plate_t],plate_corner);

        // Rounded-square openings compensate the approximate C and D
        // dimensions simultaneously (about +/-2.4 mm in both axes).
        for (sx=[-1,1]) for (sy=[-1,1])
            translate([plate_w/2+sx*vesa_pitch/2,
                       plate_h/2+sy*vesa_pitch/2,-0.1])
                adjust_hole_2d(vesa_slot_len,vesa_clearance,plate_t+0.2);

        // M3 wing interfaces: two per side, slotted vertically.
        for (x=[10,plate_w-10]) for (y=[32,plate_h-32])
            translate([x,y,-0.1]) slot_y(m3_slot_len,m3_clearance,plate_t+0.2);

        // Cable/service opening and weight reduction.
        translate([plate_w/2-29,plate_h/2-29,-0.1])
            rounded_plate([58,58,plate_t+0.2],6);
    }
}

module rear_wing() {
    difference() {
        rounded_plate([wing_len,wing_w,wing_t],3);
        for (x=[12,wing_len-12])
            translate([x,wing_w/2,-0.1])
                slot_x(m3_slot_len,m3_clearance,wing_t+0.2);
    }
}

module depth_arm() {
    // Printed flat. Two holes attach to carrier/rear wing with M3 fasteners.
    difference() {
        rounded_plate([depth_arm_len,depth_arm_w,depth_arm_t],3);
        for (x=[11,depth_arm_len-11])
            translate([x,depth_arm_w/2,-0.1])
                slot_x(m3_slot_len,m3_clearance,depth_arm_t+0.2);
    }
}

module bottom_stabilizer() {
    // Carries no main load. An M3 nylon-tip screw or TPU pad lightly contacts
    // the monitor casing and prevents fore/aft vibration.
    difference() {
        rounded_plate([stabilizer_len,stabilizer_w,stabilizer_t],3);
        translate([12,stabilizer_w/2,-0.1])
            slot_x(m3_slot_len,m3_clearance,stabilizer_t+0.2);
        translate([stabilizer_len-12,stabilizer_w/2,-0.1])
            cylinder(h=stabilizer_t+0.2,d=pad_hole_d);
        translate([stabilizer_len-12,stabilizer_w/2,stabilizer_t-4.2])
            cylinder(h=4.3,d=m3_insert);
    }
}

module assembly_preview() {
    // Monitor envelope (transparent); connector side remains unobstructed.
    color([0.12,0.12,0.12,0.45])
        translate([monitor_x,monitor_y,monitor_front_z])
            cube([monitor_w,monitor_h,monitor_d]);

    // Central VESA plate behind monitor.
    color("orange")
        translate([vesa_center_x-plate_w/2,vesa_center_y-plate_h/2,vesa_plane_z])
            vesa_plate();

    // Four rear wings. They terminate outside the monitor sides and attach to
    // the depth arms; all are separate printable pieces.
    for (y=[vesa_center_y-50,vesa_center_y+50]) {
        color("goldenrod")
            translate([-side_offset,y-wing_w/2,vesa_plane_z]) rear_wing();
        color("goldenrod")
            translate([carrier_w+side_offset-wing_len,y-wing_w/2,vesa_plane_z]) rear_wing();
    }

    // Side depth arms shown upright, clear of the monitor side walls.
    for (x=[-side_offset,carrier_w+side_offset-depth_arm_w])
        for (y=[38,carrier_h-38])
            color("steelblue")
                translate([x,y-depth_arm_w/2,0])
                    rotate([0,-90,0]) depth_arm();

    // Two lower stabilizers; contact force is adjusted with M3 screws/pads.
    for (x=[28,carrier_w-28-stabilizer_w])
        color("darkorange")
            translate([x,carrier_h+36,monitor_front_z])
                rotate([0,90,0]) bottom_stabilizer();
}

if (part=="vesa_plate") vesa_plate();
else if (part=="rear_wing") rear_wing();
else if (part=="depth_arm") depth_arm();
else if (part=="bottom_stabilizer") bottom_stabilizer();
else assembly_preview();
