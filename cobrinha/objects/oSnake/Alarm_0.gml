///@desc all move & col
//alarm loop no oGame
//alarme serve para a movimentação e todas verificações de coisas que incidem com a movimentação...
//como o aumento de tamanho, corpo que se move, e definir qual a atual direção apos a movimentação

if place_meeting(x+nx_hsp, y+nx_vsp, oMadplsh)
{
	size++;
}


//ordem de mudar sprite n ta coincindindo com o timing certo
direc= nx_direc;

scr_body_move();

with(oBody)
{
	
	hsp = nx_hsp;
	vsp = nx_vsp;
	
	x+= hsp;
	y+= vsp;
}


if place_meeting(x+nx_hsp, y+nx_vsp, oBody) && !place_meeting(x+hsp, y+vsp, oBody)
{
	nx_hsp= hsp;
	nx_vsp= vsp;
}


x+= nx_hsp;
y+= nx_vsp;
image_angle= direc*90;
hsp= nx_hsp;
vsp= nx_vsp;

alarm[0]= timerToMove;

