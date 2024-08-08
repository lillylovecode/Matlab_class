Lena=imread("lena_std.tif");
lena_g=rgb2gray(Lena);

%加鹽巴胡椒
noise1=imnoise(lena_g,'salt & pepper',0.02);

%平滑化 Average
lena_smooth = wiener2(noise1,[5 5]);

%中央加權中值 Media
lena_media = medfilt2(noise1,[3 3]);

%影像直方圖 histogram of image => imhist()



subplot(411);
imshow(lena_g);
subplot(412);
imshow(noise1);
subplot(421);
imshow(lena_smooth);
subplot(422);
imshow(lena_media);

##subplot(411);
##imhist(noise1);
##subplot(422);
##imhist(lena_smooth);
##subplot(414);
##imhist(lena_media);




