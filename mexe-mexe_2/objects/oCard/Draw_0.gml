#region shader
/*
shader_set(shOutlineOnCard);
shader_set_uniform_f(uPixelH, texelH);
shader_set_uniform_f(uPixelW, texelH);
draw_self();
shader_reset();
*/
#endregion

draw_self();

if (isTurning)
{
	scrTurnCard();	
}

//debug
if (!isFaceDown)
{

}