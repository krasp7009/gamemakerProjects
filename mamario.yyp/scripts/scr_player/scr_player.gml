function scr_move(_hsp, _speedMax)
{
	direc = (move_x != 0) ? move_x : direc;
	
	//primeiro cuida do sprite
	#region image
	if (move_x != 0)
	{
		image_index = 0;
		sprite_index = sMamarioWalking;
	}
	else
	{
		sprite_index = sMamario;	
	}
	
	image_xscale = direc;
	
	#endregion
	
	//cuida da velocidade (após fala com o sor vagner eu tento inputa uma aceleração linear)
	#region movement
	static _RATEHSP = 0;
	var _rateHsp;
	var _deltaTime = 1;
	
	
	//_absHsp vai guardar o valor absoluto do vetor de velocidade
	_hsp /= _deltaTime;
	var _absHsp = abs(_hsp);
	var _isWalking = (move_x != 0);
	var _isWalkingInFavorOfHsp = (sign(move_x) == sign(_hsp));
	var _isCloseToMaxHsp = (_absHsp >= _speedMax);
	var _newHsp;
	
	//não funciona pois não considera os vetores de direções opostas de forma correta, ao ver a direção somente no final
	if (!_isWalking)
	{
		_RATEHSP -= .01;
	}
	else
	{
		if (_isWalkingInFavorOfHsp)
			_RATEHSP += (_isCloseToMaxHsp) ? .08 : .06;	
		else
			_RATEHSP += .04;
	}
	
	_RATEHSP = clamp(_RATEHSP, 0, 1);
	_rateHsp = _RATEHSP;
	
	if (direc == 1)
		_newHsp = lerp(0, _speedMax, _rateHsp);	
	else
		_newHsp = lerp(0, _speedMax, _rateHsp) * -1;
		

	//return _hsp * _deltaTime;
	return _newHsp - _hsp; 
	
	#endregion
}

/*
// função que a longo prazo não combina com todos tipos de colisão, (n faz sentido pensa nisso num projeto tão bestinha)
//

function scr_collision_with_objects(_dir = "xy", _objects = [])
{
	if !(is_array(_objects))
	{
		_objects = [_objects]
	}
	
	if (array_length(_objects) == 0)
		return [false];
		
	var _collidedObjects = [];
	
	_dir = string_lower(_dir);
	

	
	switch(_dir)
	{
		default:
		
		break;
		
		case "x":
			for(var _i = 0, _l = array_length(_objects); _i < _l; _i++)
			{
				if (place_meeting(x+hsp, y, _objects[_i]))
					array_push(_collidedObjects, _objects[_i]);
			}
		break;

		case "y":
			
		break;	
	}
}

*/