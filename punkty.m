filename = 'punktman.csv';
M = csvread(filename);
xs = M(1:end,1);
ys = M(1:end,2);

xsr = sum(xs)/length(xs);
ysr = sum(ys)/length(ys);

xn = xs-xsr;
yn = ys-ysr;

deg = deg2rad(90);

xn = xs*cos(deg)-ys*sin(deg);
yn = xs*sin(deg)+ys*cos(deg);

xn = xn/100;
yn = yn/100;

plot (xn,yn,"k square");