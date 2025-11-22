hsp = lerp(hsp, 0, hspDecrease)
vsp = lerp(vsp, .5, vspDecrease)

alphaValue += alphaDecrease;
image_alpha = alphaValue;
image_angle += rotationSpd;

if (alphaValue <= 0)
{
	instance_destroy();	
}
