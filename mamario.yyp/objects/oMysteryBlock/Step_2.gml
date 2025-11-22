/// @description actions
if (y+vsp > originalPosition && colided)
{
	vsp = 0;
	y = originalPosition;
	sprite_index = sMysteryBlockOFF;
	colided = false;
	isActive = false;
	

	if (drop == "coin")
		instance_create_layer(spawnX, spawnY, "Instances", oCoin, {createdByMystery : true});
	else if (drop == "mushroom")
		instance_create_layer(spawnX, spawnY, "Instances", oMushroom);
}





y += vsp;
