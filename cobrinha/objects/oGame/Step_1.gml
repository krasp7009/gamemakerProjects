var op_menu= global.op_menu;

if op_menu 
{
	#region angle_text
	if a_check
	{
		angle += a_spd;
	}
	else
	{
		angle -= a_spd;	
	}

	if angle == a_max
	{
		a_check= 0	
	}
	else if angle == -a_max
	{
		a_check= 1	
	}
	#endregion
}		

var player= oSnake

if (player.move_x != 0 || player.move_y) && op_menu 
{
	global.op_menu= 0
}