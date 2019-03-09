/*platte profielzylinder*/


b=50;  //Breite bodenplatte
h=80; //Länge bodenplatte
d=4;   //Dicke bodenplatte
a=18; // abstand motor mount 
pmm=-29;  // position motor mount 
za=40; //Zapfen zur mitte


difference(){
     /*bodenplatte*/
    union(){ 
    translate([-b/2,-h/2,0])
    roundedCube([b,h,d]); 
    //cube([b,h,d],true);
    translate([0,h/2-20,6])
    cube([20,40,10],true);
/*   zapfencl(b/2,35);
    zapfencl(b/2,-45);  
    zapfencr(-b/2,35);
    zapfencr(-b/2,-45); 
*/
        

    }
    /* ausschnitt für schloss */
translate([0,h/2-10,-3]) 
   cylinder(23,8.8,8.8,false);
translate([0,h/2-30.1,-3])
    cylinder(20,5.4,5.4,false);
translate([0,h/2-22.5,7])
    cube([10.8,16,20],true);

motor_mount1(-18,-20);
motor_mount1(18,-20);
 
    /*Zapfen für den deckel*/
 /*   zapfenl(-b/2,za);    
    zapfenl(-b/2,-za);
    zapfenr(b/2-5,za);
    zapfenr(b/2-5,-za);
    mounthole(a,5);  // Loch unter motormount 
    mounthole(-a,5); // Loch unter motormount
*/


 

} 
motor_mount(-17.3,-20);
motor_mount(17.3,-20);
//motormount(a,pmm);  //position relativ zur mitte
//motormount(-a,pmm); //position relativ zur mitte 
/*
Akku  NCR18650B
Durchmesser	18,20 mm ± 0,1 mm
Höhe		65,00 mm ± 0,15 mm
*/
battb=0 ; //länge Batt
battw=0 ; //breite Batt
batth=0 ; //höhe Batt
bpos=-0 ; //pos Batt
bohrh=0 ; //höhe Bohrung
bohrd=0 ; //radius Bohrung

difference(){
translate([-25,bpos]){
        cube([battw,battb,batth],false);

    }
    union(){     
    translate([-9.5,-1,bohrh]){
    rotate([90,0,0]){
    cylinder(71,bohrd,bohrd,10,true);  //Battfach
    }}
translate([9.5,-1,bohrh]){
    rotate([90,0,0]){
    cylinder(71,bohrd,bohrd,10,true);  //Batfacht 
    }}
    }
    }
module zapfenr(x,y)
    {
        linear_extrude(height = 20, center = true, convexity = 0, twist = 0)
        polygon (points=[[x,y],[x,y+20],[x+5,y+15],[x+5,y+5]]);       
    }

module  motor_mount (mmpos1,mmpos2){
   
      difference(){
        translate([mmpos1,mmpos2,0]){
        linear_extrude(height = 20, center = false){
        rotate (30,0,0)
        regular_polygon(6,4.5);
        }
        translate([-2.5,2.5])
        linear_extrude(height = 20, center = false){
        square ([5,10]);
        }    
        translate([-2.5,-12.5])
        linear_extrude(height = 20, center = false){
        square ([5,10]);
        }    
        
        }
        union(){
        translate([mmpos1,mmpos2,0]){
        linear_extrude(height = 17, center = false){
        rotate (30,0,0)
        regular_polygon(6,3.5);
        }
        }
        translate([mmpos1,mmpos2,0]){
        linear_extrude(height = 21, center = false){
        circle(1.7);
        }
        }
        }
        }
      
    }
module  motor_mount1 (mmpos1,mmpos2){
   
        translate([mmpos1,mmpos2,-1]){
        linear_extrude(height = 5, center = false){
        rotate (30,0,0)
        regular_polygon(6,3.5);
        }
        }
      
    }
    
 module regular_polygon(order, r=1){
 	angles=[ for (i = [0:order-1]) i*(360/order) ];
 	coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
 	polygon(coords);
 }
 
 
    
module zapfenl(x,y)
    {
        linear_extrude(height = 20, center = true, convexity = 0, twist = 0)
        //polygon (points=[[x+0,y+5],[x+0,y+15],[x+0,y+20],[x+0,y+0]]); 
         polygon (points=[[x,y+5],[x,y+15],[x+5,y+20],[x+5,y+0]]);
    }
    
module  zapfencl(x,y)
        {
         translate([x-10,y,-d/2]){
         cube([10,30,10],false);
         }
        }

module  zapfencr(x,y)
        {
         translate([x,y,-d/2]){
         cube([10,30,10],false);
         }
        }
        
