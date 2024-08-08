##作業:將Lena圖切成8個正交平面，並將kmu logo塞入第3個及第7個平面，最後再組合

clc; clear all;
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

##subplot(2,2,1);imshow(Lena);
##subplot(2,2,2);imshow(Lena_R);
##subplot(2,2,3);imshow(Lena_G);
##subplot(2,2,4);imshow(Lena_B);

##---------------------------

Lena_g=0.299*R+0.587*G+0.114*B;
figure,subplot(2,1,1);imshow(Lena_g);
Lena_gray=rgb2gray(Lena);
subplot(2,1,2);imshow(Lena_gray);

%count differance
diff_L=Lena_g - Lena_gray;

##---------------------------
% Load the image
KMU_logo = imread('KMU_logo.jpg');
KMU256=imresize(KMU_logo,[256 256]);

% Split the image into 8 planes
subplot(331),imshow(Lena_gray);
for i=8:-1:1
  A_bitplane=bitshift(double(bitget(Lena_gray,i)),i-1);
  subplot(3,3,9-i+1);
  imshow(A_bitplane);
  title(['bitplane' num2str(i)]);
end


%bitget 取出圖片中的bit

%bitset 設定圖片中的bit




