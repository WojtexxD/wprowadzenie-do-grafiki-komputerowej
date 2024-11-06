we1=double(imread("rzeczka.jpg"));
we2=double(imread("rzeczka.jpg"));
gamma=1.5;
gam=1/gamma;
wartsrod=127.5;
mnoznik=4;
we2=(we2/255);
we2=we2.^gam;
we2=we2*255;
vps=we2-we1;
v2=vps+wartsrod;
vpsmocniej=vps*mnoznik;
v2mocniej=mnoznik*vps+wartsrod;
#imshow(v2mocniej/255)
obr=we1;
for i=1:size(obr,1)
  for j=1:size(obr,2)
  a=0;
  a+=obr(i,j,1);
  a+=obr(i,j,2);
  a+=obr(i,j,3);
  a=(a/3);
  obr(i,j,1)=a;
  obr(i,j,2)=a;
  obr(i,j,3)=a;
  end;
 end;
imshow(obr/255)