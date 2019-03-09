$fn=10; 
difference(){
union(){
cylinder(3,22,20);
translate([0,0,3])
cylinder(2,20,20,center);
translate([0,0,5])
cylinder(3,20,22);
}
union(){
cylinder(13,4,4);
}
}
translate([,6,0])
rotate([90,0,0])
cube([2,8,12]);

