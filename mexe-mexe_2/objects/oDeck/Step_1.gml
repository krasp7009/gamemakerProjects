var _lastIndex = array_length(cardsOnStack)-1;

/*
if (_lastIndex + 1 > 0)
{
	if (!cardsOnStack[_lastIndex].isDraggable)
	{
		cardsOnStack[_lastIndex].isDraggable = true;
	}

	with (cardsOnStack[_lastIndex])
	{
		if !(place_meeting(x, y, other.cardsOnStack[_lastIndex-1]))
		{
			self.isOnDeck = false;
			self.isLocked = false;
			array_pop(other.cardsOnStack);
		}
	}	
}
*/