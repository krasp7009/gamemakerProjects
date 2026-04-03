//draw_text_ext_transformed_colour(20, view_hport*.85, "backspace distribui as cartas\n"+"Enter embaralha o baralho\n"
//+"ESC reinicia o jogo", 20, 500, 1.25, 1.25, 0, c_red, c_red, c_red, c_red, 1);



var _cursorAbove = ds_list_create(); 
var _num = instance_position_list(oCursor.x, oCursor.y, all, _cursorAbove, true);

_cursorAbove = scrConvertListToArray(_cursorAbove);

for (var _i = 0; _i < _num; _i++)
{
	if (variable_instance_exists(_cursorAbove[_i], "suitOfCard"))
		_cursorAbove[_i] = (_cursorAbove[_i].suitOfCard);	
	else
		_cursorAbove[_i] = noone;
}

draw_text(20, 60, _cursorAbove);
	
//ds_list_destroy(_cursorAbove);


			