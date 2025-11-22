function scrIsInstanceOfObject(_obj, _nameOfAimedObject)
{
	var _nameOfObj = object_get_name(_obj.object_index);
	if (_nameOfAimedObject == _nameOfObj)
		return true;
	else
		return false;
	
}

function scrRoundToWhichAmount(_num, _amount)
{
	var _amountInDecimals = power(10, _amount);
	var _newNum = round(_num* _amountInDecimals);
	_newNum /= _amountInDecimals;
	return _newNum;
}

function scrConvertListToArray(_dsList)
{
	var _sizeOfList = ds_list_size(_dsList);
	var _newArray = array_create(_sizeOfList);
	
	for (var _i = 0; _i < _sizeOfList; _i++)
	{
		_newArray[_i] = _dsList[|_i];
	}
	
	ds_list_destroy(_dsList);
	
	return _newArray;

}

///@description works like instance_position, but gives the first colided instance that is not self running code
function scrCollisionWithOthersPlaceId(_x, _y, _collisionsObjects)
{
	var _dsList = ds_list_create();
	
	var _numOfInsts =instance_position_list(_x, _y, _collisionsObjects, _dsList, false);
	var _returnValue = noone;
	
	
	for (var _i = 0; _i < _numOfInsts; _i++)
	{
		var _other = _dsList[|_i];
		if (_other.id != id && self.lockedOn != _other.lockedOn)
		{
			_returnValue = _dsList[|_i];
			break;
		}
	}
	
	
	ds_list_destroy(_dsList);
	return _returnValue;
}

function vector2D(_x = 0, _y = 0) constructor
{
	x = _x;
	y = _y;
	
	function add(_x, _y)
	{
		self.x += _x;
		self.y += _y;
	}
	
	function change(_x, _y)
	{
		self.x = _x;
		self.y = _y;
	}
}