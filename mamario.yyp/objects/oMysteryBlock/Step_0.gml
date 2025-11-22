/// @description questions
if (colided && isActive)
{
	vsp = (sprite_index == sMysteryBlockON) ? initialSpd : 0;
	vsp = lerp(vsp, 2, grav);
	grav += .05
}
