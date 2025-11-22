var _windowWidth = window_get_width(); //camera_get_view_width(view_camera[0]);
var _windowMiddle = _windowWidth/2;
draw_set_font(rGUI);
draw_set_halign(fa_center);
draw_text(_windowMiddle/2, 10, $"pontuação\n{myScore}");
draw_text(_windowMiddle, 10, $"moedas\n{coinsColleted}");
draw_text(_windowMiddle+(_windowMiddle/2), 10, $"vidas\n{lifes}")


draw_set_halign(fa_left);
draw_set_font(-1);