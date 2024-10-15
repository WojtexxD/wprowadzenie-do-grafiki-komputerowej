zmien=round(5*rand(4, 3))

s = size(zmien);

for i = 1:s(1)
   a = zmien(i);
   for j = 2:s(2)
      zmien(i, j) += a;
      a = zmien(i, j);
   end;
end;

zmien
