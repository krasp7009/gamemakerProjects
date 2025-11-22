#region stupid checks for stupid people
if (!variable_instance_exists(id, "suitOfCard"))
{
	suitOfCard = enSuitOfCard.hearts;
}
if (!variable_instance_exists(id, "cardStates"))
{
	cardStates = undefined;
}
if (!variable_instance_exists(id, "classOfCard"))
{
	classOfCard = enCardClass.one;
}
if (!variable_instance_exists(id, "colorOnBack"))
{
	colorOnBack = enCardColorOnBack.red;
}
if (!variable_instance_exists(id, "structId"))
{
	structId = undefined;
}

#endregion

cardColor = undefined;

if (suitOfCard == enSuitOfCard.hearts || suitOfCard == enSuitOfCard.diamonds)
	cardColor = enColorOfCard.red;
else
	cardColor = enColorOfCard.black;

debug = true;

depth = 1;
cardDepth = depth;
isFaceDown = true;
isTurning = false;
isDraggable = false;
isLocked = true;
isHolded = false;
isOnDeck = false;
turnSpd = 0.025;

/// @description true = face pra baixo, false = face pra cima
turnCard = function (_turnCardDir)
{
	if (isFaceDown && !_turnCardDir)
		isTurning = true;
	else if (!isFaceDown && _turnCardDir)
		isTurning = trues;
}

chainedInfo = 
{
	chainedOn : noone,
	chainningOn : noone,				
	isChained : false,		// is kinda like the butt of the arrow 
	isChainning : false,	// is kinda like the point of the arrow
	chainButt : function(_id = noone)
	{
		self.isChained = (_id != noone) ? true : false;
		self.chainedOn =  _id
	},
	chainArrow : function(_id = noone)
	{
		self.isChainning = (_id != noone) ? true : false;
		self.chainningOn = _id;
	}
};

lockedOn = noone;


scale = 1;
image_index = colorOnBack;
image_xscale = -scale;
image_yscale = scale;
turnImageXScale = false;
turnAngle = false;



positionX = x;
positionY = y;
positionXLocked = 0;
positionYLocked = 0;
acceleration = .15 //interpolation percentage
hsp = 0;
vsp = 0;

updateAcceleration = function (_num)
{

};


///@param _x geralmente é _i e o _y geralmente é o _j
updateDepthByIteration = function (_x = 0, _y = 0)
{
	self.updateDepth(-_x + _y);
};

updateDepth = function (_num)
{
	self.cardDepth = _num;
	self.depth = self.cardDepth;
};

//será usado por locked e chained
lockCardOnPosition = function (_x, _y)
{
	self.positionXLocked = _x;
	self.positionYLocked = _y;
	isLocked = true;	
}

isOnLockedPosition = function ()
{
	var _isOnDestinationX = (x == positionXLocked);
	var _isOnDestinationY = (y == positionYLocked);
	return (_isOnDestinationX && _isOnDestinationY);
}

moveCardToLockedPosition = function()
{
	hsp = lerp(0, positionXLocked - x, acceleration);
	vsp = lerp(0, positionYLocked - y, acceleration);
			
	var _isMoving = (hsp != 0 || vsp != 0) ? true : false;
		
	if (_isMoving)
	{
		var _distanceX = abs(positionXLocked - x);
		var _distanceY = abs(positionYLocked - y);
			
		if (_distanceX < 1)
		{	
			hsp = 0;
			positionX = positionXLocked;
			x = positionX;
		}
			
		if (_distanceY < 1)
		{
			vsp = 0;
			positionY = positionYLocked;
			y = positionY;
		}
	}
}



lockToObject = function (_obj)
{
	self.lockedOn = _obj;
}

removeLockToObj = function (_obj)
{
	self.lockedOn = noone;
}


#region shader
uPixelW = shader_get_uniform(shOutlineOnCard, "pixelW");
uPixelH = shader_get_uniform(shOutlineOnCard, "pixelH");
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));

#endregion
