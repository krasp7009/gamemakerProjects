//deleta todas dimensões
function scr_delete_points(_pointsInSpace, _pointToEliminate)
{
	//var _numOfBasePoints = array_length(_pointsInSpace[0]);
	var _numOfDimensions = array_length(_pointsInSpace);


	//primeira dimensão é feita manualmente o resto é loop
	instance_destroy(_pointToEliminate);
	
	var _f = function(_point, _index)
	{
		return (!instance_exists(_point));
	}
	var _indexOfEliminatePoint = array_find_index(_pointsInSpace[0], _f);
	array_delete(_pointsInSpace[0], _indexOfEliminatePoint, 1);
	
	for(var _i = 1; _i < _numOfDimensions; _i++)
	{
		if (_i == _numOfDimensions-1)
		{
			instance_destroy(_pointsInSpace[_i][0])
			array_delete(_pointsInSpace, _i, 1);
			oControl.dimensionsToDraw--;
			break;
		}
		
		var _subPoints = _pointsInSpace[_i];
		var _numOfSubPoints = array_length(_subPoints)-1;
		_indexOfEliminatePoint = clamp(_indexOfEliminatePoint, 0, _numOfSubPoints);
		
		instance_destroy(_subPoints[_indexOfEliminatePoint]);
		array_delete(_subPoints, _indexOfEliminatePoint, 1);
	}
}

//deleta tudo
function scr_delete_all_points(_pointsInSpace)
{
	var _numOfDimensions = array_length(_pointsInSpace);
	
	for(var _i = _numOfDimensions-1; _i >= 0; _i--)
	{
		var _numOfPoints = array_length(_pointsInSpace[_i]);
		
		for(var _j = 0; _j < _numOfPoints; _j++)
		{
			instance_destroy(_pointsInSpace[_i][_j]);
		}
		array_delete(_pointsInSpace, _i, 1);	
	}
	
	oControl.dimensionsToDraw = 0;
}

//fodase, vai ficar aqui
function scr_generator_of_colors(_arrayOfColors, _pointsInSpace, _numOfColors)
{
	randomize();
	array_resize(_arrayOfColors, _numOfColors);
	
	for(var _i = 0; _i < _numOfColors; _i++)
	{
		var _col = make_color_rgb(irandom_range(0,256), irandom_range(0,256), irandom_range(0,256));
		_arrayOfColors[_i] = _col;
	}

	//no start, ele n vai mudar a cor de ngm manualmente, mas dps de ter pontos, ele mudara por esse loop
	for(var _i = 0, _numOfDimensions = array_length(_pointsInSpace); _i < _numOfDimensions; _i++)
	{
		for(var _j = 0, _numOfSubPoints = array_length(_pointsInSpace[_i]); _j < _numOfSubPoints; _j++)
		{
			_pointsInSpace[_i][_j].myColor = _arrayOfColors[_i%_numOfColors];
			_pointsInSpace[_i][_j].image_blend = _pointsInSpace[_i][_j].myColor;
		}
	}
}