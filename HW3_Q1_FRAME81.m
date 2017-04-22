%% Clean variables and screen
close all;
clear;
clc;
titlefont = 15;
fontsize = 13;

refer_img = imread('data/frame72.jpg');
refer_img = im2double(refer_img);
target_img = imread('data/frame81.jpg');
target_img = im2double(target_img);
[rows ,cols , heights] = size(refer_img);
%FULL SEARCH-----------------------------------------------------------

%Block size = 8X8   Search Range p = 8
[resi_img,result_img] = fullsearch(refer_img,target_img,8,8);
imwrite(result_img,'data/fs8881.jpg');
figure
imshow(result_img);
title('FULL SEARCH   Block size = 8X8   Search Range p = 8', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
%----------------------------------------------------------------------
imwrite(resi_img,'data/rfs8881.jpg');
figure
imshow(resi_img);

title('FULL SEARCH   Block size = 8X8   Search Range p = 8', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

SAD=0;
for i=1:rows*cols
    SAD = SAD + resi_img(i);
end
fprintf('FULL SEARCH B=8 p=8  TOTAL SAD:%f  PSNR:%f\n',SAD,PSNR(result_img,target_img));
%----------------------------------------------------------------------

%Block size = 16X16   Search Range p = 8
[resi_img,result_img] = fullsearch(refer_img,target_img,8,16);
imwrite(result_img,'data/fs81681.jpg');
figure
imshow(result_img);
title('FULL SEARCH   Block size = 16X16   Search Range p = 8', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
%----------------------------------------------------------------------
imwrite(resi_img,'data/rfs81681.jpg');
figure
imshow(resi_img);
title('FULL SEARCH   Block size = 16X16   Search Range p = 8', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

SAD=0;
for i=1:rows*cols
    SAD = SAD + resi_img(i);
end
fprintf('FULL SEARCH B=16 p=8  TOTAL SAD:%f  PSNR:%f\n',SAD,PSNR(result_img,target_img));
%----------------------------------------------------------------------

%Block size = 8X8   Search Range p = 16
[resi_img,result_img] = fullsearch(refer_img,target_img,16,8);
imwrite(result_img,'data/fs16881.jpg');
figure
imshow(result_img);
title('FULL SEARCH   Block size = 8X8   Search Range p = 16', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
%----------------------------------------------------------------------
imwrite(resi_img,'data/rfs16881.jpg');
figure
imshow(resi_img);
title('FULL SEARCH   Block size = 8X8   Search Range p = 16', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

SAD=0;
for i=1:rows*cols
    SAD = SAD + resi_img(i);
end
fprintf('FULL SEARCH B=8 p=16  TOTAL SAD:%f  PSNR:%f\n',SAD,PSNR(result_img,target_img));
%----------------------------------------------------------------------

%Block size = 16X16   Search Range p = 16
[resi_img,result_img] = fullsearch(refer_img,target_img,16,16);
imwrite(result_img,'data/fs161681.jpg');
figure
imshow(result_img);
title('FULL SEARCH   Block size = 16X16   Search Range p = 16', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
%----------------------------------------------------------------------
imwrite(resi_img,'data/rfs161681.jpg');
figure
imshow(resi_img);
title('FULL SEARCH   Block size = 16X16   Search Range p = 16', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

SAD=0;
for i=1:rows*cols
    SAD = SAD + resi_img(i);
end
fprintf('FULL SEARCH B=16 p=16  TOTAL SAD:%f  PSNR:%f\n',SAD,PSNR(result_img,target_img));
%----------------------------------------------------------------------

%2D--SEARCH-----------------------------------------------------------

%Block size = 8X8   Search Range p = 8
[resi_img,result_img] = Mysearch2D(refer_img,target_img,8,8);
imwrite(result_img,'data/2d8881.jpg');
figure
imshow(result_img);
title('2D--SEARCH   Block size = 8X8   Search Range p = 8', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
%----------------------------------------------------------------------
imwrite(resi_img,'data/r2d8881.jpg');
figure
imshow(resi_img);

title('2D--SEARCH   Block size = 8X8   Search Range p = 8', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

SAD=0;
for i=1:rows*cols
    SAD = SAD + resi_img(i);
end
fprintf('2D--SEARCH B=8 p=8  TOTAL SAD:%f  PSNR:%f\n',SAD,PSNR(result_img,target_img));
%----------------------------------------------------------------------

%Block size = 16X16   Search Range p = 8
[resi_img,result_img] = Mysearch2D(refer_img,target_img,8,16);
imwrite(result_img,'data/2d81681.jpg');
figure
imshow(result_img);
title('2D--SEARCH   Block size = 16X16   Search Range p = 8', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
%----------------------------------------------------------------------
imwrite(resi_img,'data/r2d81681.jpg');
figure
imshow(resi_img);
title('2D--SEARCH   Block size = 16X16   Search Range p = 8', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

SAD=0;
for i=1:rows*cols
    SAD = SAD + resi_img(i);
end
fprintf('2D--SEARCH B=16 p=8  TOTAL SAD:%f  PSNR:%f\n',SAD,PSNR(result_img,target_img));
%----------------------------------------------------------------------

%Block size = 8X8   Search Range p = 16
[resi_img,result_img] = Mysearch2D(refer_img,target_img,16,8);
imwrite(result_img,'data/2d16881.jpg');
figure
imshow(result_img);
title('2D--SEARCH   Block size = 8X8   Search Range p = 16', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
%----------------------------------------------------------------------
imwrite(resi_img,'data/r2d16881.jpg');
figure
imshow(resi_img);
title('2D--SEARCH   Block size = 8X8   Search Range p = 16', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

SAD=0;
for i=1:rows*cols
    SAD = SAD + resi_img(i);
end
fprintf('2D--SEARCH B=8 p=16  TOTAL SAD:%f  PSNR:%f\n',SAD,PSNR(result_img,target_img));
%----------------------------------------------------------------------

%Block size = 16X16   Search Range p = 16
[resi_img,result_img] = Mysearch2D(refer_img,target_img,16,16);
imwrite(result_img,'data/2d161681.jpg');
figure
imshow(result_img);
title('2D--SEARCH   Block size = 16X16   Search Range p = 16', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
%----------------------------------------------------------------------
imwrite(resi_img,'data/r2d161681.jpg');
figure
imshow(resi_img);
title('2D--SEARCH   Block size = 16X16   Search Range p = 16', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

SAD=0;
for i=1:rows*cols
    SAD = SAD + resi_img(i);
end
fprintf('2D--SEARCH B=16 p=16  TOTAL SAD:%f  PSNR:%f\n',SAD,PSNR(result_img,target_img));
%----------------------------------------------------------------------