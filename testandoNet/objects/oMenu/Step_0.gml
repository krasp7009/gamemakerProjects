var _dir = -keyboard_check_pressed(vk_up) + keyboard_check_pressed(vk_down)
cursor_index = clamp(cursor_index+_dir, 0, array_length(options)-1);


if (keyboard_check_pressed(vk_enter))
{
	if (cursor_index == 0)
		instance_create_layer(0, 0, "Instances", oServer);
	room_goto_next();	
}
