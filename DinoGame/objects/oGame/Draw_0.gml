shader_set(shReverseColors);
shader_set_uniform_f(revertColorID, addRGB);

#region cenario
depth = 10;
draw_rectangle(0, 0, room_width, room_height, false);

depth = 5;
var _deleteSubGround = false;
//loop que desenha chão e gera o movimento
for(var _i = 0, _size = array_length(groundXpositions); _i < _size; _i++)
{
	var _nextPosition = groundXpositions[_i] -  (groundSpd * global.deltaTime);
	if (_nextPosition <= -groundWidth)
	{
		array_push(groundXpositions, groundXpositions[_size-1] + groundWidth)
		_size++;
		_deleteSubGround = true;
	}
	else
		groundXpositions[_i] = _nextPosition;
		
	draw_sprite(sGround, 0, groundXpositions[_i], groundYposition);
}	
if (_deleteSubGround)
{
	array_delete(groundXpositions, 0, 1);	
}

#endregion

shader_reset();

