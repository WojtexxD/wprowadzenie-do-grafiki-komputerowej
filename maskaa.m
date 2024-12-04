#mask = [5/50,6/50,5/50;6/50,6/50,6/50;5/50,6/50,5/50];
mask = [0,-1,0;-1,5,-1;0,-1,0];
obr = double(imread('rzeczka_mniejsza.jpg'));

temp=obr;

for i=2:size(obr,1)-1
  for j=2:size(obr,2)-1
    temp(i:i,j:j,1)=obr(i-1:i-1,j-1:j-1,1)*mask(1,1)+obr(i-1:i-1,j:j,1)*mask(1,2)+obr(i-1:i-1,j+1:j+1,1)*mask(1,3)+obr(i:i,j-1:j-1,1)*mask(2,1)+obr(i:i,j:j,1)*mask(2,2)+obr(i:i,j+1:j+1,1)*mask(2,3)+obr(i+1:i+1,j-1:j-1,1)*mask(3,1)+obr(i+1:i+1,j:j,1)*mask(3,2)+obr(i+1:i+1,j+1:j+1,1)*mask(3,3);
    temp(i:i,j:j,2)=obr(i-1:i-1,j-1:j-1,2)*mask(1,1)+obr(i-1:i-1,j:j,2)*mask(1,2)+obr(i-1:i-1,j+1:j+1,2)*mask(1,3)+obr(i:i,j-1:j-1,2)*mask(2,1)+obr(i:i,j:j,2)*mask(2,2)+obr(i:i,j+1:j+1,2)*mask(2,3)+obr(i+1:i+1,j-1:j-1,1)*mask(3,2)+obr(i+1:i+1,j:j,2)*mask(3,2)+obr(i+1:i+1,j+1:j+1,2)*mask(3,3);
    temp(i:i,j:j,3)=obr(i-1:i-1,j-1:j-1,3)*mask(1,1)+obr(i-1:i-1,j:j,3)*mask(1,2)+obr(i-1:i-1,j+1:j+1,3)*mask(1,3)+obr(i:i,j-1:j-1,3)*mask(2,1)+obr(i:i,j:j,3)*mask(2,2)+obr(i:i,j+1:j+1,3)*mask(2,3)+obr(i+1:i+1,j-1:j-1,1)*mask(3,3)+obr(i+1:i+1,j:j,3)*mask(3,2)+obr(i+1:i+1,j+1:j+1,3)*mask(3,3);
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

subplot(1,2,1);
imshow(obr/255)
subplot(1,2,2);
imshow(temp/255)


#œr=1/2p+1/2L
#ost=akt-œr
#t=Beta ost
#akt'=akt+B*akt-1/2B-1/2B*L
#akt'=1/2B*L+(1+B))akt-1/2B*p