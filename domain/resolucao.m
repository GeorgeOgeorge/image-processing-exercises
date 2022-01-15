clear all;
close all;
pkg load image;

im = rgb2gray(imread("desmatamento.jpg"));
figure(1);
imhist(im);
imtest = im > 101;
area = (sum(sum(imtest))*100)/(455*810);
imshow(imtest);

im = rgb2gray(imread("tomografia.jpg"));
imshow(im);
for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j)>50 && im(i,j)<100)
      im(i,j) = 200;
    else
      im(i,j) = 50;
    end
  end 
end

im = rgb2gray(imread("tomografia.jpg"));
imshow(im);
for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j)>110 && im(i,j)<170)
      im(i,j) += im(i,j)*0.5;
    else
      im(i,j) -= im(i,j)*0.7;
    end
  end 
end

imshow(im);




