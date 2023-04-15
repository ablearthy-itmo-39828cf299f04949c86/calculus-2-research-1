def draw_point(expr P, colInt, colPer) =
  fill fullcircle scaled 2mm shifted P withcolor colInt;
  draw fullcircle scaled 2mm shifted P withcolor colPer;
enddef;

beginfig(1);
numeric u, v; u = 25; v = 25;
numeric s; s = u/100;
numeric minx, maxx;

path xx, yy;
xx = (7/2 left -- 15/2 right) scaled u;
yy = (11/2 down -- 19/2 up) scaled v;
for x=-3, -2, -1, 1, 2, 3, 4, 5, 6, 7:
  draw (down--up) shifted (x * u, 0); % ticks
  label("$" & decimal x & "$", (x * u, -8));
endfor
for y=-5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8, 9:
  draw (left--right) shifted (0, y * v); % ticks
  label("$" & decimal y & "$", (-10, y * v));
endfor

label(btex \m{0} etex, (-u/4, -v/3));
drawarrow xx; label.rt("$x$", point 1 of xx);
drawarrow yy; label.top("$y$", point 1 of yy);

vardef f(expr x) = 3 * (x ** 2) + 1 enddef;
vardef fp(expr x) = 6 * x enddef;
path ff;
minx = -1.68; maxx = 0;
ff = (for x = minx step s until maxx - s: (x, f(x)){1, fp(x)} .. endfor (maxx, f(maxx))) xscaled u yscaled v;
draw ff;

draw_point((0, v), white, black);

vardef g(expr x) = 1 / (x - 3) enddef;
vardef gp(expr x) = -1 / ( (x - 3) ** 2) enddef;
minx := 0; maxx := 2.818;
ff := (for x = minx step s until maxx - s: (x, g(x)){1, gp(x)} .. endfor (maxx, g(maxx))) xscaled u yscaled v;
draw ff;

vardef t(expr x) = sqrt(x - 3) enddef;
minx := 3; maxx := 7.5;
ff := (for x = minx step s until maxx - s: (x, t(x)) .. endfor (maxx, t(maxx))) xscaled u yscaled v;
draw ff;
endfig;

end.
