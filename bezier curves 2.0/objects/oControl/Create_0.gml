//vamos ter uma array que guarda as arrays de todas as dimensões dos pontos
pointsInSpace = [];
speedOfSubPoints = .25;
speedVector = 0;
numberOfColorsToDraw = 20

colors = [];

//aqui determino no terceiro valor quantas cores serão visiveis
scr_generator_of_colors(colors, pointsInSpace, 20);

dimensionsToDraw = 0;
drawingOnlyLastPoint = false;
