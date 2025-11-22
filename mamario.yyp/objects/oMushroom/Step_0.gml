newHSP = spd;

isInsideABlock = place_meeting(x, y, oBlock);

//checks if the left, middle and right side at the bottom are colliding with the ground
if (isInsideABlock)
{
	//check if top part is inside, if not the body will be pushed by the block
	if !(collision_line(bbox_left, bbox_top, bbox_right, bbox_top, oBlock, false, true))
	{
		halfBodyInsideBlock = true;
		var _obj = instance_position(x, y, oBlock);
		if (_obj != noone && variable_instance_exists(_obj, "vsp"))
		{
			newVSP = _obj.vsp;
		}
	}
}
else if !(place_meeting(x, y+1, oBlock))
{
	newVSP += grav;
	halfBodyInsideBlock = false;
}


