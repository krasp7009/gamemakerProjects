cooldown = 60 * .4; 
direc = 0;

bulletSts =
{
	spd : 3,
	damage : 1,
};

updateGunSts = function (_cooldown, _bulletDamage, _bulletSpd)
{
	self.cooldown = (_cooldown != undefined) ? _cooldown : self.cooldown;
	self.bulletSts.damage = (_bulletDamage != undefined) ? _bulletDamage : self.bulletSts.damage;
	self.bulletSts.spd = (_bulletSpd != undefined) ? _bulletSpd : self.bulletSts.spd;
}

shotBullet = function (_x, _y, _directionBullet, _directionOfSpawn = undefined)
{
	if (_directionOfSpawn == undefined)
		_directionOfSpawn = _directionBullet;
	direc = _directionBullet;
	
	
	var _halfedSprite = sprite_get_width(sPlayerColision)/2;
	var _horizontalDistanceToGun =  lengthdir_x(_halfedSprite, _directionOfSpawn);
	var _verticalDistanceToGun = lengthdir_y(_halfedSprite, _directionOfSpawn) + 3; //3 é constante legal
	
	//(_direction < 270 && _direction != 180) ? lengthdir_y(_halfedSprite, _direction) 
	//: 3; //when sprite is on horizontal axis, is best to use this constant value (just for visual)
	
	var _bullet = instance_create_layer(_x + _horizontalDistanceToGun, _y + _verticalDistanceToGun,
				"Instances", oBullet, bulletSts);
	_bullet.image_angle = _directionBullet;
	_bullet.hsp = lengthdir_x(_bullet.spd, _directionBullet);
	_bullet.vsp = lengthdir_y(_bullet.spd, _directionBullet);
	_bullet.direc = _directionBullet;
}