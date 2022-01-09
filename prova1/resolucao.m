close all;
clear all;

background = imread("foto5.jpg");
mascara = imread("mascara4.jpg");
colorido = imread("img5.jpg");
ass = imread("ass.jpg");

ass = 255 - ass;
for(i=1:size(ass,1))
  for(j=1:size(ass,2))
    if(ass(i,j)>127)
      ass(i,j) = uint8(j*(255/size(ass,2))); %regra de 3 pra fazer equivalencia(map) 
    else
      ass(i,j) = 0;
    end
  end
end
figure(1)
imshow(ass);

for(j=1:size(background,2))
    background1(:,j,:) = background(:, size(background,2)-j+1, :);
end
for(i=1:size(background,1))
    background2(i,:,:) = background1(size(background1,1)-i+1, :, :);
end

for(i=1:size(background2,1))
  for(j=1:size(background2,2))
    if(i<=10 && j<=size(background2,2))
      background2(i,j,:) = 255 - background2(i,j,:);
    elseif(i<=size(background,1) && j<=10)
      background2(i,j,:) = 255 - background2(i,j,:);
    elseif(i>=size(background,1)-10 && j>=11)
      background2(i,j,:) = 255 - background2(i,j,:);
    elseif((i>10 &&  i<=size(background,1)-10) && j>= size(background,1)-10)
      background2(i,j,:) = 255 - background2(i,j,:);
    end
  end
end

achoucinza = false;
achoupreto = false;
for(i=1:size(background2,1))
  for(j=1:size(background2,2))
    if(mascara(i,j)>176 && mascara(i,j)<195)
      if(achoucinza == false)
        achoucinza = true;
        ic = i;
        jc = j;
       else
        background2(i,j,:) = 0;
       end
    elseif(mascara(i,j)>229)
      background2(i,j,:) = mascara(i,j,:);
    elseif(mascara(i,j)>110 && mascara(i,j)<150) %a compressão do jpg tá bugando o histograma da mascara
      background2(i,j,:) = colorido(i,j,:);
    elseif(mascara(i,j)>0 && mascara(i,j)<=13)
      background2(i,j) = (background2(i+1,j) + background2(i-1,j) + background2(i,j+1) + background2(i,j-1) + background2(i-1,j-1) + background2(i-1,j+1) +background2(i+1,j-1) + background2(i+1,j+1))/8;
    end
  end
end

iAss=1;
for(i=ic:ic+size(ass,1)-2)
  jAss=1;
  for(j=jc:jc+size(ass,2)-2)
    background2(i,j,:) = ass(iAss,jAss++,:);
  end
  iAss++;
end

figure(2);
imshow(background2);
title("Operação Invertida");
