//conditions and actions for when bullet should be destroyed
if (place_meeting(x, y, oBasicEnemy))
{
	var _id = instance_place(x, y, oBasicEnemy);
	if (_id == noone)
		return;
	
	_id.takedShot = true;
	_id.damageReceived += damage
	instance_destroy();	
}
else if (place_meeting(x, y, oCollision))
{
	instance_destroy();
}
else if (bbox_right <= 0 || bbox_left >= room_width || bbox_top >= room_height || bbox_bottom <= 0)
	instance_destroy();

x += hsp;
y += vsp;
image_angle += spd * .75; //spins in a ratio with spd