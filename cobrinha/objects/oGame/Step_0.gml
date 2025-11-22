if !global.op_menu
{
	var ap_exist= instance_exists(oMadplsh);

	if !ap_exist
	{
		randomize();
		var width= sprite_get_width(sMadplsh);
		var height= sprite_get_height(sMadplsh);
	
		var xx, yy;
		
		do
		{
			xx= irandom_range(0, room_width-width);
			yy= irandom_range(0, room_height-height);	
		//pega o resto, e torna o mais proximo possivel de uma coordenada correta ao grid
			xx= (xx % width == 0) ? xx : (round(xx / width)*width);
			yy= (yy % height == 0) ? yy : (round(yy / height)*height);
		}
		until(position_empty(xx, yy));
		
		instance_create_layer(xx, yy, "Instances", oMadplsh);	
	}
}