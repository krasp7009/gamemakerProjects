// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_snake_move()
{
	var left= -(keyboard_check(vk_left) || keyboard_check(ord("A")));
	var right= (keyboard_check(vk_right) || keyboard_check(ord("D")));
	var up= -(keyboard_check(vk_up) || keyboard_check(ord("W")));
	var down= (keyboard_check(vk_down) || keyboard_check(ord("S")));
	
	move_x= left + right;
	move_y= up + down;
	
	
	if (move_x != 0 && move_y != 0) || (move_x == 0 && move_y == 0) 
	{
		move_x= 0;
		move_y= 0;
	}
	else 
	{
		var grau= (point_direction(x,y, x+move_x, y+move_y)/90);
	
		switch(direc)
		{
			case 0:
				if grau != 2 {nx_direc= grau}
			break;
			case 1:
				if grau != 3 {nx_direc= grau}
			break;
			case 2:
				if grau != 0 {nx_direc= grau}
			break;
			case 3:
				if grau != 1 {nx_direc= grau}
			break;
		}
		
		nx_hsp= lengthdir_x(spd, nx_direc*90);
		nx_vsp= lengthdir_y(spd, nx_direc*90);
	}
}


