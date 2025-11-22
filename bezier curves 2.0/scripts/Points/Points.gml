//cria subpontos (se movimentaram diande das linhas) e retorna array desses pontos
function scr_move_sub_points(_pointsInSpace, _spd = 1)
{
	static _t = 0;
	//dessa forma vai mais lento o movimento
	var _deltaTime = (delta_time/1000000) * _spd;  //delta_time/1000000;
	
	_t = (_t + _deltaTime) % 1;
	
	for(var _i = 0, _numOfDimensions = array_length(_pointsInSpace); _i < _numOfDimensions-1; _i++)
	{
		var _basePoints = _pointsInSpace[_i];
		var _baseSize = array_length(_basePoints);
		
		var _movingPoints = _pointsInSpace[_i+1];
		for(var _j = 0, _numOfMovPoints = array_length(_movingPoints); _j < _numOfMovPoints; _j++)
		{
			if (_j == _baseSize-1)
				break;
			
			var point1 = _basePoints[_j];
			var point2 = _basePoints[_j+1];
			var subPoint = _movingPoints[_j];
		
			subPoint.x = (lerp(point1.x, point2.x, _t));
			subPoint.y = (lerp(point1.y, point2.y, _t));
		}
	}
}

function scr_create_sub_points(_pointsInSpace, _size = .5)
{
	var _numOfBasePoints = array_length(_pointsInSpace[0]);
	var _numOfDimensions = array_length(_pointsInSpace);
	
	for(var _i = 1; _i < _numOfBasePoints; _i++)
	{
		var _dimensionNotInitialized = (_numOfDimensions < _i+1) ? true : false;
		_pointsInSpace[_i] = (_dimensionNotInitialized) ? [] : _pointsInSpace[_i];
		
		var _subPoints = _pointsInSpace[_i];
		var _numOfSubPoints = array_length(_subPoints);
		for(var _j = _numOfSubPoints; _j < _numOfBasePoints-_i; _j++)
		{
			var _basePoint = _pointsInSpace[_i-1][_j];
			var _point = instance_create_layer(_basePoint.x, _basePoint.y, "Instances", oSubPoints);
			_point.dimension = _i;
			
			var _listOfColors = oControl.colors;
			var _numOfColors = array_length(_listOfColors);
			_point.myColor = _listOfColors[_i%_numOfColors];
			_point.image_blend = _point.myColor;
			_point.image_xscale = .5;
			_point.image_yscale = .5;
			_subPoints[_j] = _point; 
		}
	}
}

function scr_create_point(_pointsInSpace, _x, _y, _size = .75)
{
	var _point = instance_create_layer(_x, _y, "Instances", oPoints);
	_point.myColor = oControl.colors[0];
	_point.image_blend = oControl.colors[0];
	_point.image_xscale = _size;
	_point.image_yscale = _size;
	
	var _isNotInitialized = (!array_length(_pointsInSpace) > 0);
	_pointsInSpace[0] = (_isNotInitialized) ? [] : _pointsInSpace[0];
	
	array_push(_pointsInSpace[0], _point);
	
	oControl.dimensionsToDraw += (array_length(_pointsInSpace[0]) > 1) ? 1 : 0;	
	scr_create_sub_points(_pointsInSpace);
}

