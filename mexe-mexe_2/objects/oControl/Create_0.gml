randomize();

#region inputs
	
isMB1Pressed = false;
isMB1Released = false;
isMB1Pressing = false;	
#endregion


#region deckHolders
//i think i could make sub-arrays that could hold cards from same suit (naipe)
//[0] = spades, [1] = hearts, [2] = diamonds, [3] = clubs;
//instance_create_layer(50, 200, "Instances", oDeck, {color : enCardColorOnBack.blue});
//instance_create_layer(250, 200, "Instances", oDeck, {color : enCardColorOnBack.red});
tableDeck = []; // changed the idea, arrays have the same power of ds_list in gml //ds_list is great for playing with deck

var _deckPosition = {x : 0, y : 0};
gameDeck = noone;
gameMouse = noone;
playerId = instance_create_layer(0, 0, "Instances", oPlayer);

lanesForPlayingCardsPaciencia = [];
lanesForWinningCardsPaciencia = [];
laneForHoldingCardsPaciencia = noone;
var _playingLaneDimensions = new vector2D(110, 142.6);
var _winningLaneDimensions = new vector2D(105.6, 148.8);

switch(room)
{
	case rBaseRoom:
		_deckPosition = {x : 1084, y : 608};
	break;
	case rPaciencia:
		_deckPosition = {x : 1200, y : 150};
		gameDeck = instance_create_layer(_deckPosition.x, _deckPosition.y, "Instances", oDeck);
		gameMouse = instance_create_layer(0, 0, "Instances", oCursor);
		var _numOfColumns = 7;
		var _spriteWidth = sprite_get_width(sCardShadow);
		var _basePositionLane = new vector2D(80, 120);
		
		var _holdinLane = instance_create_layer(gameDeck.x  - _winningLaneDimensions.x, gameDeck.y,
		"Instances", oLanePaciencia);
		laneForHoldingCardsPaciencia = _holdinLane
		_holdinLane.typeOfLane = "holdingLane";
		_holdinLane.limitOfCardsOnStack = 5;
		_holdinLane.baseDimension = _winningLaneDimensions;
		_holdinLane.updateImageScale(_winningLaneDimensions);
		_holdinLane.basePosition = new vector2D(_holdinLane.x, _holdinLane.y);
		
		for(var _i = 0; _i < 4; _i++)
		{
			var _inst = instance_create_layer(_basePositionLane.x + (_spriteWidth*1.5 )*_i
			, _basePositionLane.y, "Instances", oLanePaciencia);
			array_push(lanesForWinningCardsPaciencia, _inst);
			_inst.basePosition = new vector2D(_inst.x, _inst.y);
			_inst.typeOfLane = "winningLane";
			_inst.limitOfCardsOnStack = 13;
			_inst.baseDimension = _winningLaneDimensions;
			_inst.updateImageScale(_winningLaneDimensions);
		}
		
		
		for(var _i = 0; _i < _numOfColumns; _i++)
		{
			 var _inst = instance_create_layer(_basePositionLane.x*3 + (_spriteWidth*1.5 )*_i,
			_basePositionLane.y*3, "Instances", oLanePaciencia);
			array_push(lanesForPlayingCardsPaciencia, _inst);
			_inst.basePosition = new vector2D(_inst.x, _inst.y);
			_inst.baseDimension = _playingLaneDimensions;
			_inst.updateImageScale(_playingLaneDimensions);
			_inst.typeOfLane = "playingLane";
			_inst.limitOfCardsOnStack = 13;
		}
				
	break;
}


#endregion
window_set_cursor(cr_none);