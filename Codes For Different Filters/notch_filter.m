close all;
clear all;
im = imread('lenaTest.jpg');
im = im2double(im);
figure();
imshow(im);
f = fft2(im);

n = size(im, 1);
m = size(im, 2);
l = size(im, 3);

h = ones(n, m, l);
h(n/2, m/2, :) = 0;

x=fftshift(f.*h);
res = real(ifft2(x));
figure();
imshow(res);