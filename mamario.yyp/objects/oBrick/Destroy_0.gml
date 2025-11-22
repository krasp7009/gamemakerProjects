var _numberOfSlices = irandom_range(2, 6);

for(var _i = 0; _i < _numberOfSlices; _i++)
{
	var _xx, _yy;
	
	_xx = irandom_range(bbox_left, bbox_right);
	_yy = irandom_range(bbox_top, bbox_bottom);
	
	instance_create_layer(_xx, _yy, "Instances", oBrickSlices);
}


