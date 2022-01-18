close all;
clear all;

imGeo = uint8(imread("prv2.jpg"));
figure(1);
imshow(imGeo);

%criando imagem binaria
m1 = zeros(size(imGeo,1),size(imGeo,2));
for i=1:size(imGeo,1)
  for j=1:size(imGeo,2)
    if((imGeo(i,j,1)>127 && imGeo(i,j,2)<127 && imGeo(i,j,3)>127 ) || (imGeo(i,j,1)<127 && imGeo(i,j,2)<127 && imGeo(i,j,3)>127))
      m1(i,j)=1;
    end
  end  
end
%--------------------------------------
EE = [0 1 1 1 0;
      1 1 1 1 1;
      1 1 1 1 1;
      1 1 1 1 1;
      0 1 1 1 0;];
         
mDilata = m1;
%dilatando
for i=3:size(m1,1)-2
  for j=3:size(m1,2)-2
    if(m1(i,j)==1)
      px = m1(i-2:i+2, j-2:j+2);
      px(1,1)=0;
      px(1,5)=0;
      px(5,1)=0;
      px(5,5)=0;
      if(sum(sum(px==EE))!=21)
        mDilata(i-2:i+2,j-2:j+2) = 1;
      end
    end
  end
end
mDilata2 = mDilata;
%dilatando novamente
for i=3:size(mDilata,1)-2
  for j=3:size(mDilata,2)-2
    if(mDilata(i,j)==1)
      px = mDilata(i-2:i+2, j-2:j+2);
      px(1,1)=0;
      px(1,5)=0;
      px(5,1)=0;
      px(5,5)=0;
      if(sum(sum(px==EE))!=21)
        mDilata2(i-2:i+2,j-2:j+2) = 1;
      end
    end
  end
end

m2 = mDilata2 - mDilata ;
      
figure(2);
imshow(m2);      
%------------------------------------------------

imEntrada = imread("ruido1.jpg");
imSuavizada = imEntrada;

for i=2:size(imEntrada,1)-1
  for j=2:size(imEntrada,2)-1
    imSuavizada(i,j) = sort(reshape(imEntrada(i-1:i+1,j-1:j+1),1,[]))(7);
  end
end

figure(3);
imshow(imSuavizada);

mascara = imEntrada - imSuavizada;
finalWom = imEntrada + (mascara .* 2.5);
%apliquei a formula que foi dada porem não deu certo :(
figure(4);
imshow(finalWom);
