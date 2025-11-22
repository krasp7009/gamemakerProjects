if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}

// like lerp
x += (xTo - x)/25;
y += (yTo - y)/25;

//x = lerp(x, xTo, .025);
//y = lerp(y, yTo, .025);




camera_set_view_pos(view_camera[0], floor(x-(camWidth*.5)), floor(y-(camHeight*.5)));

