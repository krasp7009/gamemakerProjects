//method for creating in an accurate position the enemy
isChosed = false;
vectorDirToRoom = {};

numOfMonstersToSpawn = 0;

if (x <= room_width && x >= room_width)
{
	if (y <= room_height)
		vectorDirToRoom = {x : 0, y : 1};	
	else
		vectorDirToRoom = {x : 0, y : -1};
}
else if (x <= room_width)
{
	vectorDirToRoom = {x : 1, y : 0};
}
else if (x >= room_width)
{
	vectorDirToRoom = {x : -1, y : 0};
}


spawnEnemy = function(_x = self.x, _y = self.y)
{
	
	instance_create_layer(_x, _y, "Instances", _typeOfEnemy);
}
