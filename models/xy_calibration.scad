//------------------------------------------------------
// XY calibration test
// Simple and printable in a couple of minutes
// 5@xes 15/11/2021
//------------------------------------------------------

$fn=50;
font = "Arial:style=Bold";

// 15cm x 15cm ; 1cm steps
cm_x = 15;
cm_y = 15;

height = 0.8;
letter_height =1;
letter_size =8;

union() {
translate([-75,-75,0]) Ruler();
translate([-75,-75,0]) letter("X");
}

module Ruler() {
minkowski()
{

union() {
// X
for (i = [0 : 2 : cm_x-1]) { 
    translate([10*i+1,1,0])
        cube([8,8,height]);
}
//Y
for (j = [0 : 2 : cm_y-1]) { 
    translate([1,10*j+1,0])
        cube([8,8,height]);
}

translate([1,5,0]) cube([cm_x*10-2,4,height]);
translate([5,1,0]) cube([4, cm_y*10-2,height]);

}

  cylinder(r=1,h=1);
}
}

module letter(Txt) {
  color("Red")
  linear_extrude(height = letter_height) {
    text(Txt, size = letter_size, font = font, halign = "center", valign = "center");
  }
}                