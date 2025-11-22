if (place_meeting(x, y, oPlayer))
{
	var _id = instance_place(x, y, oPlayer);
	
	if (_id != noone)
	{
		//caso não haja um item no bolso do player, coloca o buff atual ali
		if (_id.currentItem == undefined)
		{
			_id.currentItem = item;
		}
		else
		{
			_id.addPlayerBuff(item);	
		}
	}
	instance_destroy();
}


if (alarm[0]/timeUntilVanishing < .30)
{
	if (alarm[1] == -1)
	{
		alarm[1] = blinkEfectInterpolation;
		visible = !visible;
		
		image_alpha = visible;
	}
}

