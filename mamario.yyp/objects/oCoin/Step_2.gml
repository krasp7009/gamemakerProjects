if (createdByMystery)
{
	if (y+coinVSP >= originalY+sprite_height)
	{
		coinVSP = 0;
		instance_destroy();
	}
	
	y += coinVSP;
}
else
{
	if (place_meeting(x, y, oPlayer))
		instance_destroy();
}