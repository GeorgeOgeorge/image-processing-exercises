pkg load image;

im = imread("soja.jpg");
imres = im;
figure(1);
imshow(im);

imgry = rgb2gray(im);
figure(2);
imshow(imgry);
imwrite(imgry, "sojaGray.jpg");

figure(3);
imhist(imgry);

%separando background de foreground
imblk = imgry;
for i=1:size(imblk,1)
  for j=1:size(imblk,2)
    if( imblk(i,j) < 50 )
      imblk(i,j) = 255;   
    else
      imblk(i,j) = 0;
    endif
  end
end
figure(4);
imshow(imblk);
imwrite(imblk, "sojaBlack.jpg");
#{
for i=1:size(imblk,1)
  for j=1:size(imblk,2)
    if( imblk(i,j) == 255 )
      imres(i,j,:) = 255;   
    end
  end
end
#}


%fazendo mascara
imres += imblk;

figure(5);
imshow(imres);
imwrite(imres, "sojaRes.jpg");

