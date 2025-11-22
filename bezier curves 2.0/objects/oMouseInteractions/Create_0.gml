window_set_cursor(cr_none);
sprite_index = sMouse;

depth = -200;

enum states 
{
	moving,
	dragging,
	drawing,
	createOrDestroyPoints
}

state = states.moving;
onObject = noone;
nextX = 0;
nextY = 0;