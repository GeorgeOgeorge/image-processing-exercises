close all;
clear all;

im = imread("Lena.jpg");
figure(1);
imshow(im);

inCinza = rgb2gray(im);

%reduzindo
iPeq = 1; 
jPeq = 1;
for(i=1:+2:size(inCinza,1))
  for(j=1:+2:size(inCinza,2))
    imPeq(iPeq,jPeq++) = inCinza(i,j);
  end
  jPeq = 1;
  iPeq++;
end
figure(2)
imshow(imPeq);
imwrite(imPeq, "Peq.jpg");

%expandindo
iG=1;
for(i=1:size(imPeq,1))  
  jG=1;
  for(j=1:size(imPeq,2))
    imAmpliada(iG,jG) = imPeq(i,j);
    jG+=2;
  end
  iG+=2;
end
figure(3)
imshow(imAmpliada);

%interpolação vizinho mais proximo
imVizProx = imAmpliada;
for(i=1:+2:size(imAmpliada,1))
  for(j=1:+2:size(imAmpliada,2))
    imVizProx(i+1,j) = imAmpliada(i,j);
    imVizProx(i,j+1) = imAmpliada(i,j); 
    imVizProx(i+1,j+1) = imAmpliada(i,j); 
  end
end
figure(4)
imshow(imVizProx);

%interpolação bilinear
imBilinear = imAmpliada;
imAmpliada = double(imAmpliada);
for(i=2:size(imAmpliada,1)-1)
  for(j=2:size(imAmpliada,2)-1)
    if(imAmpliada(i,j)==0)
      if((imAmpliada(i-1,j)!=0) && (imAmpliada(i+1,j)!=0))
        imBilinear(i,j) = ((imAmpliada(i-1,j)) + (imAmpliada(i+1,j)))/2;
      elseif((imAmpliada(i,j-1)!=0) && (imAmpliada(i,j+1)!=0))
        imBilinear(i,j) = ((imAmpliada(i,j-1)) + (imAmpliada(i,j+1)))/2;
      else
        imBilinear(i,j) = uint8((imAmpliada(i-1,j-1) + imAmpliada(i-1,j+1) + imAmpliada(i+1,j-1) + imAmpliada(i+1,j+1) )/4);
      end
    end
  end
end
for(i=1:size(imAmpliada,1))
  if(imAmpliada(i,1)==0)
    imBilinear(i,1) = ((imAmpliada(i-1,1)) + (imAmpliada(i+1,1)))/2;
    imBilinear(i,size(imAmpliada,2)) = ((imAmpliada(i-1,size(imAmpliada,2))) + (imAmpliada(i+1,size(imAmpliada,2))))/2;
  end
end
for(j=1:size(imAmpliada,2))
  if(imAmpliada(1,j)==0)
    imBilinear(1,j) = ((imAmpliada(1,j-1)) + (imAmpliada(1,j+1)))/2;
    imBilinear(size(imAmpliada,1),j) = ((imAmpliada(size(imAmpliada,1),j-1)) + (imAmpliada(size(imAmpliada,1),j+1)))/2;
  end
end

figure(5)
imshow(imBilinear);