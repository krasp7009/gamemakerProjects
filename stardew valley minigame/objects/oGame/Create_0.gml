randomize();

//game Variables
playerLifes = 4;
playerCoins = 0;
playerInstance = instance_find(oPlayer, 0);
playerDied = false;
playerRespawnCooldown = 5 * 60;

numOfEnemies = instance_number(oBasicEnemy);

#region spawner variables
updateSpawners = function(_spawners)
{
	array_delete(_spawners, 0, array_length(_spawners));
	
	for(var _i = 0, _numOfSpawners = instance_number(oSpawner); _i < _numOfSpawners; _i++)
	{
		array_push(_spawners, instance_find(oSpawner, _i));	
	}
}

spawners = [];
updateSpawners(spawners);

numOfEnemies = 0;
maxNumOfEnemiesInRoom = 5;
alarm[1] = 10;
#endregion



#region buff
buffItemsInfo = 
{
	shotgun : function () constructor
	{
		item = "shotgun";
		sprite = sShotgun;
		target = undefined; //target must be weapon (bcs weapon will be buffed)
		effectTime = 9 * 60 //12 * 60;  //12 seconds
		creationMethod = function() 
		{
			self.target = instance_find(oGun, 0);
			
			var _newCooldown = self.target.cooldown / .75;
			self.target.updateGunSts(_newCooldown);
		};
		updateMethod = function()
		{
			effectTime--;
		};
		destructMethod = function()
		{
			var _oldCooldown = self.target.cooldown * .75;
			self.target.updateGunSts(_oldCooldown);
			//delete self;
		};
		
		shootByShotgun = function(_x, _y, _baseDir)
		{
			var _angleOfBullet = 15; //metade da metade de 90
			var _angleOfSpawn = 2;
			self.target.shotBullet(_x, _y, _baseDir + _angleOfBullet, _baseDir +_angleOfSpawn);
			self.target.shotBullet(_x, _y, _baseDir - _angleOfBullet, _baseDir -_angleOfSpawn);
		}
	},
	wheel : function () constructor
	{
		item = "wheel";
		sprite = sWhagonWheel;
		target = undefined; //target must be weapon (bcs weapon will be buffed)
		effectTime = 9 * 60  //10 * 60;  //10 seconds
		creationMethod = function() 
		{
			self.target = instance_find(oGun, 0);
		};
		updateMethod = function()
		{
			effectTime--;
		};
		destructMethod = function()
		{
			
		};
	},
	cartridge : function () constructor
	{
		item = "cartridge";
		sprite = sCartridge;
		target = undefined; //target must be weapon (bcs weapon will be buffed)
		effectTime = 6 * 60  //10 * 60;  //10 seconds
		creationMethod = function() 
		{
			self.target = instance_find(oGun, 0);
			self.target.cooldown *= .25;
		};
		updateMethod = function()
		{
			effectTime--;
		};
		destructMethod = function()
		{
			self.target.cooldown /= .25;
		};
	},
	coffee : function () constructor
	{
		item = "coffee";
		sprite = sCoffee;
		target = undefined; //target must be weapon (bcs weapon will be buffed)
		effectTime = 12 * 60  //10 * 60;  //10 seconds
		creationMethod = function() 
		{
			self.target = instance_find(oPlayer, 0);
			self.target.spd *= 1.5;
		};
		updateMethod = function()
		{
			effectTime--;
		};
		destructMethod = function()
		{
			self.target.spd /= 1.5;
		};
	}
};

allBuffItems = variable_struct_get_names(buffItemsInfo);


#endregion


#region set Viewports
gameSurface = -1;

surfaceWidth = 1024;
surfaceHeight = 768;

test1 = 256;
test2 = 256;

//window_set_size(surfaceWidth, surfaceHeight)
//surface_resize(application_surface, window_get_width(), window_get_height())
//display_set_gui_size(surfaceWidth, surfaceHeight)

viewPointX= (window_get_width()/2 - view_wport[1]/2);
viewPointY = (window_get_height()/2 - view_hport[1]/2);

view_set_xport(1, viewPointX);
view_set_yport(1, viewPointY);
move_and_collide()
#endregion

#region GUI
roundTimer = 60 * 60; // frames * seconds (60 frames equals to 1 second)
alarm[0] = roundTimer;
timerBarWidth = view_wport[1] - sprite_get_width(sWatch);
timerBarHeight = sprite_get_height(sTimerBar);

timerIncrease = 3 * 60;

//metodo para desenhar item do inventario do player
drawningItemOnMolde = function (_x, _y, _scale = 2)
{
	if (!instance_exists(oPlayer))
	{
		return false;	
	}
	var _item = instance_find(oPlayer, 0).currentItem;
	
	if (_item == undefined)
	{
		return false;	//falso se não há item
	}
	
	var _spriteToDraw = _item.sprite;
	var _width = sprite_get_width(_spriteToDraw) * _scale;
	var _realX = _x + _width*.7;
	var _realY = _y + _width*.65;
	draw_sprite_ext(_spriteToDraw, 0, _realX, _realY, _scale, _scale, 0, c_white, 1);
}
#endregion