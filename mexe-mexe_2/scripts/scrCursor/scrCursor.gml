global.cursorSprites = 
{
	idle : sCursorDefault,
	onCard : sCursorGrab,
	draggingCard : sCursorGrabbing,
	onInteractable : sCursorSelect,
	pressedOnInteractable : sCursorSelectTap,
	cantInteract : sCursorUnavailable
};

function scrDoingBulshit()
{
	//will know what is above cursor
	var _objectAbove = instance_position(self.x, self.y, oDeck)
	var _nameOfObject;

	if (_objectAbove != noone)
		_nameOfObject = object_get_name(_objectAbove.object_index);
	else 
		_nameOfObject = undefined;

	switch(_nameOfObject)
	{
		case "oCard":
			//checks for taking only cards on top of deck or out of deck
			var _topCardOnDeck = (_objectAbove.isLocked) ? array_last(_objectAbove.lockedOn.cardsOnStack) : noone;
			var _isTopCard = position_meeting(x, y, _topCardOnDeck);
			if (_isTopCard)
				_objectAbove = _topCardOnDeck;
		
			if (_objectAbove.isLocked && _objectAbove.lockedOn.object_index == oDeck)
			{
				if (mouse_check_button(mb_left))
				{
					sprite_index =  global.cursorSprites.pressedOnInteractable;
				}
				else  if (mouse_check_button_released(mb_left))
				{	
					self.objectSelected = _objectAbove;
					oPlayer.lastCardInteracted = _objectAbove;	
				}
				else
				{
					sprite_index = global.cursorSprites.onInteractable;	
				}
			}
			else if (_objectAbove.isDraggable)
			{
				if (mouse_check_button_pressed(mb_left))
				{
					self.sprite_index = global.cursorSprites.draggingCard;
					draggingCard = true;
					self.state = scrDragCard;
					self.state(_objectAbove);
					
				}
				else
				{
					self.sprite_index = global.cursorSprites.onCard	
				}
			}
			else
			{
				self.sprite_index = global.cursorSprites.cantInteract;
			}
		break;
		
		case "oDeck":

		break;
		
		default:
			self.sprite_index = global.cursorSprites.idle;	
		break;
	}

}


function scrDragCard(_id= undefined)
{
	static _card = noone;
	static _cardDepth = undefined;
	if (_id != undefined)
	{
		_card = _id;
		_card.isHolded = true;
		_cardDepth = _card.depth;
	}
	
	_card.positionX = x;
	_card.positionY = y;
	_card.depth = self.depth/2;
	

	if (mouse_check_button_released(mb_left))
	{
		_card.isHolded = false;
		_card.depth = _cardDepth;
		oPlayer.lastCardInteracted = _card;
		state = scrDoingBulshit;	
		_card = noone;
		draggingCard = false;
		droppingCard = true;
		//sprite_index = sCursorDefault;
	}
	
	draggingCard = _card;
}
