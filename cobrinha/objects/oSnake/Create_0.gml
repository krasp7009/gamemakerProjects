//image_xscale = .5
//image_yscale = .5

move_x = 0;
move_y = 0;
hsp= 0;
vsp= 0;
nx_hsp= 0;
nx_vsp= 0;
spd= 32;
direc= 0;
nx_direc= 0;
timerToMove = 25


size= 1;
body = [];


//efeito do corpo todo (chekc q evita de perder o controle do efeito)
snake_effect= false;
effect= false; //enquanto esse cuida de n ficar desenhando oSnake com o shader

blink= .0;
UN_blink= shader_get_uniform(Steste, "blink");