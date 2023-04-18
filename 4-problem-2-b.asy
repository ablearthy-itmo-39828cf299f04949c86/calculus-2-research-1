size(0, 10cm);

defaultpen(fontsize(8pt));
dotfactor = 4;

real a = 3;
real b = 5;

pair A = (-a, 0);
pair Ep = (a, 0);
pair C = (0, -b);
pair H = (0, b);

draw(A -- Ep, linewidth(0.3bp)+dashed);
draw(C -- H, linewidth(0.3bp)+dashed);
draw(A -- C);
draw(A -- H);
draw(Ep -- C);
draw(Ep -- H);
dot(A);
label("$A$", A, align=W);
dot(Ep);
label("$E$", Ep, align=E);
dot(C);
label("$C$", C, align=S);
dot(H);
label("$H$", H, align=N);

pair B = relpoint(A -- C, 0.5);
pair D = relpoint(Ep -- C, 0.5);

dot(B);
label("$B$", B, align=W);
dot(D);
label("$D$", D, align=E);
draw(B -- D);

path Dx = relpoint(A -- C, 0.6) -- relpoint(Ep -- C, 0.6);
draw(Dx);

pair O1 = intersectionpoint(H -- C, B -- D);
pair O2 = intersectionpoint(H -- C, Dx);
draw(O1 -- O2, L=Label("$\Delta x$", position=MidPoint), bar=Bars);

path width = shift((0, -1.2 * b)) * (A -- Ep);
draw(width, L=Label("$w$", position=MidPoint), Arrows());

path height = shift((-1.25 * a, 0)) * (H -- C);
draw(height, L=Label("$h$", position=MidPoint), Arrows());

draw(O1 -- H, L=Label("$x$", position=MidPoint), Arrows());
