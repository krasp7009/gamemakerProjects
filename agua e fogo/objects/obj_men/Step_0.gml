move_x= -keyboard_check(ord("A")) + keyboard_check(ord("D"));
jump= ord("W");

if !global.game_paused
{
	scr_move_p();
	scr_col_p();
}