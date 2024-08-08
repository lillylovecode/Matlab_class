clc; clear all;

pkg load image;
pkg load signal;

n=512;
% Load the image
Lena=imread("lena_std.tif");

R=Lena(:,:,1);
G=Lena(:,:,2);
B=Lena(:,:,3);
ZZ=uint8(zeros(n));
Lena_cat = cat(3,R,G,B); ##concat
Lena_R = cat(3,R,ZZ,ZZ);
Lena_G = cat(3,ZZ,G,ZZ);
Lena_B = cat(3,ZZ,ZZ,B);

Lena_gray=rgb2gray(Lena);

lena_dct = dct(Lena_gray);
subplot(2,1,1);
imshow(real(lena_dct));

lena_fft= fft(Lena_gray);
subplot(2,1,2);
imshow(real(lena_fft));

