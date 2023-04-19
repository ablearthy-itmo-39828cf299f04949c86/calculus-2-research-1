size(14cm, 0);

import graph;

defaultpen(fontsize(12pt));
dotfactor = 4;

real f(real x) {return sin(x);}

path ff = graph(f,0, pi, n=200, operator ..);
fill(ff -- (0, 0) -- cycle, paleblue);
draw(ff);

real dx = 0.2;
real dy = 0.1;
pair start_dxdy = (1, 0.5);

draw(box(start_dxdy, shift(dx,dy)*start_dxdy));

pair dsLabelCoords = (start_dxdy + shift(dx,dy)*start_dxdy) / 2;
label("$dS$", dsLabelCoords);

draw(
  shift(0, -0.05) * (start_dxdy -- shift(dx, 0)*start_dxdy),
  L=Label("$dx$", position=MidPoint),
  Bars(3pt),
  p=fontsize(10pt)
);
draw(
  shift(0.05, 0) * (shift(dx, 0)*start_dxdy -- shift(dx, dy)*start_dxdy),
  L=Label("$dy$", position=MidPoint),
  Bars(2pt),
  p=fontsize(10pt)
);


xlimits(0, pi + 0.2);

xaxis(Label("$x$",align=2S), Arrow);
yaxis(Label("$y$",align=2W), Arrow);

label("$0$", (0, 0), align=W+S);
label("$\pi$", (pi, 0), align=S);
