import graph3;
import solids;

size(0, 8cm);

defaultpen(fontsize(10pt));
dotfactor = 4;

triple H = (0, 0, 2);

// currentprojection = perspective(5,4,4,target=H/3);
currentprojection = orthographic(5, 4, 4, target=H/2);
pen skeletonpen=blue+0.15mm;

path3 seg = (0,1.2,0) -- (0,0.6,2);

revolution R = revolution(O,approach(seg,200),unit(Z));

draw(circle((0, 0, 2), 0.6));
draw(surface(circle((0, 0, 0), 1.2)),lightgreen+opacity(0.3));
draw(surface(circle((0, 0, 2), 0.6)),lightgreen+opacity(0.3));
draw(surface(R),lightgreen+opacity(0.5),render(compression=Low));


skeleton s;
R.transverse(s, reltime(R.g,0), 200, currentprojection);
R.transverse(s, reltime(R.g,0.55), 200, currentprojection);
R.transverse(s, reltime(R.g,0.65), 200, currentprojection);
R.longitudinal(s, 200, currentprojection);
draw(s.transverse.back, defaultbackpen, currentlight);
draw(s.transverse.front);

draw(s.longitudinal.back, defaultbackpen, currentlight);
draw(s.longitudinal.front);


draw(O -- H, dashed);

label("$O$",O,-Z-Y);
label("$H$",H, -Y);
dot(H);
dot(O);

triple E = relpoint(s.longitudinal.front[0], 0);
triple A = relpoint(s.longitudinal.front[0], 1);

draw(O -- E, dashed);
dot(E);
label("$E$", E, -Z+Y);

draw(H -- A);
dot(A);
label("$A$", A, +Z+Y);


triple D = relpoint(s.longitudinal.front[0], 0.55);
triple OD = (0, 0, D.z);
draw(OD -- D, dashed);
label("$D$", D, -Z+1.2*Y);
label("$O'$", OD, -Z-Y);
dot(D);
dot(OD);

triple DPlusDx = relpoint(s.longitudinal.front[0], 0.65);
triple ODPlusDx = (0, 0, DPlusDx.z);
draw(ODPlusDx -- DPlusDx, dashed);
label("$D'$", DPlusDx, +Z+1.2*Y);
label("$O''$", ODPlusDx, 0.5*Z-0.75*Y);
dot(DPlusDx);
dot(ODPlusDx);

draw(OD -- ODPlusDx, L=Label("$\Delta x$", position=MidPoint), Bars3());
draw(O -- OD, L=Label("$x$", position=MidPoint), Arrows3(), Bars3());

triple C = (A.x, A.y, 0);
label("$C$", C, -Z);
dot(C);
draw(A -- C, dashed);

real[] ts = intersect(A -- C, OD -- D);
triple B = relpoint(A -- C, ts[0]);
dot(B);
label("$B$", B, +Z-Y);
