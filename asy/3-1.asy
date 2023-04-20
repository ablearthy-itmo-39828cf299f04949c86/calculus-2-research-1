import graph;

size(15cm, 11cm);

defaultpen(fontsize(10pt));

label("$0$", (-0.3, -0.3));


real F(real x) {
  return (x^4 - 4 * (x^3) + 6 * (x^2) - 4 * x + 16) / (3 * (x-1)^3);
}

draw(graph(F, -6.5, 0.0686, n = 750));
draw(graph(F, 1.93133, 6.5, n = 750));

path xeq1 = (1.0, 6.5) -- (1.0, -6.5);
draw(xeq1, dashed);
label(rotate(90)*Label("$x = 1$", position=Relative(0.75)), xeq1);

path asymptote = (-6.5, -2.5) -- (6.5, 1.83333);
draw(asymptote, dashed);
label(rotate(18.43)*Label("$y = \frac{1}{3} x - \frac{1}{3}$", position=Relative(0.85)), asymptote);

xaxis("$x$",axis=YEquals(0),
  xmin=-6.5,
  xmax=6.5,
  Ticks(
    Label(align=0.5*S+0.7*E),
    new real[]{-6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6},
    Size=1mm
  ),
  Arrow);

yaxis("$y$",axis=XEquals(0),
  ymin=-6.5,
  ymax=6.5,
  Ticks(
    Label(),
    new real[]{-6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6},
    Size=1mm
  ),
  above=false,
  Arrow);
