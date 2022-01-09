%isolando canais RHB

img  = imread("rgb.jpg");

imgAmr = img;
for i=1:size(img,1)
  for j=1:size(img,2)
    if( not(imgAmr(i,j,1) > 126 && imgAmr(i,j,2) > 126 && imgAmr(i,j,3) < 126) )
      imgAmr(i,j,:) = 255;   
    end
  end
end
imwrite(imgAmr,"imgAmr.jpg")

imgVerd = img;
for i=1:size(img,1)
  for j=1:size(img,2)
    if( not(imgVerd(i,j,1) < 126 && imgVerd(i,j,2) > 80 && imgVerd(i,j,3) < 126) )
      imgVerd(i,j,:) = 255;   
    end
  end
end
imwrite(imgVerd,"imgVerd.jpg")

imgVerm = img;
for i=1:size(img,1)
  for j=1:size(img,2)
    if( not(imgVerm(i,j,1) > 126 && imgVerm(i,j,2) < 126 && imgVerm(i,j,3) < 126) )
      imgVerm(i,j,:) = 255;   
    end
  end
end
imwrite(imgVerm,"imgVerm.jpg")