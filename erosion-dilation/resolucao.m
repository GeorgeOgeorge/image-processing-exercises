pkg load image

clear all;
close all;

img = uint8(imread("img_lincoln.jpg"));

im = im2bw(img);
figure('Name','Imagem Original: Lincoln.jpg');
imshow(im);

%criando borda
borda = im - erodir(im);
figure('Name','Imagem erodida: Lincoln.jpg');
imshow(borda);
%pintando borda
for i=1:size(borda,1)
  for j=1:size(borda,2)
    if(borda(i,j) == 1)
      img(i,j,1) = 255;
      img(i,j,2) = 0;
      img(i,j,3) = 0; 
    end
  end
end
figure('Name','Imagem borda vermelha: Lincoln.jpg');
imshow(img);
%---------------------------------------------------------
imGeo = im2bw(imread("geometrico.jpg"));
%dilatação      
geoDilatada = dilatar(imGeo);
figure('Name','geometrico: dilatado');
imshow(geoDilatada);
%erosion
geoErodida = erodir(erodir(geoDilatada));
figure('Name','geometrico: erodida');
imshow(geoErodida);