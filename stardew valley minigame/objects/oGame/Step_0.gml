if (keyboard_check_pressed(vk_enter))
	game_restart();

if (playerDied && playerLifes > 0) //caso player morra e tenha mais vidas
{
	var _increaseInTime = 4 * 60 ; // segundos por frames
	alarm[0] = clamp(alarm[0] +_increaseInTime, 0, roundTimer);
	
	var _x = room_width/2, _y = room_height/2;
	playerInstance = instance_create_layer(_x, _y, "Instances", oPlayer);
	playerInstance.alarm[0] = playerInstance.respawnCooldown;
	
	with(oBasicEnemy)
	{
		instance_destroy();
	}
	
	with(oDropItem)
	{
		instance_destroy();	
	}
	
	playerDied = false;
	playerLifes--;
}
else if (playerDied && playerLifes == 0) // caso player morra e não tenha mais vidas
{
	
}

//mantem timer da partida pausado no inicio do cooldown do player
if (playerInstance.alarm[0]/playerRespawnCooldown > .50)
{
	alarm[0]++;
	alarm[1] = 2 * 60;
}

