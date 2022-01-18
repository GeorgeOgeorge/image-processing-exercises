%degrade
img = uint8(zeros(50,255));
for x=1:size(img,2)
  img(:,x) = x;
end
imshow(img);
imwrite(img,"degrade.png");

%imageToGray
img = imread("Lena.jpg");
imgfinal =  0.3*img(:,:,1) +0.59*img(:,:,2) +0.11*img(:,:,3);
imshow(imgfinal)
imwrite(imgfinal, "LenaCinza.png");

%aplicando degrade na imagem cinza
img = imread("LenaCinza.png");
for x = -255:256
  img(:,x+256) = img(:,x+256) + x; 
end
imshow(img);
imwrite(img,"LenaCinzaDegrade.png");

%imagem 40% mais clara
img = imread("LenaCinza.png");
img *= 0.4;
imshow(img);
imwrite(img,"LenaCinzaMenos40.png");

img = imread("LenaCinza.png");
img += (img * 0.4);
imshow(img);
imwrite(img,"LenaCinzaMais40.png");