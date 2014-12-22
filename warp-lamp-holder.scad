holder();

//cap();

//centerHolder();

module centerHolder()
{
	union()
	{
		difference()
		{
			union()
			{
				difference() {
					//base
					cylinder(h = 1, r = 27.5, $fn=50);

					//standoff holes
					for (i = [0:2]) {
						rotate( i * 360 / 3, [0, 0, 1])
							translate([-20,0,-2])
								cylinder(h = 4, r = 3.5, $fn=50);
					}

					translate([18,0,-2])
						cylinder(h = 4, r = 6, $fn=50);
				}		

				//standoffs
				for (i = [0:2]) {
					rotate( i * 360 / 3, [0, 0, 1])
						standoff();
				}
			}

			//chop top off
			translate([0,0,3])
				cylinder(h = 20, r = 30);
		}

		translate([-10,-10,0])
			cube([20,20,45]);

		translate([0,0,45])
			cylinder(h = 15, r = 8, $fn=50);

		difference()
		{
			union()
			{
				translate([-10,6,45])
					cube([4,4,15]);

				translate([6,6,45])
					cube([4,4,15]);

				translate([-10,-10,45])
					cube([4,4,15]);

				translate([6,-10,45])
					cube([4,4,15]);
			}

			rotate([0,0,45])
				translate([-11,-11,45])
					cube([22,22,15]);
		}

		translate([-10,-10,60])
			cube([20,20,5]);
	}
}

module cap()
{
	difference()
	{
		union()
		{
			difference() {
				//base
				cylinder(h = 1, r = 27.5, $fn=50);

				//standoff holes
				for (i = [0:2]) {
					rotate( i * 360 / 3, [0, 0, 1])
						translate([-20,0,-2])
						cylinder(h = 4, r = 3.5, $fn=50);
				}

				wireDrops();
			}		

			//standoffs
			for (i = [0:2]) {
				rotate( i * 360 / 3, [0, 0, 1])
					standoff();
			}
		}

		//chop top off
		translate([0,0,3])
			cylinder(h = 20, r = 30);
	}
}

module holder()
{
	%cube([10,16,2.1], center = true);
	
	union()
	{
		difference() {
			//base
			cylinder(h = 1, r = 27.5, $fn=50);

			//standoff holes
			for (i = [0:2]) {
				rotate( i * 360 / 3, [0, 0, 1])
					translate([-20,0,-2])
					cylinder(h = 4, r = 3.5, $fn=50);
			}

			wireDrops();
		}		

		//standoffs
		for (i = [0:2]) {
			rotate( i * 360 / 3, [0, 0, 1])
				standoff();
		}

		holddown();

		rotate([0,0,180])
			holddown();
	}
}

module wireDrops()
{
	//wire drop
	translate([13,0,-2])
		cylinder(h = 4, r = 3, $fn=50);

	//wire zipties
	translate([-10,5,-2])
		cylinder(h = 4, r = 1.5, $fn=50);

	translate([-10,-5,-2])
		cylinder(h = 4, r = 1.5, $fn=50);
}

module holddown()
{
	difference()
	{
		translate([4,-8,0])
			cube([3,16,3]);

		translate([2.1,-9,-3])
		rotate([0,-30,0])
			cube([5,18,5]);
	}
}

module standoff()
{
	translate([-20,0,0])

	difference()
	{
		union()
		{
			cylinder(h = 16, r = 3.5, $fn=50);

			translate([0,0,15])
				cylinder(h = 6, r = 2, $fn=50);
		}

		translate([0,0,-0.5])
			cylinder(h = 7, r = 2.6, $fn=50);
	}
}