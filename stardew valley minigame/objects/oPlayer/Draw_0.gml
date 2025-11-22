//direction is a angle
if (isWalking || isAiming)
{
	if (aimDir >= 45 && aimDir <= 135)
	{
		upperBodySprite = sPlayerUp;
	}
	else if (aimDir >= 225 && aimDir <= 315)
	{
		upperBodySprite = sPlayerDown;
	}
	else if (aimDir < 45 || aimDir > 315)
	{
		upperBodySprite = sPlayerRight;
	}
	else if (aimDir < 225 && aimDir > 135)
	{
		upperBodySprite = sPlayerLeft;
	}
	
	if (isWalking)
	{
		//image_index += (image_index == 0) ? 1 : 0;
		image_speed = 1;
	}
	else
	{
		image_speed = 0;	
	}
	
	var _originPointToLegs = (sprite_height/2) - sprite_get_height(sPlayerLegs);
	draw_sprite_ext(upperBodySprite, 0, x, y, 1, 1, 0, c_white, image_alpha);
	draw_sprite_ext(sPlayerLegs, image_index, x, y + _originPointToLegs + 1, 1, 1, 0, c_white, image_alpha)
}
else
{
	draw_sprite_ext(sPlayerStanding, 0, x, y, 1, 1, 0, c_white, image_alpha);
}

if (alarm[0] >= 0)
{
	image_alpha = playWithAlpha(image_alpha);
}
else
{
	image_alpha = 1;
}	


