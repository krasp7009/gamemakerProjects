///draw background

//green background
var _color = make_color_rgb(18, 117, 29);
draw_set_color(_color);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);

/// USAR ESSA FUNÇÃO PARA SOMBRA DAS CARTAS
//draw_sprite_stretched_ext()
/*
var _drawPlayingLane = function (_element, _index)
{
	var _inst = _element;
	var _spriteHeight = _inst.laneDimensions.y;	//sprite_get_height(sCardShadow);
	var _spriteWidth = _inst.laneDimensions.x;	//sprite_get_width(sCardShadow);
	var _heightStretched = _inst.distanceBetweenCards;
	var _xOfSet = _inst.sprite_xoffset ;	//sprite_get_xoffset(sCardShadow);
	var _yOfSet = _inst.sprite_yoffset;	//sprite_get_yoffset(sCardShadow);
	var _position = new vector2D(_inst.x - _xOfSet, _inst.y - _yOfSet);
	
	var _extraSpace = (_heightStretched * (_inst.numOfCardsOnStack-1));
	
	draw_sprite_stretched_ext(_inst.sprite_index, 0, _position.x, _position.y, _spriteWidth, 
	(_spriteHeight) + (_extraSpace), c_white, 1);
	
	//_spriteHeight * 1.75
}

var _drawWinningLane = function (_element, _index)
{
	var _inst = _element;
	var _spriteHeight = _inst.laneDimensions.y;	//sprite_get_height(sCardShadow);
	var _spriteWidth = _inst.laneDimensions.x;	//sprite_get_width(sCardShadow);
	var _xOfSet = _inst.sprite_xoffset ;	//sprite_get_xoffset(sCardShadow);
	var _yOfSet = _inst.sprite_yoffset;	//sprite_get_yoffset(sCardShadow);
	var _position = new vector2D(_inst.x - _xOfSet, _inst.y - _yOfSet);
	
	draw_sprite_stretched_ext(_inst.sprite_index, 0, _position.x, _position.y, _spriteWidth, 
	_spriteHeight, c_white, 1);
	/*draw_sprite_stretched_ext(_inst.sprite_index, 0, _position.x, _position.y, _spriteWidth*1.2, 
	_spriteHeight*1.2, c_white, 1);
	*/
/*}

var _numOfPlayingLanes = array_length(lanesForPlayingCardsPaciencia);
var _numOfWinningLanes = array_length(lanesForWinningCardsPaciencia);

for (var _i = 0; _i < _numOfPlayingLanes; _i++)
{
	_drawPlayingLane(lanesForPlayingCardsPaciencia[_i], _i);	
}

for (var _i = 0; _i < _numOfWinningLanes; _i++)
{
	_drawWinningLane(lanesForWinningCardsPaciencia[_i], _i);	
}
