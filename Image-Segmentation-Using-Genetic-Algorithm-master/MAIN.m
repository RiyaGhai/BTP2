clc
clear all
image = imread('cameraman.png');
out = histeq(image);

Evaluate(image,out);

subplot(1,2,1);
imshow(image)
subplot(1,2,2);
imshow(out);