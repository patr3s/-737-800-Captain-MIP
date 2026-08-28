/*
  PROVISIONAL non-load-bearing alignment interface for a future fixed steel
  VESA 100 x 100 bracket. Printed parts only locate/stabilize the monitor;
  the steel bracket and MIP structure carry all monitor weight.
*/

$fn = 64;
part = "xy_plate";

m3_clearance = 3.2;
xy_travel = 8.0; // +/-4 mm, exceeds required +/-3 mm
plate_w = 90;
plate_h = 28;
plate_t = 6;
shim_w = 60;
shim_h = 20;

module slot_x(travel,d,h) {
    hull() {
        translate([-travel/2,0,0]) cylinder(h=h,d=d);
        translate([ travel/2,0,0]) cylinder(h=h,d=d);
    }
}

module xy_plate() {
    difference() {
        hull()
            for(x=[3,plate_w-3]) for(y=[3,plate_h-3])
                translate([x,y,0]) cylinder(h=plate_t,r=3);
        for(x=[18,plate_w-18])
            translate([x,plate_h/2,-0.1])
                slot_x(xy_travel,m3_clearance,plate_t+0.2);
    }
}

module z_shim(t) {
    difference() {
        cube([shim_w,shim_h,t]);
        for(x=[10,shim_w-10])
            translate([x,shim_h/2,-0.1])
                slot_x(xy_travel,m3_clearance,t+0.2);
    }
}

if(part=="xy_plate") xy_plate();
else if(part=="shim_05") z_shim(0.5);
else if(part=="shim_10") z_shim(1.0);
else if(part=="shim_20") z_shim(2.0);
else xy_plate();

