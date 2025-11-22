if keyboard_check_pressed(vk_enter)
{
	game_restart();
}

if (keyboard_check_pressed(vk_control))
{
	debuggerSwitch = (debuggerSwitch) ? false : true;
}

