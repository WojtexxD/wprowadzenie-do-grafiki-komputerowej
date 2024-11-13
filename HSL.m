o=double(imread('rzeczka2.png'));

max=-10;
tempmax=0;
min=10;
tempmin=0;
R = 0;
G = 0;
B = 0;

for i=1:size(o,1)
  for j=1:size(o,2)   
    R=(o(i,j,1))/255;
    G=(o(i,j,2))/255;
    B=(o(i,j,3))/255;
    
    if(R>G && R>B)
      tempmax=R;
    elseif(G>R && G>B)
      tempmax=G;
    elseif(B>R && B>G)
      tempmax=B;
    endif;
    if(tempmax>max)
      max=tempmax;
    endif;
    
    if(R<G && R<B)
      tempmin=R;
    elseif(G<R && G<B)
      tempmin=G;
    elseif(B<R && B<G)
      tempmin=B;
    endif;
    if(tempmin<min)
      min=tempmin;
    endif;
  end;
end;

max
min
Chroma=max-min