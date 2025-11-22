function scr_collision()
{
	#region stair
	
	if place_meeting(x+sign(hsp), y, obj_stair) && hsp != 0
	{
		var _i= 0;
		while 1
		{
			if !place_meeting(x+hsp, y+_i, obj_stair) {break}
			_i--
		}
		y+= _i;
	}
	
	if place_meeting(x, y+vsp, obj_stair)
	{
		while !place_meeting(x, y+sign(vsp),obj_stair)
		{
			y+= sign(vsp);	
		}
		vsp= 0;
	}
	
	#endregion
	
	
	
	
	
	#region wall
	if place_meeting(x+hsp, y, obj_wall)
	{		
		while !place_meeting(x+sign(hsp), y, obj_wall)
		{
			x+= sign(hsp);
		}
		hsp= 0
	}
	
	if place_meeting(x, y+vsp, obj_wall)
	{
		while !place_meeting(x, y+sign(vsp), obj_wall)
		{
			y+= sign(vsp);
		}
		vsp= 0
	}
	#endregion
	

	
	
	
	x+= hsp;
	y+= vsp;
}