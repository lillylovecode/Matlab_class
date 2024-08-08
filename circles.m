clc;clear all;
pkg load image;
coin = imread('coin2.jpg');
coin_BW = im2bw(coin);
imshow(coin)

hold on;
radiusRange = [150 600] %要測的圓的半徑範圍(越大算越久)
[center,radii,metric] = imfindcircles(coin_BW,radiusRange)
viscircles(center,radii)


