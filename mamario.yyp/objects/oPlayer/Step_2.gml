/// @description actions
if (place_meeting(x+newHSP, y, oCollision))
{
	while(!place_meeting(x+sign(newHSP), y, oCollision))
	{
		x += sign(newHSP); 
	}
	newHSP = 0;
}

if (place_meeting(x, y+newVSP, oCollision))
{
	while(!place_meeting(x, y+sign(newVSP), oCollision))
	{
		y += sign(newVSP);
	}
	newVSP = 0;
}

if (keyboard_check(vk_enter))
	game_restart()


// confirm that hsp and vsp arent 0 makes sure that if i am inside the block, there is no problem
if (place_meeting(x+newHSP, y+newVSP, oCollision) && newHSP != 0 && newVSP != 0)
{
	var _rateVsp = newVSP/abs(newHSP);
	var _tmpHsp = 0, _tmpVsp = 0;
	while(!place_meeting(x+sign(newHSP), y+_rateVsp, oCollision))
	{
		x += sign(newHSP);
		y += _rateVsp;
		_tmpHsp += sign(newHSP);
		_tmpVsp += _rateVsp;
	}
	
	if (newVSP > newHSP)
	{
		newHSP = 0;	
		newVSP -= _tmpVsp;
	}
	else
	{
		newVSP = 0;
		hsp -= _tmpHsp;
	}
}

hsp = newHSP;
vsp = newVSP;

x += hsp;
y += vsp;