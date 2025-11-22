// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_drawing()
{
	///@arg text
	///@arg placeholders
	///@arg ...
	///@arg coordinate
	
	static _y_coordinate = 20;
	var _text = argument[0];
	var _y_coordinate = argument[argument_count-1];
	
	//replace placeholders
	for(var _i = 1, _limit = argument_count; _i < _limit; _i++)
	{
		var _arg = argument[_i];
		_text = string_replace(_text, string(_i), string(_arg));
	}
	
	draw_text(20, _y_coordinate, _text);
	_y_coordinate += 20;
}