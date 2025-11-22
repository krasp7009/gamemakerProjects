#region inputs
moveX = -keyboard_check(ord("A")) + keyboard_check(ord("D"));
moveY = -keyboard_check(ord("W")) + keyboard_check(ord("S"));
aimX = -keyboard_check(vk_left) + keyboard_check(vk_right);
aimY = -keyboard_check(vk_up) + keyboard_check(vk_down);   
useItem = keyboard_check(vk_space);
#endregion
isWalking = (moveX != 0 || moveY != 0);
isAiming = (aimX != 0 || aimY != 0);

//directions are angles, remember when working with them
var _nextAimDir = (isAiming) ? point_direction(0, 0, aimX, aimY) : aimDir;
var _nextDir = (isWalking) ? point_direction(0, 0, moveX, moveY) : direc;

direc = (isWalking) ? _nextDir : _nextAimDir;
aimDir = (isAiming) ? _nextAimDir : _nextDir;	


hsp = (moveX != 0) ? lengthdir_x(spd, direc) : 0;
vsp = (moveY != 0) ? lengthdir_y(spd, direc) : 0;

if (useItem)
{
	addPlayerBuff(currentItem);	
}

updatePlayerBuffs();

handlingGun();


if (place_meeting(x, y, oBasicEnemy) && alarm[0] == -1)
{
	//instance_destroy();
}


var _halfOfSprite = sprite_height/2;
if (place_meeting(x+hsp, y, oCollision) || (x+hsp < _halfOfSprite || x+hsp > room_width - _halfOfSprite))
{
	while !(place_meeting(x+sign(hsp), y, oCollision) ||  (x+sign(hsp) < _halfOfSprite || x+sign(hsp) > room_width - _halfOfSprite))
	{
		x += sign(hsp);	
	}
	hsp = 0;
}



if (place_meeting(x, y+vsp, oCollision) || (y+vsp < _halfOfSprite || y+vsp > room_height - _halfOfSprite))
{
	while !(place_meeting(x, y+sign(vsp), oCollision) || (y+sign(vsp) < _halfOfSprite || y+sign(vsp) > room_height - _halfOfSprite))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

x += hsp;
y += vsp;