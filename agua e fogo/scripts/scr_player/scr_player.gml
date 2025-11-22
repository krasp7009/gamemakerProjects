// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_move_p()
{
	hsp= move_x * spd;
	
	if (place_meeting(x, y+1, obj_wall) || place_meeting(x, y+1, obj_stair)) && keyboard_check_pressed(jump)
	{
		vsp= jmp_force;
	}
	else if !place_meeting(x, y+1, obj_wall) && !place_meeting(x, y+1, obj_stair)
	{
		vsp+= grav;
	}
}

function scr_col_p()
{
	if !place_meeting(x,y,obj_stair) && !place_meeting(x,y, obj_wall)
	{
		y_ant= bbox_top;
		x_ant= bbox_right;
		hsp_ant= hsp;
		vsp_ant= vsp;
	}

	if place_meeting(x+hsp, y, obj_stair) || place_meeting(x+sign(hsp), y, obj_stair)
	{
		var dir= point_direction(x, y, x+hsp, y+hsp);
		hsp= lengthdir_x(spd,dir);
		
		while place_meeting(x+hsp, y, obj_stair)
		{
			y--;
		}
	}
	
	if place_meeting(x, y+vsp, obj_stair)
	{
		while !place_meeting(x, y+sign(vsp), obj_stair)
		{
			y+= sign(vsp);	
		}
		vsp= 0;
	}
	
	if place_meeting(x+hsp, y+vsp, obj_wall)
	{
		while !place_meeting(x+sign(hsp), y+vsp, obj_wall)
		{
			x+= sign(hsp);	
		}
		hsp= 0;
	}
	
	if place_meeting(x+hsp, y, obj_wall)
	{
		while !place_meeting(x+sign(hsp), y, obj_wall)
		{
			x+= sign(hsp);
		}
		hsp= 0;
	}
	
	
	if place_meeting(x, y+vsp, obj_wall)
	{
		while !place_meeting(x, y+sign(vsp), obj_wall)
		{
			y+= sign(vsp);	
		}
		vsp= 0
	}
	
	x+= hsp;
	y+= vsp;
}