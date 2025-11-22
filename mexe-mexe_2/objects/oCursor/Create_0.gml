onCard = false;
draggingCard = noone;
droppingCard = false;
state = scrDoingBulshit;


objectSelected = noone;


global.cursorSprites = 
{
	idle : sCursorDefault,
	onCard : sCursorGrab,
	draggingCard : sCursorGrabbing,
	onInteractable : sCursorSelect,
	pressedOnInteractable : sCursorSelectTap,
	cantInteract : sCursorUnavailable
};
	

scale = 1.5;
image_xscale = scale;
image_yscale = scale;
depth = -200;

debug = 0; 