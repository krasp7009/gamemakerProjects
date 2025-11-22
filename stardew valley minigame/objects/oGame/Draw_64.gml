#region DEBUG
draw_text(20, 20, "numOfEnemies: " + string(numOfEnemies));

//desenha linhas do grid pra saber mais ou menos a cordenada
/*for(var _i = 1, _numOfGrids = room_width/sprite_get_width(oPlayer.sprite_index); _i <= _numOfGrids; _i++)
{
	var _sizeOfViewPort = view_get_wport(1);
	var _sizeOfGrid = _sizeOfViewPort/sprite_get_width(oPlayer.sprite_index);
	var _col = c_white;
	var _horizontalLine = {x1 : viewPointX, y:  viewPointY +  _sizeOfGrid * _i, x2: viewPointX + _sizeOfViewPort};
	var _verticalLine = {x: viewPointX + _sizeOfGrid * _i, y1: viewPointY, y2: viewPointY + _sizeOfViewPort};
	
	draw_line_color(_horizontalLine.x1, _horizontalLine.y, _horizontalLine.x2, _horizontalLine.y, _col, _col);
	draw_line_color(_verticalLine.x, _verticalLine.y1, _verticalLine.x, _verticalLine.y2, _col, _col);
}
*/
#endregion

#region GUI
//appropriate scale to the sprites on game
var _scaleToView = view_hport[1]/room_width;

#region leftSide

var _moldeSize =  sprite_get_width(sMolde) * _scaleToView;

var _moldeX = viewPointX - _moldeSize - 5;

draw_sprite_ext(sMolde, 0, _moldeX, viewPointY, _scaleToView, 
							_scaleToView, 0, c_white, 1);

drawningItemOnMolde(_moldeX, viewPointY);

var _sepX = 30 // const For life and money
var _lifeSize = sprite_get_width(sPlayerLifes) * _scaleToView; // origin point in the middle

var _lifeX = viewPointX - _lifeSize/2 - _sepX
var _lifeY = viewPointY + _moldeSize + _lifeSize/2;

draw_sprite_ext(sPlayerLifes, 0, _lifeX, _lifeY, _scaleToView, _scaleToView, 0, c_white, 1);
							
var _coinSize = sprite_get_width(sPlayerCoins) * _scaleToView;
var _coinX = viewPointX - _coinSize/2 - _sepX;
var _coinY = _lifeY + _coinSize;

draw_sprite_ext(sPlayerCoins, 0, _coinX,
							_coinY, _scaleToView, _scaleToView, 0, c_white, 1);

draw_set_font(fStardewValley);
draw_set_valign(fa_middle);

draw_text(_lifeX + _sepX/2, _lifeY, "x " + string(playerLifes));
draw_text(_coinX + _sepX/2, _coinY, "x " + string(playerCoins));

draw_set_valign(fa_top);
draw_set_font(fDebug);
#endregion


#region TIMER
var _watchSize = sprite_get_width(sWatch) * _scaleToView;
var _watchX = viewPointX + _watchSize/4;
var _watchY = viewPointY - _watchSize/2 + 2;

draw_sprite_ext(sWatch, 0, _watchX, _watchY,
							_scaleToView, _scaleToView, 0, c_white, 1);
							
var _barX = _watchX + _watchSize/4 + 4;
var _barY = _watchY - 2;

var _barPercentage = alarm[0]/roundTimer;
var _movingBarWidth = timerBarWidth * _barPercentage;
var _color = (_barPercentage > .15) ? c_green : c_red; 

draw_sprite_stretched_ext(sTimerBar, 0, _barX, _barY, _movingBarWidth, 
												timerBarHeight, _color, 1);
#endregion

#endregion

//draw_circle(viewPointX, viewPointY, 5, true);