/// @description actions
if (place_meeting(x+newHSP, y, oCollision) && !halfBodyInsideBlock)
{
	while(!place_meeting(x+sign(newHSP), y, oCollision))
	{
		x += sign(newHSP); 
	}
	newHSP *= -1;
	image_xscale *= -1;
}

if (place_meeting(x, y+newVSP, oCollision) && !halfBodyInsideBlock)
{
	while(!place_meeting(x, y+sign(newVSP), oCollision))
	{
		y += sign(newVSP);
	}
	newVSP = 0;
}

if (place_meeting(x, y, oPlayer))
{
	oPlayer.isBuffed = true;
	instance_destroy();
}

hsp = newHSP;
vsp = newVSP;

x += hsp;
y += vsp;