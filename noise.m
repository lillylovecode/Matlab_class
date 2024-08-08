Lena=imread("lena_std.tif");
lena_g=rgb2gray(Lena);

%加鹽巴胡椒
noise1=imnoise(lena_g,'salt & pepper',0.02);
subplot(211)
imshow(noise1);

%加高斯
noise2=imnoise(lena_g,'gaussian',0.01);
subplot(212)
imshow(noise2);
