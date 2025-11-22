randomize();
global.deltaTime = delta_time/1000000;

highscore = 0;
pontuation = 0;
#region shader
isWhite = true;
Button = 
{
	sprite : sColorButton,
	x : window_get_width() - sprite_get_width(sColorButton) - 6,
	y : 10,
	checkClick : function ()
	{
		var _spriteWidth = sprite_get_width(self.sprite);
		var _spriteHeight = sprite_get_height(self.sprite);
		var _mouseX = window_mouse_get_x();
		var _mouseY = window_mouse_get_y();
		var _isMouseInCollisionX = (_mouseX >= self.x && _mouseX <= self.x + _spriteWidth);
		var _isMouseInCollisionY = (_mouseY >= self.y && _mouseY <= self.y + _spriteHeight);
		
		if ((_isMouseInCollisionX && _isMouseInCollisionY) && mouse_check_button_pressed(mb_left))
		{
			oGame.isWhite = !oGame.isWhite;	
		}
	},
	draw : function ()	
	{
		draw_sprite(sColorButton, (oGame.isWhite) ? 0 : 1, self.x, self.y);	
	}
};

addRGB = (isWhite) ? 0 : -1;
revertColorID = shader_get_uniform(shReverseColors, "add");
#endregion

#region cenario
groundColor = c_white;
groundSpd = 180;
groundWidth = sprite_get_width(sGround);
groundXpositions = 
[
	room_width-groundWidth*2,
	room_width-groundWidth,
	room_width,
]
groundYposition = room_height - sprite_get_height(sGround)+ (sprite_get_yoffset(sGround));

instance_create_layer(40, groundYposition - sprite_get_yoffset(sBirdWalking) , "Instances", oBird);
#endregion

alarm[0] = 60 * 2;