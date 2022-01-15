pkg load image

clear all;
close all;

imReal = uint8(imread("img_lincoln.jpg"));
im = im2bw(imReal);
figure('Name','Imagem Original: Lincoln.jpg');
imshow(im);

imEr = im;

EE = [1 1 1;
      1 1 1;
      1 1 1];

% criando borda
for i=2:size(im,1)-1
  for j=2:size(im,2)-1
    if(im(i,j)==1)
      px = im(i-1:i+1, j-1:j+1);
      if(sum(sum(px==EE))!=9)
        imEr(i,j) = 0;
      end
    end
  end
end

finalEr = im - imEr;

figure('Name','Imagem erodida: Lincoln.jpg');
imshow(finalEr);

%pintando borda
for i=1:size(finalEr,1)
  for j=1:size(finalEr,2)
    if(finalEr(i,j) == 1)
      imReal(i,j,1) = 255;
      imReal(i,j,2) = 0;
      imReal(i,j,3) = 0; 
    end
  end
end

figure('Name','Imagem borda vermelha: Lincoln.jpg');
imshow(imReal);

%---------------------------------------------------------

imGeo = im2bw(imread("geometrico.jpg"));
imEE = imGeo;

EEGeoP = [1 1 1;
          1 1 1;
          1 1 1];
%dilatação      
for i=2:size(imEE,1)-1
  for j=2:size(imEE,2)-1
    if(imGeo(i,j)==1)
      px = imGeo(i-1:i+1, j-1:j+1);
      if(sum(sum(px==EEGeoP))!=9)
        imEE(i-1:i+1,j-1:j+1) = 1;
      end
    end
  end
end

imnova = imEE;

figure('Name','geometrico: dilatado');
imshow(imEE);

%erosion
for i=2:size(imEE,1)-1
  for j=2:size(imEE,2)-1
    if(imEE(i,j)==1)
      px = imEE(i-1:i+1, j-1:j+1);
      if(sum(sum(px==EEGeoP))!=9)
        imnova(i,j) = 0;
      end
    end
  end
end

imEE = imnova;

for i=2:size(imEE,1)-1
  for j=2:size(imEE,2)-1
    if(imEE(i,j)==1)
      px = imEE(i-1:i+1, j-1:j+1);
      if(sum(sum(px==EEGeoP))!=9)
        imnova(i,j) = 0;
      end
    end
  end
end

figure('Name','geometrico: erodida');
imshow(imnova);