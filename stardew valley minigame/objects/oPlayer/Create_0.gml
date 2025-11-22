respawned = false;
respawnCooldown = 3 * 60; 
item = undefined;


hsp = 0;
vsp = 0;
spd = 1;
moveX = 0;
moveY = 0;
isWalking = false;
direc = 0;

aimX = 0;
aimY = 0;
aimDir = 0;
isAiming = false;


usedItem = false;
weapon = instance_create_layer(x, y, "Instances", oGun);
currentBuffs = ds_list_create();
currentItem = undefined;



//draw variables
upperBodySprite = sPlayerRight;

handlingGun = function ()
{
	if !(variable_instance_exists(self, "weapon") || instance_exists(weapon))
		return;
		
	if (!isAiming)
		return;
		
	
	if (weapon.alarm[0] == -1)
	{
		var _wheel = undefined;
		var _shotgun = undefined;
	
		//checa por buffs q interferem no comportamento da bala
		for (var _i = 0, _numOfBuffs = ds_list_size(currentBuffs); _i < _numOfBuffs; _i++)
		{
			if (_shotgun != undefined && _wheel != undefined)
			{
				break;	
			}
			else if (currentBuffs[| _i].item == "shotgun")
			{
				_shotgun = currentBuffs[| _i];
			}
			else if (currentBuffs[| _i].item == "wheel")
			{
				_wheel = currentBuffs[| _i];	
			}
		}
		
		if (_wheel != undefined)
		{
			for (var _angle = 0; _angle != 360; _angle += 45)
			{
				weapon.shotBullet(x, y, _angle);
				if (_shotgun != undefined)
					_shotgun.shootByShotgun(x, y, _angle);
			}
		}
		else
		{
			weapon.shotBullet(x, y, aimDir);
			if (_shotgun != undefined)
				_shotgun.shootByShotgun(x, y, aimDir);
		}
		weapon.alarm[0] = weapon.cooldown;
	}

}

addPlayerBuff = function (_buff = undefined)
{
	var _buffsList = self.currentBuffs;
		
	
	if (_buff == undefined)
		return;
	
	for(var _i = 0, _sizeOfList = ds_list_size(_buffsList); _i < _sizeOfList; _i++)
	{
		//caso encontre outra versão do _buff, elimina e deixa o novo buff no lugar
		if (_buffsList[| _i].item == _buff.item)
		{
			_buffsList[| _i].destructMethod();
			ds_list_delete(_buffsList, _i); 
			_sizeOfList--;
		}
	}
	
	
	ds_list_add(_buffsList, _buff);
	_buff.creationMethod();
	
	if (self.currentItem != undefined && _buff == self.currentItem)
		self.currentItem = undefined;
}


#region drawing
alpha = 1;

playWithAlpha = function (_alphaValue)
{
	static _rising = false;
	var _delta = .25;
	
	if (_alphaValue >= 1)
		_rising = false;
	else if (_alphaValue <= 0)
		_rising = true;
		
	_alphaValue += (_rising) ? _delta : -_delta;
	return _alphaValue;
}