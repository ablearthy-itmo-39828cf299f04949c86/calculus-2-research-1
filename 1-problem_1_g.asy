import graph;

size(11cm, 15cm);

defaultpen(fontsize(10pt));

label("$0$", (-0.3, -0.3));

xaxis("$x$",axis=YEquals(0),
  xmin=-3.5,
  xmax=7.5,
  Ticks(
    Label(),
    new real[]{-3, -2, -1, 1, 2, 3, 4, 5, 6, 7},
    Size=1mm
  ),
  Arrow);

yaxis("$y$",axis=XEquals(0),
  ymin=-5.5,
  ymax=9.5,
  Ticks(
    Label(),
    new real[]{-5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8, 9},
    Size=1mm
  ),
  above=false,
  Arrow);

real F1(real x) {
  return 3*(x^2) + 1;
}

real F2(real x) {
  return 1/(x-3);
}

real F3(real x) {
  return sqrt(x-3);
}

// 9.5 = 3x^2 + 1
real xmin = -sqrt((9.5 - 1) / 3);

draw(graph(F1, xmin, 0, n = 500));
dot((0,F1(0)), UnFill, p=linewidth(0.4mm));

// 1/(x-3) = -5.5
real xmax = -1/5.5 + 3;
draw(graph(F2, 0, xmax, n = 500));


draw(graph(F3, 3, 7.5, n = 500));
