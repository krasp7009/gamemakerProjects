if keyboard_check_pressed(vk_control)
{
	global.game_paused= 1;
	keyboard_string= "";
}

if global.game_paused && keyboard_check_pressed(vk_enter)
{
	room_speed= real(keyboard_string)	
	global.game_paused= 0;
}
else if keyboard_check_pressed(vk_enter) {game_restart()}