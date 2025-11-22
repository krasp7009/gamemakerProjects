global.deltaTime = delta_time/1000000;

//reinicia
if (keyboard_check_pressed(vk_enter))
{
	game_restart();	
}

//checa se o botão de muda de cor foi pressionado
Button.checkClick();


//comportamento das cores conforme noturno ou diurno
var _maxValue = 1;
var _targetValue = (isWhite) ? 0 : _maxValue; 
addRGB = lerp(addRGB, _targetValue, .05);
addRGB = clamp(addRGB, 0, _maxValue);