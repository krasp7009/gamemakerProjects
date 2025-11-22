//aqui ocorre todas verificaçoes antes do alarme ocorrer, alem de controles pra evitar que o alarme ative
if global.op_menu 
{
	alarm[0]= 2;
}

if place_meeting(x, y, oBody) 
{
	ds_list_destroy(body);
	game_restart();
}



//teste se encostou na maçã (effeito foda)
if place_meeting(x, y, oMadplsh)
{
	snake_effect= true;
	scr_createBones();
	instance_destroy(oMadplsh);
}

if snake_effect 
{
	alarm[0]= timerToMove;
	scr_blink();
}

scr_snake_move();

