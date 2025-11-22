var yy= random_range(-90,30)
var xx= obj_passaro.x


if instance_position(xx,yy,obj_cano_inverso)	&& obj_passaro.acordado=1
{
	alarm[1]= 1
	if alarm[1]=0 
	{
		pontos+=10
	}
}


	


