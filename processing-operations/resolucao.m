close all;
pkg load image;

im = imread("mulherNeg.jpg");
figure(1);
imshow(im);
title("Operação Ponto a Ponto - Negativo");

%imagem binaria
roi = imread("ROI_circular.jpg");
roiBW = roi>127;
figure(2);
imshow(roiBW);
title("Operação Ponto a Ponto - Negativo");

%multiplicação
imOpArit = im;
for(i=1:size(im,3))
  imOpArit(:,:,i) = im(:,:,i) .* roiBW;
end
figure(3);
imshow(imOpArit);
title("Operação Ponto a Ponto - Negativo");

imBackG = imread("flores.jpg");
figure(4);
imshow(imBackG);
title("Operação Ponto a Ponto - Negativo"); 

%fazendo uniao
imOperConj = max(imBackG, imOpArit);
figure(5);
imshow(imOperConj);
title("Operação com Conjuntos - União");

%fazendo negativa
imOperP2P = 255 - imOperConj;
figure(6);
imshow(imOperP2P);
title("Operação Ponto a Ponto - Negativo"); 

%virando da esquerda para direita
imTGeo = imOperP2P;
for(j=1:size(imOperP2P,1))
    imTGeo(:,j,:) = imOperP2P(:, size(imOperP2P,2)-j+1, :);
end
figure(6);
imshow(imOperP2P);
title("Operação Invertida"); 

imNegativa = 255 - imOpArit;
imInvertida = imNegativa;
for(j=1:size(imNegativa,1))
    imInvertida(:,j,:) = imNegativa(:, size(imNegativa,2)-j+1, :);
end
figure(7)
imshow(imInvertida);

for(i=1:size(roiBW,1))
  for(j=1:size(roiBW,2))
    if(roiBW(i,j)==1)
      imBackG(i,j,:) = imInvertida(i,j,:);
    end
  end
end
figure(8);
imshow(imBackG);