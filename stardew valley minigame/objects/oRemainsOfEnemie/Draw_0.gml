draw_self();

//stops animation in the end
if (image_speed == 1 && image_index == image_number)
	image_speed = 0;

if (alarm[0] == -1)
{
	image_alpha -= .05;
}	

if (image_alpha <= 0)
{
	instance_destroy();	
}