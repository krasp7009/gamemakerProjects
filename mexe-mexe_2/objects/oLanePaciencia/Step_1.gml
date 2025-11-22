lastCard = array_last(cardsOnStack);

switch(typeOfLane)
{
	case "playingLane":
		if (lastCard != undefined)
		{
			if (oControl.gameMouse.droppingCard)
			{
				debug = 10;	
			}
		
			lastCard.isTurning = (lastCard.isFaceDown) ? true : false;
			lastCard.isDraggable = true;
		}
	break;
	

}
