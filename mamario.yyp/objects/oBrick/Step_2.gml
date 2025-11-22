/// @description actions
if (y+vsp > originalPosition && colided)
{
	vsp = 0;
	grav = .05;
	y = originalPosition;
	colided = false;
}



y += vsp;
