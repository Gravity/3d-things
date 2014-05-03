//color("Gainsboro") import("/Users/Gravity/Downloads/Mechanical_Endstop_v12/mechanical-endstop.dxf");

thickness = 1.5;

module board(posts) {
	union(){
		difference(){
			translate([0,0,-thickness/2])	
				cube([39.5,16,thickness]);
			translate([2.3,2.55,0])
				cylinder(r=1.5, h=thickness+1, center=true, $fn=24);
			translate([2.3,13.45,0])
				cylinder(r=1.5, h=thickness+1, center=true, $fn=24);
			if(!posts){
				translate([16.6,7.5,thickness/2])
					endstop(posts);
			}
		}
		if(posts){
			translate([16.6,7.5,thickness/2])
				endstop(posts);
		}
	}
}

module endstop(posts) {
	color("black",.3)
		%cube([19.8,10.2,6.4]);
	if(posts){
		translate([5.1,2.5,0])
			pin();
		translate([14.6,2.5,0])
			pin();
	} else {
		translate([5.1,2.5,0])
			cylinder(r=1.175, h=thickness+5, center=true, $fn=24);
		translate([14.6,2.5,0])
			cylinder(r=1.175, h=thickness+5, center=true, $fn=24);
	}
}

module pin(){
	difference(){
		union(){
			cylinder(r=1.175, h=6.4, center=false, $fn=24);
			translate([0,0,6.4])
				cylinder(r1=1.175,r2=1.3, h=0.6, center=false, $fn=24);
			translate([0,0,7])
				cylinder(r1=1.3,r2=1, h=1, center=false, $fn=24);
		}
		hull(){
			translate([0,0,3]) rotate([90,0,0])
				cylinder(r=0.25, h=5, center=true, $fn=24);
			translate([0,0,10]) rotate([90,0,0])
				cylinder(r=0.25, h=5, center=true, $fn=24);
		}
	}
}

//color("blue")
board(true);