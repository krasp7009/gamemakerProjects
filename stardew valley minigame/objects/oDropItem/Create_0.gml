//variables are set on oGame, in a struct called (buffItemsInfo)


	
//pseudo aleatoriedade (extremamente ruim, mas por enquanto fica assim)
var _randomItem = irandom_range(0, array_length(oGame.allBuffItems)-1); 
var _structItemConstructor = variable_struct_get(oGame.buffItemsInfo, oGame.allBuffItems[_randomItem]);
	
item = new _structItemConstructor();
sprite_index = item.sprite;



var _seconds = 10;
timeUntilVanishing = 60 * _seconds;
alarm[0] = timeUntilVanishing;
visible = true;

_seconds = .25
blinkEfectInterpolation = timeUntilVanishing * .3 * .10;
