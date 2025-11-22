var _intervalo = 60 * irandom_range(1, 2);

var _obstacle = oCactus;

var _obstacleSprite = object_get_sprite(_obstacle);
var _obstacleNumOfFrames = sprite_get_info(_obstacleSprite).num_subimages;

var _numOfObstacles = irandom_range(1, 3);


var _lastCactusX = undefined;
for (var _i = 1; _i <= _numOfObstacles; _i++)
{
	var _spriteWidth = sprite_get_width(_obstacleSprite)
	var _offSetX = (_lastCactusX == undefined) ? sprite_get_yoffset(_obstacleSprite) : _spriteWidth-4;
	var _baseSpawnX = (_lastCactusX == undefined) ? room_width + _offSetX : _lastCactusX + _offSetX;
	
	var _instance = instance_create_layer(_baseSpawnX, groundYposition,
						"Instances", _obstacle);

	var _cactusImage = irandom_range(0, _obstacleNumOfFrames-1);	
	_instance.image_index = _cactusImage;
	_lastCactusX = _instance.x;
}


alarm[0] = _intervalo