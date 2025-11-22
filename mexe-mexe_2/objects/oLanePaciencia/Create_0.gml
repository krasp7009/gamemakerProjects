typeOfLane = ""; //can be "winningLane" or "playingLane" or "holdingLane"
depth = 500;
basePosition = new vector2D();	
baseDimension  = new vector2D();
laneDimensions = new vector2D();

updateImageScale = function(_dimensions)
{
	// new scale is a function that predicts the certatint image_scale correspondent to a certain dimension
	var _newXscale = scrRoundToWhichAmount(_dimensions.x/self.sprite_width, 3);
	var _newYscale = scrRoundToWhichAmount(_dimensions.y/self.sprite_height, 3);
	self.image_xscale *= _newXscale; //SOU ESTUPIDO ANTES ERA = e NAO *= ESSE ERA O ERRO
	self.image_yscale *= _newYscale; //SOU ESTUPIDO ANTES ERA = e NAO *= ESSE ERA O ERRO
	self.laneDimensions.x = _dimensions.x;
	self.laneDimensions.y = _dimensions.y;
}; 


cardsOnStack = [];
limitOfCardsOnStack = 0;
lastCard = undefined
numOfCardsOnStack = 0;

distanceBetweenCards = 10 / (numOfCardsOnStack * .5); //should be ZERO

updateDistanceBetweenCards = function (_lane = self)
{
	if (numOfCardsOnStack != 0)
		self.distanceBetweenCards = 6/ (numOfCardsOnStack * .05);
	else
		self.distanceBetweenCards = 0;
};

rearrangeLane = function (_lane = self)
{
	switch(_lane.typeOfLane)
	{
		case "playingLane":
			var _distanceBetweenCards = _lane.distanceBetweenCards;
	
			for (var _i = 0; _i < _lane.numOfCardsOnStack; _i++)
			{
				var _card = _lane.cardsOnStack[_i];
				var _xOffSet = _card.sprite_xoffset;
				var _yOffSet = _card.sprite_yoffset;
				var _laneXOffSet = sprite_xoffset;
				var _laneYOffSet = sprite_yoffset;
				var _spriteHeight  = self.sprite_height;
				var _spriteWidth = self.sprite_width;
				
				var _newPosition; 
				
				if (!_card.chainedInfo.isChainning)
				{
					_newPosition= new vector2D(_lane.basePosition.x, _lane.basePosition.y + (_distanceBetweenCards*_i));
				}
				else
				{
					var _ref = _card.chainedInfo.chainningOn;
					_newPosition = new vector2D(_ref.x, _ref.y + _distanceBetweenCards);	
				}
				
				_card.updateDepthByIteration(_i, _lane.numOfCardsOnStack);
				_card.lockCardOnPosition(_newPosition.x, _newPosition.y);	
				_card.lockToObject(_lane);
				
				if ((_card.chainedInfo.isChainning && _card.chainedInfo.isChained) || _card.isFaceDown)
					_card.isDraggable = false ;
				else
					_card.isDraggable = true;
				delete _newPosition;
			}
			var _incrementation = _lane.distanceBetweenCards * (_lane.numOfCardsOnStack-1);
			var _refDimensions = new vector2D(_lane.baseDimension.x, _lane.baseDimension.y);
			_refDimensions.add(0, _incrementation);
			_lane.updateImageScale(_refDimensions);
				
			_lane.y = _lane.basePosition.y + (_incrementation/2);
		break;
		
		case "winningLane":
			for (var _i = 0; _i < _lane.numOfCardsOnStack; _i++)
			{
				var _card = _lane.cardsOnStack[_i];
				var _xOffSet = _card.sprite_xoffset;
				var _yOffSet = _card.sprite_yoffset;
				var _laneXOffSet = sprite_xoffset;
				var _laneYOffSet = sprite_yoffset;
				
				
				var _newPos = new vector2D((_lane.x-_laneXOffSet) + _xOffSet + 10, _lane.basePosition.y); 
				
				_card.updateDepthByIteration(_i, _lane.numOfCardsOnStack);
				_card.isDraggable = false;
				_card.lockCardOnPosition(_newPos.x, _newPos.y);
				_card.lockToObject(_lane);
			}
			array_last(_lane.cardsOnStack).isDraggable = true;
		break;
		
		case "holdingLane":
			var _distanceBetweenCards = _lane.distanceBetweenCards;
	
			for (var _i = 0; _i < _lane.numOfCardsOnStack; _i++)
			{
				var _card = _lane.cardsOnStack[_i];
				var _xOffSet = _card.sprite_xoffset;
				var _yOffSet = _card.sprite_yoffset;
				var _laneXOffSet = sprite_xoffset;
				var _laneYOffSet = sprite_yoffset;
				var _spriteHeight  = self.sprite_height;
				var _spriteWidth = self.sprite_width;	
			
				var _newPosition = new vector2D(_lane.basePosition.x - (_distanceBetweenCards*_i), _lane.basePosition.y);
				_card.updateDepthByIteration(_i, _lane.numOfCardsOnStack);
				_card.lockCardOnPosition(_newPosition.x, _newPosition.y);	
				_card.lockToObject(_lane);
				_card.isDraggable = false;
				_card.turnCard()
				delete _newPosition;		

			}
			var _incrementation = _lane.distanceBetweenCards * (_lane.numOfCardsOnStack-1);
			var _refDimensions = new vector2D(_lane.baseDimension.x, _lane.baseDimension.y);
			_refDimensions.add(_incrementation, 0);
			_lane.updateImageScale(_refDimensions);
			_lane.x = _lane.basePosition.x - (_incrementation/2);
		break;
	}
	array_last(_lane.cardsOnStack).isDraggable = true;
}

addCard = function (_card)
{
	var _lastCard = returnTopCard(); 
	
	array_push(self.cardsOnStack, _card);
	self.numOfCardsOnStack++;
	self.updateDistanceBetweenCards();
	
	if (_lastCard != noone && !_lastCard.isFaceDown)
	{
		_card.chainedInfo.chainArrow(_lastCard);
		_lastCard.chainedInfo.chainButt(_card);
	}
	
	if (_card.chainedInfo.isChained)
	{
		self.addCard(_card.chainedInfo.chainedOn);
		if (!_card.chainedInfo.isChainning)
		{
			return;
		}
	}	
	//rescrever só pra primeira instancia
	self.rearrangeLane();
};

removeCard = function (_card = noone, _offSet = 0)
{	
	var _array = self.cardsOnStack;
	
	if (_card == returnTopCard())
	{
		array_pop(_array);
		self.numOfCardsOnStack--;
	}
	else
	{
		for (var _i = _offSet; _i < self.numOfCardsOnStack; _i++)
		{
			if (_array[_i] == _card)
			{
				if (_card.chainedInfo.isChained)
					removeCard(_card.chainedInfo.chainedOn, _i+1);
				array_delete(_array, _i, 1);
				self.numOfCardsOnStack--;
				break;
			}
		}
	}

	_card.chainedInfo.chainArrow(noone);
	
	_card.isDraggable = true;
	
	if (_offSet == 0)
	{
		self.updateDistanceBetweenCards();
		
		if (self.numOfCardsOnStack > 0)
		{
			self.returnTopCard().chainedInfo.chainButt(noone);
			self.rearrangeLane();//rescrever só pra primeira instancia
		}
	}
	return _card;
}


returnTopCard = function ()
{
	if (array_length(cardsOnStack) > 0)
		return array_last(cardsOnStack);
	else
		return noone;
};