wyze=round(5*rand(3, 4))

wiel=size(wyze);

for i = 1:wiel(1);
  for j = 1:wiel(2);
    if wyze(i,j)>3;
      wyze(i,j) = 0;
    endif;
  end;
end;

wyze