module  mounthole(x,y)
        {
            b=5;
    linear_extrude(height=20, center = true)
       polygon (points=[[x-b/2,y],[x+b/2,y],[x+b/2,y+20],[x-b/2,y+20] ]); 
    }
  
module  motormount(x,y)
    {
       difference(){
       b=5; //breite halter
       i=2; //mass innen Halter
       a=3;       
       linear_extrude(height=17,center = false)    
       polygon (points=[[x-b,y-2],[x+b,y-2],[x+b,y+22],[x-b,y+22]]);
       linear_extrude(height=20, center = false)
       polygon (points=[[x-i,y+2],[x+i,y+2],[x+i,y+18],[x-i,y+18]]);
       linear_extrude(height=15, center = false)
       polygon(points=[[x-a,y],[x+a,y],[x+a,y+20],[x-a,y+20]]);
       }
    }
   
module roundedCube(dim, r=7, x=false, y=false, z=true, xcorners=[true,true,true,true], ycorners=[true,true,true,true], zcorners=[true,true,true,true], center=false, $fn=128)
{
	translate([(center==true ? (-(dim[0]/2)) : 0), (center==true ? (-(dim[1]/2)) : 0), (center==true ? (-(dim[2]/2)) : 0)])
	{
		difference()
		{
			cube(dim);

			if(z)
			{
				translate([0, 0, -0.1])
				{
					if(zcorners[0])
						translate([0, dim[1]-r]) { rotateAround([0, 0, 90], [r/2, r/2, 0]) { meniscus(h=dim[2], r=r, fn=$fn); } }
					if(zcorners[1])
						translate([dim[0]-r, dim[1]-r]) { meniscus(h=dim[2], r=r, fn=$fn); }
					if(zcorners[2])
						translate([dim[0]-r, 0]) { rotateAround([0, 0, -90], [r/2, r/2, 0]) { meniscus(h=dim[2], r=r, fn=$fn); } }
					if(zcorners[3])
						rotateAround([0, 0, -180], [r/2, r/2, 0]) { meniscus(h=dim[2], r=r, fn=$fn); }
				}
			}

			if(y)
			{
				translate([0, -0.1, 0])
				{
					if(ycorners[0])
						translate([0, 0, dim[2]-r]) { rotateAround([0, 180, 0], [r/2, 0, r/2]) { rotateAround([-90, 0, 0], [0, r/2, r/2]) { meniscus(h=dim[1], r=r); } } }
					if(ycorners[1])
						translate([dim[0]-r, 0, dim[2]-r]) { rotateAround([0, -90, 0], [r/2, 0, r/2]) { rotateAround([-90, 0, 0], [0, r/2, r/2]) { meniscus(h=dim[1], r=r); } } }
					if(ycorners[2])
						translate([dim[0]-r, 0]) { rotateAround([-90, 0, 0], [0, r/2, r/2]) { meniscus(h=dim[1], r=r); } }
					if(ycorners[3])
						rotateAround([0, 90, 0], [r/2, 0, r/2]) { rotateAround([-90, 0, 0], [0, r/2, r/2]) { meniscus(h=dim[1], r=r); } }
				}
			}

			if(x)
			{
				translate([-0.1, 0, 0])
				{
					if(xcorners[0])
						translate([0, dim[1]-r]) { rotateAround([0, 90, 0], [r/2, 0, r/2]) { meniscus(h=dim[0], r=r); } }
					if(xcorners[1])
						translate([0, dim[1]-r, dim[2]-r]) { rotateAround([90, 0, 0], [0, r/2, r/2]) { rotateAround([0, 90, 0], [r/2, 0, r/2]) { meniscus(h=dim[0], r=r); } } }
					if(xcorners[2])
						translate([0, 0, dim[2]-r]) { rotateAround([180, 0, 0], [0, r/2, r/2]) { rotateAround([0, 90, 0], [r/2, 0, r/2]) { meniscus(h=dim[0], r=r); } } }
					if(xcorners[3])
						rotateAround([-90, 0, 0], [0, r/2, r/2]) { rotateAround([0, 90, 0], [r/2, 0, r/2]) { meniscus(h=dim[0], r=r); } }
				}
			}
		}
	}
}

module meniscus(h, r, fn=128)
{
	$fn=fn;

	difference()
	{
		cube([r+0.2, r+0.2, h+0.2]);
		translate([0, 0, -0.1]) { cylinder(h=h+0.4, r=r); }
	}
}

module rotateAround(a, v) { translate(v) { rotate(a) { translate(-v) { children(); } } } }



    
