if effect
{
	shader_set(Steste);
	shader_set_uniform_f(UN_blink, blink);
	draw_self();
	shader_reset();
}
else
{
	draw_self();	
}

if blink > 0
{
	blink -= .05	
}
else
{
	effect= 0;	
}