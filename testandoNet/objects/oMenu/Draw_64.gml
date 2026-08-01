var guiWidth = display_get_gui_width();
var guiHeight = display_get_gui_height();

for(var i = 0; i < array_length(options); i++)
{
	if (cursor_index == i)
		draw_set_colour(c_red)
	draw_text(guiWidth/2, guiHeight/2 + i*32, options[i])	
	draw_set_colour(c_white);
}

