/// @description escolhe spawner

var _length = array_length(spawners);


if (_length != 0)
{
	var _i = irandom(_length-1);

	spawners[_i].isChosed = true;

	var _baseGap = 2 * 60;
	var _limitGap = 4 * 60;

	if (alarm[0] != -1)
		alarm[1] = irandom_range(_baseGap, _limitGap);
}