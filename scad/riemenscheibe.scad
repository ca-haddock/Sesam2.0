
difference(){
union(){
cylinder(3,12,10);
translate([0,0,3])
cylinder(2,10,10,center);
translate([0,0,5])
cylinder(3,10,12);
}
union(){
cylinder(8,3,3);
cylinder(3,5,5);
}
}
translate([1.7,5,3])
rotate([90,0,0])
cube([6,5,8]);

translate([-7.8,5,3])
rotate([90,0,0])
cube([6,5,8]);
