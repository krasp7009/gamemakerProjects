if global.op_menu
{
	#region sprite e texto
	var _width= room_width/2;
	var _height= (room_height/2)- 80;
	var _s= "aperte as setas ou wasd para comecar!!!";
	var _c= c_red;
		
	draw_set_halign(fa_center);
	draw_text_transformed_color(_width, _height, _s, 1, 2, angle, _c, _c, _c, _c, 1);
	#endregion
}

