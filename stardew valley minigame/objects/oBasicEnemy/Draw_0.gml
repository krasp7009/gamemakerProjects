if (blinkPercentage > 0)
	blinkPercentage -= .15;


shader_set(shBlink);
shader_set_uniform_f(uniformId, blinkPercentage);
draw_self();
shader_reset();