mask = [-1,-2,-1;0,0,0;1,2,1];
obr = double(imread('rzeczka.jpg'));

temp=obr;

for i=2:size(obr,1)-1
  for j=2:size(obr,2)-1
    temp(i:i,j:j)=obr(i-1:i-1,j-1:j-1)*mask(1,1)+obr(i-1:i-1,j:j)*mask(1,2)+obr(i-1:i-1,j+1:j+1)*mask(1,3)+obr(i:i,j-1:j-1)*mask(2,1)+obr(i:i,j:j)*mask(2,2)+obr(i:i,j+1:j+1)*mask(2,3)+obr(i+1:i+1,j-1:j-1)*mask(3,1)+obr(i+1:i+1,j:j)*mask(3,2)+obr(i+1:i+1,j+1:j+1)*mask(3,3);
  endfor
endfor

for i=2:size(obr,1)-1
  for j=2:size(obr,2)-1
    if temp(i:i,j:j)>255
      temp(i:i,j:j)=255;
    endif
    if temp(i:i,j:j)<0
      temp(i:i,j:j)=0;
    endif
  endfor
endfor
imshow(temp/255)