

clear; clc; ##clear all; clf;

tab=[11:13]
for zm = tab
   disp("iteracja");
   disp(zm)
end;

mac = [1 2 3; 4 5 6]
for zm=mac
  disp("iteracja");
  disp(zm)
end;

abc=123;
vv=1:10;

abc=456;
abc=99;

clc;

tab=[11:13]'
for zm = tab
   disp("iteracja");
   disp(zm)
end;

clc;

tab=[11:13]'
for zm = 1:10
   disp("iteracja");
   disp(zm)
end;