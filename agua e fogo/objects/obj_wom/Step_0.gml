move_x= -keyboard_check(vk_left) +keyboard_check(vk_right);
jump= vk_up;

if !global.game_paused
{
	scr_move_p();
	scr_col_p();
}