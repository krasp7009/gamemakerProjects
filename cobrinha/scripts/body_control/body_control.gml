function scr_createBones()
{
	var _ds_size= ds_list_size(body);
	
	if size != _ds_size
	{
		//caso seja o inicio do jogo
		if _ds_size <= 1 
		{
			for(var i= 0, length= sprite_width; i < size; i++;)
			{
				var bone= instance_create_layer(x-length, y, "Instances", oBody)
				bone.sprite_index= sSnake_body;
				
				ds_list_add(body, bone);
				length += sprite_width;
			}
		}
		else
		{
			var bone= instance_create_layer(x, y, "Instances", oBody);
			bone.sprite_index= sSnake_body;
			
			ds_list_add(body, bone);
		}
	}	
}

function scr_body_move()
{
	var _ds_size= ds_list_size(body);
	
	if (_ds_size < 1) 
		return;
	
	
	scr_body_control(body[| _ds_size-1], oSnake)

	for(var i= _ds_size-2; i >= 0; i--)
	{
		scr_body_control(body[| i], body[| i+1], (i == 0) ? true : false)
	}
}


///faz comparação zika pra ver se o corpo pode se mexer (somente qnd ao lado do bloco tiver outro)
//o1 e o2 estão indo em ordem ascendente 
function scr_body_control(o1, o2, _end = false)
{	
	//se ambos dividirem mesmo espaço, estaram _touching_body
	static _touching_body= 0;
	var _o1DIREC;
	
	if position_meeting(o1.x, o1.y, o2) && position_meeting(o2.x, o2.y, o1)
	{
		_touching_body= 1;
	}
	
	if (_touching_body) 
	{
		o1.nx_hsp= 0;
		o1.nx_vsp= 0;
	}
	else
	{
		var xx= o1.x, yy= o1.y;
		var grau= point_direction(o1.x, o1.y, o2.x, o2.y);
		o1.nx_hsp= lengthdir_x(spd, grau);
		o1.nx_vsp= lengthdir_y(spd, grau);	
		_o1DIREC = point_direction(xx, yy, xx+o1.nx_hsp, yy+o1.nx_vsp);
		o1.direc= _o1DIREC/90;
	}
	
	var _isOutOfLine = ((o1.nx_hsp != o2.nx_hsp) || (o1.nx_vsp != o2.nx_vsp));
	
	if (_isOutOfLine)
	{
		o1.sprite_index = sCorner_body;
		o1.image_angle = 0;
		
		var _direc1 = o1.direc;
		var _direc2 = o2.direc;
		
		if(_direc1 == 0 || _direc1 = 2)
		{
			if (_direc2 == 1)
				o1.image_angle = (_direc1 == 0) ? 180 : 90;
			else
				o1.image_angle = (_direc1 == 0) ? -90 : 0;
		}
		else
		{
			if (_direc2 == 0)
				o1.image_angle = (_direc1 == 1) ? 0 : 90;
			else
				o1.image_angle = (_direc1 == 1) ? -90 : 180;
		}
	}
	else
	{
		o1.sprite_index = sSnake_body;	
		o1.image_angle = direc * 90;
	}
	
	if (_end) 
		_touching_body= 0
}
