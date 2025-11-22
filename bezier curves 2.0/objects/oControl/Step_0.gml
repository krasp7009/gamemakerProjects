if keyboard_check_pressed(vk_control)
{
	dimensionsToDraw += (keyboard_check_pressed(vk_rcontrol)) ? 1 : -1;
	var _numberOfDimensions = array_length(pointsInSpace);
	
	if (dimensionsToDraw > _numberOfDimensions)
		dimensionsToDraw = 0;
	else if (dimensionsToDraw < 0)
		dimensionsToDraw = _numberOfDimensions;
}

if (keyboard_check_pressed(vk_space))
{
	scr_generator_of_colors(colors, pointsInSpace, numberOfColorsToDraw)	
}

if (keyboard_check_pressed(vk_backspace))
{
	scr_delete_all_points(pointsInSpace);	
}

speedVector = -keyboard_check_pressed(vk_left) + keyboard_check_pressed(vk_right);
speedOfSubPoints += (speedVector != 0) ? .05 * speedVector : 0;

scr_move_sub_points(pointsInSpace, speedOfSubPoints);

