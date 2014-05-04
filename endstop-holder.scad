thickness = 1.6;

es_offset = 3; //0 for Maker style, 3 for top aligned

module board() {
	difference(){
		translate([0,0,-thickness/2])	
			cube([39.5,16,thickness]);
		translate([2.3,2.55,0])
			cylinder(r=1.5, h=thickness+1, center=true, $fn=24);
		translate([2.3,13.45,0])
			cylinder(r=1.5, h=thickness+1, center=true, $fn=24);
		translate([16.6+es_offset,7.5,thickness/2])
			endstop();
	}
}

module endstop() {
	color("black",.3)
		%cube([19.8,10.2,6.4]);
	translate([5.1,2.5,0])
		cylinder(r=1.175, h=thickness+5, center=true, $fn=24);
	translate([14.6,2.5,0])
		cylinder(r=1.175, h=thickness+5, center=true, $fn=24);
}

board();