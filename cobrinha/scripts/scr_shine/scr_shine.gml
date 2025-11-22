function scr_blink()
{
	static start= 1;
	static _pos_list= ds_list_size(body);
	var _size= ds_list_size(body);
	var _vel_blink= .5;

	if start
	{
		body[| _size-1].blink= 1.0;
		_pos_list= _size-2;
		start= 0;
	}
	else
	{
		//garante que todos ganharão brilho
		if _pos_list <= 0
		{
			start= 1;
			oSnake.snake_effect= 0;
			return;
		}
		else if body[| _size-1].blink == _vel_blink
		{
			oSnake.blink= 1.0;
			oSnake.effect= true;
			body[| _pos_list].blink= 1.0;
			body[| _pos_list].effect= true;
		}
		else if body[| _pos_list].blink == _vel_blink
		{
			_pos_list--;
			body[| _pos_list].blink= 1.0;
			body[| _pos_list].effect= true;
		}
	}
}