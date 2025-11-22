if (keyboard_check_pressed(vk_space))
{
	isTurning = true;
}


if (isHolded)
{
	hsp = lerp(0, positionX - x, acceleration);
	vsp = lerp(0, positionY - y, acceleration);
}
else if (chainedInfo.isChained || chainedInfo.isChainning)
{
	var _isButtConnected = chainedInfo.isChained;
	var _isHeadConnected = chainedInfo.isChainning;
	
	
	if (chainedInfo.isChainning)
	{
		//update position to follow if isnt in right possition and isnt locked into playing lane
		if (!chainedInfo.chainningOn.isOnLockedPosition() && lockedOn.typeOfLane == "playingLane")
		{
			var _ref = chainedInfo.chainningOn;
			lockCardOnPosition(_ref.x, _ref.y + lockedOn.distanceBetweenCards);
			updateDepth(chainedInfo.chainningOn.depth-1);
		}	
	}
	
	if (!isOnLockedPosition())
		moveCardToLockedPosition();	
}
else if (isLocked)
{
	if (!isOnLockedPosition())
		moveCardToLockedPosition();
	else
		depth = cardDepth;
}
else
{
	//all this block just runs if card isnt appended to anything
		if (hsp != 0|| vsp != 0)
		{
			hsp = lerp(hsp, 0, acceleration);
			vsp = lerp(vsp, 0, acceleration);
		}
		/*
		else
		{
			x = lerp(x, positionX, acceleration);	
			y = lerp(y, positionY, acceleration);
		}
		*/
}

x += hsp;
y += vsp;

//image_angle = point_direction(x, y, mouse_x, mouse_y) +90