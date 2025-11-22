if (hp <= 0 && blinkPercentage < .75)
{
	var _rand = random_range(0, 1);

	if (_rand <= probablityOfDrop)
	{
		instance_create_layer(x, y, "Instances", oDropItem);
	}
	
	instance_create_layer(x, y, "Instances", oRemainsOfEnemie);
	instance_destroy();
}

if (takedShot)
{
	hp += -damageReceived;
	alarm[0] = shotEffectTime;
	takedShot = false;
	
	blinkPercentage = 1;
	damageReceived = 0;
}

directionToPlayer = point_direction(x, y, oPlayer.x, oPlayer.y);