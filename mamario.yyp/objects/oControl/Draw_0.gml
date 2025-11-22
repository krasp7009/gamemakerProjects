// draw player hitbox
if (debuggerSwitch)
{
	var _p = oPlayer;
	var _lineWidth = _p.image_scale;
	var _lineColor = c_purple;
	
	draw_rectangle_color(_p.bbox_left, _p.bbox_top, _p.bbox_right-1, _p.bbox_bottom-1, 
	_lineColor, _lineColor, _lineColor, _lineColor, true)
	
}