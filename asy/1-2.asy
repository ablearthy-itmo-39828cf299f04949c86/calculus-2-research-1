import graph;

size(11cm, 11cm);

defaultpen(fontsize(12pt));

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
  ymax=7.5,
  Ticks(
    Label(),
    new real[]{-5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7},
    Size=1mm
  ),
  above=false,
  Arrow);

real F1(real x) {
  return x^3 + x;
}

real F2(real x) {
  return log(abs(x - 3));
}

real F3(real x) {
  return (2/3) * (x-3)^(3/2);
}

// x^3 + x = -5.5
real xmin = -1.57713;

draw(graph(F1, xmin, 0, n = 500), blue);
dot((0,0), UnFill, p=linewidth(0.4mm));

// ln(|x - 3|) = -5.5
real xmax = 2.99591;
draw(graph(F2, 0, xmax, n = 500), blue);

draw(graph(F3, 3, 7.5, n = 500), blue);
