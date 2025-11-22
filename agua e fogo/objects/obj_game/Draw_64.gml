//
frame++
draw_text(obj_player.x-140, obj_player.y-20, "frame: " + string(frame/60))

if global.game_paused
{
	draw_text(room_width/2, room_height/2, "room_speed= " + keyboard_string)	
	room_speed= 1;
}


if global.game_paused && keyboard_check_pressed(vk_enter)
{
	room_speed= real(keyboard_string)	
	global.game_paused= 0;
}
else if keyboard_check_pressed(vk_enter) {game_restart()}