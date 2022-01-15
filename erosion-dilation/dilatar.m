function imDilatada = dilatar(img)
  
  imDilatada = img;
  
  EE = [1 1 1;
        1 1 1;
        1 1 1];
  
  for i=2:size(img,1)-1
    for j=2:size(img,2)-1
      if(img(i,j)==1)
        px = img(i-1:i+1, j-1:j+1);
        if(sum(sum(px==EE))!=9)
          imDilatada(i-1:i+1,j-1:j+1) = 1;
        end
      end
    end
  end
  
end