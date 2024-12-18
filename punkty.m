filename = 'punktman.csv';
M = csvread(filename);
x = M(1:end,1);
y = M(1:end,2);


plot (x,y,"k square");