shader_set(shReverseColors);
shader_set_uniform_f(revertColorID, addRGB);
draw_set_font(fFonte);
draw_set_color(c_black);

draw_text(20, 20, "PONTUAÇÃO: " + string(pontuation));
draw_text(20, 50, "HIGHSCORE: " + string(highscore));
draw_text(20, 80, "debug: " + string(addRGB));
draw_set_color(c_white);


Button.draw();


shader_reset();