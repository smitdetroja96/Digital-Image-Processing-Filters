clear all;
close all;
im = imread('lenaTest.jpg');
im = im2double(im);
im=rgb2gray(im);

figure();
imshow(im);

m = length(im);
image = fftshift(fft2(im));
figure(2);
imshow(image);
% img = ifft(image);
% figure(4);
% imshow(img);
% d0 = (2*((M/2)^2))^(1/2) - 100;
d0 = 50;
out_im = zeros(m, m);
H = zeros(m, m);

for i = 1 : m
    for j = 1 : m
        d = ((i - 1 - m/2)^2 + (j - 1 - m/2)^2)^(1/2);
        H(i, j) = 1/(1 + (d/d0)*4);
    end 
end

out_im = fftshift(H.*image);

im = real(ifft2(out_im));
figure();
imshow(im);