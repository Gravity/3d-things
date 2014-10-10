cubesize = 1;
thickness = 3;

coin(25);

module monster()
{
	difference()
	{
		union()
		{
			monsterHead();
			
			monsterEar();
			mirror([1,0,0])
				monsterEar();
			
			monsterSideHorn();
			mirror([1,0,0])
				monsterSideHorn();
	
			monsterCenterHorn();
		}	

		union()
		{
			monsterFace();
			mirror([1,0,0])
				monsterFace();
		}
	}
}

module monsterFace()
{
	//eye
	translate([-2.5*cubesize,2*cubesize,0])
		cube([2*cubesize,1*cubesize,1.1*thickness*cubesize], true);
	//nose
	translate([-1*cubesize,1*cubesize,0])
		cube([1.1*cubesize,1.1*cubesize,1.1*thickness*cubesize], true);
	//mouth
	translate([-3*cubesize,-1*cubesize,0])
		cube([1*cubesize,1*cubesize,1.1*thickness*cubesize], true);
	translate([-2*cubesize,-2*cubesize,0])
		cube([1*cubesize,3*cubesize,1.1*thickness*cubesize], true);
	translate([-1*cubesize,-3*cubesize,0])
		cube([1*cubesize,3*cubesize,1.1*thickness*cubesize], true);
	translate([0*cubesize,-2*cubesize,0])
		cube([1*cubesize,3*cubesize,1.1*thickness*cubesize], true);
}

module monsterEar()
{
	translate([-5*cubesize,1*cubesize,0])
		cube([1*cubesize,3*cubesize,thickness*cubesize], true);
	translate([-6*cubesize,2.5*cubesize,0])
		cube([1*cubesize,4*cubesize,thickness*cubesize], true);
}

module monsterHead()
{	
	cube([5*cubesize,11*cubesize,thickness*cubesize], true);
	translate([0,0.5*cubesize,0])
		cube([7*cubesize,10*cubesize,thickness*cubesize], true);
	translate([0,1.5*cubesize,0])
		cube([9*cubesize,8*cubesize,thickness*cubesize], true);
}

module monsterSideHorn()
{
	translate([-4*cubesize,6.5*cubesize,0])
		cube([1*cubesize,2*cubesize,thickness*cubesize], true);
	translate([-3*cubesize,6*cubesize,0])
		cube([1*cubesize,1*cubesize,thickness*cubesize], true);
}

module monsterCenterHorn()
{
	translate([0*cubesize,6.5*cubesize,0])
		cube([3*cubesize,2*cubesize,thickness*cubesize], true);
	translate([0*cubesize,7*cubesize,0])
		cube([1*cubesize,3*cubesize,thickness*cubesize], true);
}

module coin(diameter)
{
	scaleFactor = diameter/25 * 1.2;
	difference()
	{
		cylinder(h=3, r=diameter/2, $fn=100, center=true);

		translate([0,0,1.5])
		cylinder(h=1, r=(diameter-1)/2, $fn=100, center=true);

		union()
		{
			translate([0,-2,1])
			scale([scaleFactor, scaleFactor, 1])
				monster();
		}
	}
}