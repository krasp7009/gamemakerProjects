if (mouse_check_button_pressed(mb_left))
{
	if (position_meeting(mouse_x, mouse_y, self))
	{
		focused = true;	
		keyboard_string = "" + inputText;
	}
	else
	{
		focused = false;	
	}
}