var _isCursorAboveCardDropped = position_meeting(gameMouse.x, gameMouse.y, playerId.lastCardInteracted);

if (gameMouse.droppingCard)
{
	var _laneOfInteractbleCard = playerId.lastCardInteracted.lockedOn;
	var _card = playerId.lastCardInteracted;
	var _isCollidingWithLane = false;
	var _laneOfCollided = noone;
	var _cardColided = noone;
	var _isCollidingWithInterectableCard = false;
	var _laneLastCard = noone;
	var _gameMouse = oControl.gameMouse;
	

	with(_card)
	{
		_cardColided = scrCollisionWithOthersPlaceId(_gameMouse.x, _gameMouse.y, oCard);
		
		if (_cardColided != noone)
		{
			//pega o endereço da lane da carta a qual colidimos
			_laneOfCollided = _cardColided.lockedOn;
						
			//pega ultima carta da lane que encontramos e checa se estamos colidindo com ela
			_laneLastCard = array_last(_laneOfCollided.cardsOnStack);
			_isCollidingWithInterectableCard = place_meeting(_laneLastCard.x, _laneLastCard.y, _laneLastCard);
			_cardColided = (_isCollidingWithInterectableCard) ? _laneLastCard : noone;

		}
		else
		{
			_isCollidingWithLane = place_meeting(_gameMouse.x, _gameMouse.y, oLanePaciencia);
			_laneOfCollided = instance_position(_gameMouse.x, _gameMouse.y, oLanePaciencia);
		}	
	}
	//lane a qual a carta solta colidiu
	if (_laneOfCollided != noone)
	{
		switch(_laneOfCollided.typeOfLane)
		{
			case "playingLane":
				if (_isCollidingWithInterectableCard)
				{
					if (_card.classOfCard == _cardColided.classOfCard-1 && 
					_card.cardColor != _cardColided.cardColor)
					{
						scrPassCardFromStackToStack(_laneOfInteractbleCard, _laneOfCollided, _card);
					}			
				}
				else if (_isCollidingWithLane)
				{
					if (_laneOfCollided.returnTopCard() == noone)
					{
						if (_card.classOfCard == enCardClass.thirteen)
						{
							//retira carta da lane que esta entregando carta	//adiciona carta a sua nova lane		
							scrPassCardFromStackToStack(_laneOfInteractbleCard, _laneOfCollided, _card);
						}
					}
				}
			break;
			
			case "winningLane": 
				if (!_card.chainedInfo.isChained)
				{
					var _topCardOfLane =  _laneOfCollided.returnTopCard();
				
					var _lastCardClass = (_topCardOfLane == noone) ? -1 : _topCardOfLane.classOfCard;
					var _lastCardSuit = (_topCardOfLane == noone) ? _card.suitOfCard : _topCardOfLane.suitOfCard;
					if (_lastCardClass+1 == _card.classOfCard && _card.suitOfCard ==_lastCardSuit)
					{	 
						scrPassCardFromStackToStack(_laneOfInteractbleCard, _laneOfCollided, _card);
					}	
				}
			break;	
		}
	}	
}
else if (gameMouse.objectSelected != noone)
{
	//var _cardInterected = gameDeck.removeTopCard();
	//laneForHoldingCardsPaciencia.addCard(_cardInterected);	
	scrPassCardFromStackToStack(gameDeck, laneForHoldingCardsPaciencia, gameDeck.returnTopCard());
}