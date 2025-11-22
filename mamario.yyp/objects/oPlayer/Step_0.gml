/// @description questions
//basic movement

move_x = -keyboard_check_direct(ord("A")) + keyboard_check(ord("D"));
newHSP = move_x * spd;  //scr_move(hsp, spd_max);
direc = (move_x != 0) ? move_x : direc;
onGround = place_meeting(x, y+1, oCollision);

if (onGround)
{
	if (keyboard_check_pressed(ord("W")))
	{	
		newVSP = jmp_spd;
	}
}
else
{
	newVSP += grav;
}


#region sprites


if !(onGround)
{
	if (sprite_index != sMamarioJumping)
	{
		sprite_index = sMamarioJumping;
		image_index = 0;
	}
	image_xscale *= (sign(image_xscale) != direc) ? -1 : 1;
}
else
{
	switch(move_x)
	{
		case 0:
			if (sprite_index != sMamario)
			{
				sprite_index = sMamario;
				image_index = 0;
			}
			image_xscale *= (sign(image_xscale) != direc) ? -1 : 1;
		break;
	
	
		default:
			if (sprite_index != sMamarioWalking)
			{
				sprite_index = sMamarioWalking;
				image_index = 0;
			}
			image_xscale *= (sign(image_xscale) != direc) ? -1 : 1;
		break;
	}
}

#endregion

// check for the type of interection that mario does when he hits the head on the block
if (place_meeting(x, y+newVSP, oBlock) && vsp < 0)
{
	var _idFromBlock = instance_place(x, bbox_top+newVSP, oBlock);
	if (_idFromBlock != noone)
	{
		_idFromBlock.colided = true;
		
		var _typeOfBlock = object_get_name(_idFromBlock.object_index); // o que é o object_index??
		
		if (_typeOfBlock == "oBrick")
		{
			_idFromBlock.willBreak = (isBuffed) ? true : false;
		}
	}
}