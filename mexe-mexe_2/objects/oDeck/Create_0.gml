if (!variable_instance_exists(id, "color"))
	color = undefined;

//
color = enCardColorOnBack.blue;
//
cardsByKind= [];
allCards = [];
cardsOnStack = [];
limitOfCardsOnStack = 99999999;

scrCreateDeck();
numOfCardsOnStack = array_length(cardsOnStack);

flushCards = function (_deck = self)
{
	var _cardsFromDeck = _deck.allCards;
	array_shuffle_ext(_cardsFromDeck);	
}

giveCardsPaciencia = function (_deck = self)
{
	var _cardsFromDeck = _deck.cardsOnStack;
	var _lastCard = array_last(_cardsFromDeck);	
	
	for(var _i = 0; _i < 7; _i++)
	{
		var _lane = oControl.lanesForPlayingCardsPaciencia[_i];
		for(var _j = 0; _j < _i +1; _j++)
		{
			var _pickedCard = removeTopCard();
			_lane.addCard(_pickedCard);
		}
	}
}



returnTopCard = function()
{
	return array_last(cardsOnStack);	
};

rearrangeLane = function (_offset = 0)
{
	var _calcDist = function(_pos) {return (_pos+1)/2};
	
	for(var _i = _offset; _i < numOfCardsOnStack; _i++)
	{
		var _card = cardsOnStack[_i];
		_card.lockCardOnPosition(x+_calcDist())
	}
}

///TODO: AAAAAAAAAAAA;
removeTopCard = function ()
{
	var _lastCard = array_last(cardsOnStack);
	
	if (cardsOnStack == undefined)
		return undefined;
	
	array_pop(cardsOnStack);
	_lastCard.isLocked = false;
	_lastCard.lockedOn = noone;
	_lastCard.isOnDeck = false;
	numOfCardsOnStack--;
	return _lastCard;
};

addCard = function(_card)
{
	array_push(cardsOnStack, _card);
	_card.isOnDeck = true;
	_card.lockedOn = self;
	
	numOfCardsOnStack++;
}



//retorna index da carta removida
removeCard = function(_card)
{
	var _index = -1;
	for(var _i = 0, _size = array_length(cardsOnStack); _i < _size; _i++)
	{
		if (_card == cardsOnStack[_i])
		{
			_index = _i;
			break;
		}
	}
	//array_find_index(cardsOnStack, function(_v, _i) {return _card == _v});
	
	if (_index == -1)
		return _index;
		
	_card.isLocked = false;
	_card.lockedOn = noone;
	_card.isOnDeck = false;
	array_delete(cardsOnStack, _index, 1);
	return _index;
}


//scrArrangeCards();

