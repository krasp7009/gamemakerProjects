if (isChosed)
{
	numOfMonstersToSpawn = irandom_range(1, 6);
	isChosed = false;
}

if (numOfMonstersToSpawn > 0)
{
	var _positions = []; //dependendo do vetor, interpretado para eixo x ou y
	var _numOfFreeSpace = 0;
	//var _deltaToSpriteOrigin = sprite_get_width(sHelmetZombie)/2;

	//loop pra contar quantos espaços livres tem
	for (var _i = 0; _i < 3; _i++)
	{
		var _x = (vectorDirToRoom.x != 0) ? x : x + sprite_height * _i;
		var _y = (vectorDirToRoom.y != 0) ? y : y + sprite_height * _i;
			
		if (!instance_place(_x, _y, oHelmetZombie))
		{
			_positions[_i] = (vectorDirToRoom.x != 0) ? _y : _x;
			_numOfFreeSpace++;
		}
	}
		
	//cria monstro, por isso retira espaço e numero de monstros a serem spawnados
	while(_numOfFreeSpace > 0)
	{
		var _i = 0;
		if (_numOfFreeSpace > 1)
			_i = irandom(_numOfFreeSpace-1);
			
		var _x = (vectorDirToRoom.x != 0) ? x : _positions[_i];
		var _y = (vectorDirToRoom.y != 0) ? y : _positions[_i];
			
		instance_create_layer(_x , _y, "Instances", oHelmetZombie);
		_numOfFreeSpace--;
		array_delete(_positions, _i, 1);
			
		numOfMonstersToSpawn--;
		oGame.numOfEnemies++;
	}
	
}