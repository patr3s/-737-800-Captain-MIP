/*
  Low-cost PFD/ND center alignment and stack fit-check v1.
  Tests the final 6.6 mm physical bezel gap, 40.1 mm visible-opening gap,
  carrier/bezel stack, fascia center mask and an M3 panel seam joiner.

  No heat-set insert is required; use M3 through-bolts and nuts.
*/

$fn = 48;
part = "assembly";

coupon_w = 70;
coupon_h = 80;
carrier_t = 5;
bezel_stack_t = 4.8; // 3.2 base + 0.4 diffuser + 1.2 face
carrier_gap = 6.6;
fascia_center_w = 6.2; // 6.6 gap minus 0.2 mm clearance per bezel edge
visible_border = (203.2-169.7)/2; // 16.75
carrier_open_border = (203.2-170.7)/2; // 16.25
m3_clearance = 3.2;

module rounded_plate(size,r=2) {
    hull()
        for(x=[r,size[0]-r]) for(y=[r,size[1]-r])
            translate([x,y,0]) cylinder(h=size[2],r=r);
}

module carrier_left() {
    difference() {
        cube([coupon_w,coupon_h,carrier_t]);
        translate([-0.1,10,-0.1])
            cube([coupon_w-carrier_open_border+0.1,coupon_h-20,carrier_t+0.2]);
        translate([coupon_w-10,68,-0.1]) cylinder(h=carrier_t+0.2,d=m3_clearance);
        translate([coupon_w-12,8,-0.1]) cylinder(h=carrier_t+0.2,d=m3_clearance);
    }
}

module carrier_right() {
    mirror([1,0,0]) translate([-coupon_w,0,0]) carrier_left();
}

module bezel_left() {
    difference() {
        cube([30,coupon_h,bezel_stack_t]);
        translate([-0.1,10,-0.1])
            cube([30-visible_border+0.1,coupon_h-20,bezel_stack_t+0.2]);
        translate([20,68,-0.1]) cylinder(h=bezel_stack_t+0.2,d=m3_clearance);
    }
}

module bezel_right() {
    mirror([1,0,0]) translate([-30,0,0]) bezel_left();
}

module fascia_center() {
    union() {
        translate([(26-fascia_center_w)/2,10,0])
            cube([fascia_center_w,coupon_h-20,3.2]);
        cube([26,10,3.2]);
        translate([0,coupon_h-10,0]) cube([26,10,3.2]);
    }
}

module carrier_joiner() {
    difference() {
        rounded_plate([92,18,5],3);
        for(x=[23,69])
            translate([x,9,-0.1])
                hull() {
                    translate([-12,0,0]) cylinder(h=5.2,d=m3_clearance);
                    translate([ 12,0,0]) cylinder(h=5.2,d=m3_clearance);
                }
    }
}

module fascia_seam_half() {
    difference() {
        cube([60,30,3.2]);
        translate([50,15,-0.1]) cylinder(h=3.4,d=m3_clearance);
    }
}

module fascia_seam_joiner() {
    difference() {
        rounded_plate([70,16,3],3);
        for(x=[10,60]) translate([x,8,-0.1]) cylinder(h=3.2,d=m3_clearance);
    }
}

module assembly_preview() {
    color("steelblue") carrier_left();
    color("slategray") translate([coupon_w+carrier_gap,0,0]) carrier_right();
    color("ivory") translate([coupon_w-30,0,carrier_t]) bezel_left();
    color("ivory") translate([coupon_w+carrier_gap,0,carrier_t]) bezel_right();
    color("black") translate([coupon_w+(carrier_gap-fascia_center_w)/2-13,
                              0,carrier_t+bezel_stack_t]) fascia_center();
    color("orange") translate([coupon_w-46+carrier_gap/2,0,-5]) carrier_joiner();
}

if(part=="carrier_left") carrier_left();
else if(part=="carrier_right") carrier_right();
else if(part=="bezel_left") bezel_left();
else if(part=="bezel_right") bezel_right();
else if(part=="fascia_center") fascia_center();
else if(part=="carrier_joiner") carrier_joiner();
else if(part=="fascia_seam_left") fascia_seam_half();
else if(part=="fascia_seam_right") mirror([1,0,0]) translate([-60,0,0]) fascia_seam_half();
else if(part=="fascia_seam_joiner") fascia_seam_joiner();
else assembly_preview();

