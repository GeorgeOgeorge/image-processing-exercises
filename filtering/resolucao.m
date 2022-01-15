close all;
clear all;

im = rgb2gray(imread("Lena.png"));
final = im;

%inner borders
LaplaciEE = [-1 -1 -1;
             -1  8 -1;
             -1 -1 -1];
%outer borders          
Laplaci2EE = [1  1  1;
              1 -8  1;
              1  1  1];
%light cannon(left -> right)
Prewitt1EE = [-1  0  1;
              -1  0  1;
              -1  0  1];
%light cannon + higher definition
Sobel1EE = [-1 -2 -1;
             0  0  0;
             1  2  1];
%blurr 
for i=3:size(im,1) - 2
  for j=3:size(im,2) - 2
    px = im(i-2:i+2,j-2:j+2);
    imBlur(i,j) = uint8(sum(sum(px))/25);
    imMedian(i,j) = median(median(px)); 
  end
end
 
%aplying filter to image
for i=2:size(im,1) - 1
  for j=2:size(im,2) - 1
    px = im(i-1:i+1,j-1:j+1);
    final(i,j) = sum(sum(double(px).*LaplaciEE));
  end
end

figure(1)
imshow(final);
figure(2)
imshow(imBlur);