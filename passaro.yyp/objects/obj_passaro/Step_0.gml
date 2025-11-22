/*
move= -keyboard_check(vk_left)+keyboard_check(vk_right)

hsp= move*spd

x+= hsp

if keyboard_check_pressed(vk_left) && acordado=1
{
	image_xscale= -1
}
if keyboard_check_pressed(vk_right) && acordado=1
{
	image_xscale= 1
}
*/
if keyboard_check_pressed(vk_space) && acordado=1
{
	vsp= -3.2
	shake= lerp(shake,clinada,0.6)
}
else
{
	vsp+= 0.16
	shake+= -0.6
}



if place_meeting(x,y+vsp,obj_chao)
{
	vsp=0
	acordado=0
	shake= 0
}
y+= vsp
image_angle= shake

if acordado=0
{
	spd=0
	sprite_index= spr_peixe_tontinho
	if keyboard_check_pressed(vk_enter)
	{
		room_restart()
	}
}

