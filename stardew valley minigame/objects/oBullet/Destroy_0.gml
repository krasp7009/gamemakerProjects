var _smoke = instance_create_layer(x, y, "Instances", oLittleSmoke);
with(_smoke)
{
	spd = other.spd;
	direc = other.direc;
	image_angle = direc;
	spd *= .15;
	hsp = lengthdir_x(spd, direc);
	vsp = lengthdir_y(spd, direc);
	depth = -1000;
}