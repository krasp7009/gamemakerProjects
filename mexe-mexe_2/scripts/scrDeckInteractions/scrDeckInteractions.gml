enum enCardStates
{
	onDeck,
	onGame,
	onHand
};

enum enSuitOfCard
{
	spades,
	hearts,
	diamonds,
	clubs
};

enum enColorOfCard
{
	red,
	black
};

global.spriteOfSuit = 
[
	sSpades, 
	sHearts, 
	sDiamonds, 
	sClubs
];



enum enCardClass
{
	//one is valid as fourteen
	one,
	two,
	three,
	four,
	five,
	six,
	seven,
	eight,
	nine,
	ten,
	eleven,
	twelve,
	thirteen
};

enum enCardColorOnBack
{
	red,
	blue
};



function scrInitCard(_suitOfCard, _cardStates, _classOfCard, _colorOnBack) constructor
{
	suitOfCard = _suitOfCard;
	cardStates = _cardStates;
	classOfCard = _classOfCard;
	colorOnBack = _colorOnBack;
	cardInstance = undefined;
	structId = self;
	
	static createInstance = function(_x, _y, _layer = "Instances", _structForInstaneVars = self)
	{
		if (cardInstance != undefined)
			instance_destroy(cardInstance);
			
		cardInstance = instance_create_layer(_x, _y, _layer, oCard, _structForInstaneVars);
		return cardInstance;
	}
}

///@description if not runned on oDeck, pass the deck to hold the cards
function scrCreateDeck(_deck = self)
{
	//i think i could make sub-arrays that could hold cards from same suit (naipe)
	//[0] = spades, [1] = hearts, [2] = diamonds, [3] = clubs;
	var _NUMOFSUITS = 4;
	var _NUMOFCARDSFORSUIT = 13;
	var _NUMOFCARDSONTOTAL = _NUMOFSUITS * _NUMOFCARDSFORSUIT;
	//_i is equal to the suit of the card, and the _j is equal to the value of the card
	for(var _i = 0; _i < _NUMOFSUITS; _i++)
	{
		for(var _j = 0; _j < _NUMOFCARDSFORSUIT; _j++)
		{
			var _card = new scrInitCard(_i, enCardStates.onDeck, _j, _deck.color);
			//create cards position
			var _length = array_length(_deck.allCards);
			switch(room)
			{
				//case rBaseRoom:
				default:
					var _inst = _card.createInstance(_deck.x + _length/2, _deck.y - _length/2);
					array_push(_deck.allCards, _inst); 
					_inst.updateDepthByIteration(_length, _NUMOFCARDSONTOTAL);
					_inst.isOnDeck = true;
					_inst.isLocked = true;
					_inst.lockedOn = _deck	
					_inst.positionXLocked = _inst.x;
					_inst.positionYLocked = _inst.y;
				break;
			}

		}
	}
	var _len = array_length(_deck.allCards);
	array_copy(_deck.cardsOnStack, 0, _deck.allCards, 0, _len);
}


function scrArrangeCards(_deck = self)
{
	array_shuffle_ext(_deck.cardsOnStack);
	for (var _i = 0,  _length = array_length(_deck.cardsOnStack); _i < _length; _i++)
	{
		var _inst = _deck.cardsOnStack[_i];
		//_inst.x = _deck.x + (_i+1)/2;
		//_inst.y = _deck.y - (_i+1)/2;
		_inst.updateDepthByIteration(_i, _length);
		_inst.lockCardOnPosition(_deck.x + (_i+1)/2, _deck.y - (_i+1)/2);
		_inst.lockToObject(_deck);
		_inst.chainedInfo.chainArrow(noone);
		_inst.chainedInfo.chainButt(noone);
		_inst.isDraggable = false;
	}
	array_last(_deck.cardsOnStack).isDraggable = true;
	
}

function scrPassCardFromStackToStack(_stackToRemove, _stackToAdd, _cardToRemove)
{
	if (_stackToAdd.limitOfCardsOnStack >= array_length(_stackToAdd.cardsOnStack))
	{
		_stackToRemove.removeCard(_cardToRemove);
		_stackToAdd.addCard(_cardToRemove);
	}
}


function scrTurnCard(_card = self)
{
	static _tmpSpd = self.turnSpd
	var _increaseOnSpd = .005;
	var _spriteOfSuit = global.spriteOfSuit[self.suitOfCard];
	var _signOfTurn = (self.isFaceDown) ? 1 : -1;

	image_xscale += _tmpSpd * _signOfTurn;
	if (image_xscale > 0)
	{
		sprite_index = _spriteOfSuit;
		image_index = self.classOfCard;
	}
	else
	{
		sprite_index = sCardBack;
		image_index = self.colorOnBack;
	}
			
	_tmpSpd += _increaseOnSpd;
	image_xscale = clamp(image_xscale, -1, 1);
		
	if (image_xscale == 1)
	{
		isFaceDown = !isFaceDown;
		_tmpSpd = turnSpd;
		isTurning = false;
	}
	else if (image_xscale == -1)
	{
		isFaceDown = !isFaceDown;	
		_tmpSpd = turnSpd;
		isTurning = false;
	}
}