//draw_text_ext_transformed_colour(20, view_hport*.85, "backspace distribui as cartas\n"+"Enter embaralha o baralho\n"
//+"ESC reinicia o jogo", 20, 500, 1.25, 1.25, 0, c_red, c_red, c_red, c_red, 1);


_cursorAbove = scrGetCardsUnderMouseByDepth();
var _num = array_length(_cursorAbove);
for (var _i = 0; _i < _num; _i++)
{
	if (variable_instance_exists(_cursorAbove[_i], "suitOfCard"))
		_cursorAbove[_i] = (_cursorAbove[_i].classOfCard);	
	else
		_cursorAbove[_i] = noone;
}

draw_text(20, 60, _cursorAbove);
	
//ds_list_destroy(_cursorAbove);


			