%% Clean variables and screen
close all;
clear;
clc;
titlefont = 15;
fontsize = 13;

refer_img1 = imread('data/frame72.jpg');
refer_img1 = im2double(refer_img1);
refer_img2 = imread('data/frame85.jpg');
refer_img2 = im2double(refer_img2);
target_img = imread('data/frame81.jpg');
target_img = im2double(target_img);
[rows ,cols , heights] = size(refer_img1);

%2D--SEARCH-----------------------------------------------------------

%Block size = 8X8   Search Range p = 8
[resi_img1,result_img1] = Mysearch2D(refer_img1,target_img,8,8);
[resi_img2,result_img2] = Mysearch2D(refer_img2,target_img,8,8);
result_img = zeros(rows,cols,heights);
resi_img = zeros(rows,cols);

for i=1:8:rows-7
    for j=1:8:cols-7
       SAD1=0;
       for m=i:i+7
           for n=j:j+7
                SAD1 = SAD1 + resi_img1(m,n); 
           end
       end
       SAD2=0;
       for m=i:i+7
           for n=j:j+7
                SAD2 = SAD2 + resi_img2(m,n); 
           end
       end
       if SAD1<SAD2
           result_img(i:i+7,j:j+7,:) = result_img1(i:i+7,j:j+7,:);
           resi_img(i:i+7,j:j+7) = resi_img1(i:i+7,j:j+7);
       else 
           result_img(i:i+7,j:j+7,:) = result_img2(i:i+7,j:j+7,:);
           resi_img(i:i+7,j:j+7) = resi_img2(i:i+7,j:j+7);
       end
    end
end
imwrite(result_img,'data/bi2d8881.jpg');
figure
imshow(result_img);
title('Bi2D--SEARCH   Block size = 8X8   Search Range p = 8', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
%----------------------------------------------------------------------
imwrite(resi_img,'data/rbi2d8881.jpg');
figure
imshow(resi_img);

title('Bi2D--SEARCH   Block size = 8X8   Search Range p = 8', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

SAD=0;
for i=1:rows*cols
    SAD = SAD + resi_img(i);
end
fprintf('Bi2D--SEARCH B=8 p=8  TOTAL SAD:%f  PSNR:%f\n',SAD,PSNR(result_img,target_img));
