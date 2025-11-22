event_inherited();

hsp = lengthdir_x(spd, directionToPlayer);
vsp = lengthdir_y(spd, directionToPlayer);

if (place_meeting(x+hsp, y, [oCollision, oHelmetZombie]))
{
	var _distance;
	if  (hsp < 1 && hsp > -1 && hsp != 0)
	{
		_distance = hsp/4;
	}
	else
	{
		_distance = sign(hsp);	
	}
	
	while (!place_meeting(x+_distance, y, [oCollision, oHelmetZombie]))
	{
		x += _distance;	
	}
	hsp = 0;
}

if (place_meeting(x, y+vsp, [oCollision, oHelmetZombie]))
{
	var _distance;
	if  (vsp < 1 && vsp > -1 && vsp != 0)
	{
		_distance = vsp/4;
	}
	else
	{
		_distance = sign(vsp);	
	}
	
	while (!place_meeting(x, y+_distance, [oCollision, oHelmetZombie]))
	{
		y += _distance;
	}
	vsp = 0;
}

x += hsp;
y += vsp;