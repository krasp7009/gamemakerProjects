//desenham as linhas
function scr_draw_lines(_pointsInSpace, _numOfDimensionsToDraw,_width)
{
	var _numOfDimensions = array_length(_pointsInSpace);
	
	//pontos sumidos
	if (_numOfDimensionsToDraw == _numOfDimensions)
	{
		oControl.isDrawingOnlyLastLine = true;
	}
	else
	{
		oControl.isDrawingOnlyLastLine = false;
	}
	
	if (oControl.isDrawingOnlyLastLine)
	{
		with(oSubPoints)
		{
			if (!isDrawingMyLine)
				break;
			var _numOfDimensions = array_length(other.pointsInSpace);
			if (isDrawingMyLine && dimension < _numOfDimensions-1)
				isDrawingMyLine = false;
		}
	}
	else
	{
		with(oSubPoints)
		{
			var _numOfDimensions = array_length(other.pointsInSpace);
			if (isDrawingMyLine && dimension != _numOfDimensions-1)
				break;
			
			isDrawingMyLine = true;
		}
	}
	
	for(var _i = (_numOfDimensionsToDraw+1); _i < _numOfDimensions; _i++)
	{
		var _numOfPoints = array_length(_pointsInSpace[_i]);
		for(_j = 0; _j < _numOfPoints; _j++)
		{
			_pointsInSpace[_i][_j].image_alpha = 0;
		}
	}
	
	
	//pontos e linhas aparentes
	for(var _i = 1; _i < _numOfDimensionsToDraw+1; _i++)
	{
		var _basePoints = _pointsInSpace[_i-1]
		var _numOfBasePoints = array_length(_basePoints)
		
		for(var _j = 0; _j < _numOfBasePoints-1; _j++)
		{
			var  _subPoint = _pointsInSpace[_i][_j];
			
			var _col1 = _subPoint.myColor;
			var _col2 = _col1;
			var _pointA = _basePoints[_j];
			var _pointB = _basePoints[_j+1];
			_subPoint.image_alpha = (_subPoint.isDrawingMyLine) ? .75 : 0; 
				
			if (!oControl.isDrawingOnlyLastLine)
				draw_line_width_color(_pointA.x, _pointA.y, _pointB.x, _pointB.y, _width, _col1, _col2);
		}
	}
}