clear;
close all;
pkg load image;

img = im2bw(imread("objetos1.jpg"));
imLabel = zeros(100,100, "uint8");

imErrors = [];

rotulo = 20;

for(i=1:size(img,1))
  for(j=1:size(img,2))
    if(img(i,j) == 1)
        if((img(i-1,j) == 0) && (img(i,j-1) == 0)) %caso os anteriores forem back
          rotulo += 5;
          imLabel(i,j) = rotulo;
          imErrors(size(imErrors, 1)+1, 1) = rotulo;
        elseif((img(i-1,j) == 1) && (img(i,j-1) == 0)) % caso o esquerda não for back'
          imLabel(i,j) = imLabel(i-1,j);
        elseif((img(i-1,j) == 0) && (img(i,j-1) == 1)) % caso o de cima não for back
          imLabel(i,j) = imLabel(i,j-1);
        elseif((img(i-1,j) == 1) && (img(i,j-1) == 1)) % caso os dois não for back
          imLabel(i,j) = imLabel(i-1,j);
          if((imLabel(i-1,j) == imLabel(i,j-1)))% se não for back e não tiver conflito de rotulo
            imLabel(i,j) = imLabel(i,j-1);
          else % se não for back e tiver conflito de rotulo
            for(k=1:size(imErrors,1))
              if(any(imErrors(k) == imLabel(i-1,j)))
                imErrors(k, size(imErrors(k), 2)+1) = imLabel(i, j-1);
              end
            end
          endif  
        endif
    end
  end
end




imshow(imLabel);