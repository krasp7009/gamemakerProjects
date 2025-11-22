function scrBirdPlaying()
{
	if (place_meeting(x, y, oObstacles))
	{
		state = scrBirdDying;
	}
	
	
	//quer dizer que o Y não esta coladinho na colisão, logo não esta no chão
	if (y+1 != collisionGroundY)
	{
		vsp += grav;	
		if (vsp == 0)
		{
			inputJump = false;	
		}
	}
	else
	{
		if (inputJump)
		{
			vsp = -jumpSpd;	
		}
	}

	//a futura velocidade vertical
	var _deltaVsp = vsp * global.deltaTime;
	//caso o proximo movimento leve o Y a atravessar o chão, manipularemos para que não aconteca
	if (y+_deltaVsp > collisionGroundY)
	{
		//arredonda y para o menor valor possivel
		y = floor(y);
	
		//enquanto der pra movimenta o Y (na direção a qual ele estava se movendo)
		//mova  (o movimento sera de 1 em 1)
		while(y+sign(vsp) != collisionGroundY)
		{
			y += sign(vsp); //sign(n) vai retornar o sinal de n, podendo ser 1 (positivo), -1 (negativo), 0 (caso seja 0)	
		}
		vsp = 0; //torna a velocidade vertical neutra pois já estamos no chão	
	}


	y += vsp * global.deltaTime;	
}

function scrBirdDying()
{
	//descobri que gravar a tela FODE o static pelo visto
	//static _startOfAnimation = undefined;
	
	var _xPositionOutsideRoom = (x < 0 || x > room_width);
	var _yPositionOutsideRoom = (y < 0 || y > room_height);
	
	if (_xPositionOutsideRoom || _yPositionOutsideRoom)
	{
		instance_destroy();	
		_startOfAnimation = false;
	}
	
	if (deathAnimationStart)
	{
		dir = choose(-1, 1);
		hsp = irandom_range(120, 160) * dir;
		vsp = -irandom_range(120, 160);
		deathAnimationStart = false;
	}
	else
	{
		hsp += 3 * -dir;
		vsp += grav;
	}
	
	
	
	rotationSpd = 360 * 2;
	
	image_angle += rotationSpd * global.deltaTime;
	x += hsp * global.deltaTime;
	y += vsp * global.deltaTime;
}	