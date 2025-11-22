

/*
if (!surface_exists(gameSurface))
{
	gameSurface = surface_create(view_wport[1], view_hport[1]);
	view_surface_id[1] = gameSurface;
	
	surface_set_target(gameSurface);
	draw_clear_alpha(c_black, 0);
	draw_sprite_ext(sHelmetZombie, 0, 40, 40, 25, 25, 0, c_white, 1);
	surface_reset_target();
}

