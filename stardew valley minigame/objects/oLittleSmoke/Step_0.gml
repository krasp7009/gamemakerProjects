if (image_alpha <= 0)
{
	instance_destroy();
}
else
{
	image_alpha = (numOfFrames - image_index) / numOfFrames;	
}



x += hsp;
y += vsp;