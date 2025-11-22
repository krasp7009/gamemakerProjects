function scr_move()
{
	//basic set of horizontal speed
	move_x= -keyboard_check(ord("A")) + keyboard_check(ord("D"));
	move_y= -keyboard_check(ord("S")) + keyboard_check(ord("W"));
	hsp= move_x * spd;
		
	//method for doing the magic of jumping!
	scr_jump();
	

	scr_setSprite();
}

function scr_jump()	
{
	// if jump is 1, then player started the jump; case is -1, then player
	var _jump= keyboard_check_pressed(vk_space)	- keyboard_check_released(vk_space);
	
	
	if place_meeting(x, y+1, obj_wall) && _jump == 1
	{
		y_min= bbox_bottom;
		y_height= y+hightest_jump;
		vsp= jmp_force;
	}
	else if keyboard_check(vk_space) && vsp < 0
	{
		vsp+= jmp_force
		//caso o personagem vá passar do limite em que seu salto deveria alcançar, evita;
		if y+vsp <= y_height 
		{
			while y != y_height
			{
				y--;	
			}
			vsp= 0;
			y_max= bbox_bottom;
		}
		
	}
	else if _jump == -1 && vsp < 0
	{
		vsp= 0;	
		y_height= 0;
		y_max= bbox_bottom;
	}
	
	vsp+= grav
	
	vsp= clamp(vsp, jmp_max, grav_max);
}

function scr_attack()
{
	var _keyAttack = keyboard_check_pressed(ord("Q"));
	if (_keyAttack)
	{
		//matar todo mundo		
	}
}

function scr_setSprite()
{
	#region direction sprite
	direc= move_x;
	switch(direc)
	{
		case 1: // 
			image_xscale= 1
			if sprite_index != spr_knight_walking
			{
				image_index= 0;
				sprite_index= spr_knight_walking;
			}
		break;
		
		case -1:
			image_xscale= -1
			if sprite_index != spr_knight_walking
			{
				image_index= 0;
				sprite_index= spr_knight_walking;
			}
		break;
		
		default:
			if sprite_index != spr_knight_stand 
			{
				image_index= 0;
				sprite_index= spr_knight_stand;
			}
		break;
	}
	#endregion		
}