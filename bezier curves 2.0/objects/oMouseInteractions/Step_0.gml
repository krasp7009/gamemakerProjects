onObject = instance_position(x, y, oPoints)
nextX = mouse_x;
nextY = mouse_y;

if (state == states.moving && onObject != noone && mouse_check_button_pressed(mb_left))
	state = states.dragging;	
else if (state == states.dragging && !mouse_check_button(mb_left))
	state = states.moving;
else if (state == states.moving && mouse_check_button_pressed(mb_right))
	state = states.createOrDestroyPoints;
/*else if (mouse_check_button(mb_right))
	state = states.drawing;
*/	
switch(state)
{
	case states.moving:
		image_index = states.moving;
	break;
	
	case states.dragging:
		image_index = states.dragging;
		
		var _deltaX = nextX - x;
		var _deltaY = nextY - y;
		
		onObject.x += _deltaX;
		onObject.y += _deltaY;
	break;
	
	case states.createOrDestroyPoints:
		if (onObject != noone)
			scr_delete_points(oControl.pointsInSpace, onObject);
		else
			scr_create_point(oControl.pointsInSpace, x, y);
			
		state = states.moving;
			
	break;
	
}


x = nextX;
y = nextY;