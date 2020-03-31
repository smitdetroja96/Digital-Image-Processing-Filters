clear all;
close all;
im = imread('lenaTest.jpg');
im = im2double(rgb2gray(im));

figure();
imshow(im);

m = length(im);
image = fftshift(fft2(im));
figure(); 
imshow(real(image));

d0 = 15;
n = 2;
inv = zeros(m, m);
H = zeros(m, m);

for i = 1 : m
    for j = 1 : m
        d = ((i - 1 - m/2)^2 + (j - 1 - m/2)^2)^(1/2);
        H(i, j) = 1/(1 + (d0/d)*(2*n));
    end 
end

inv = fftshift(H.*image);
out_im = real(ifft2(inv));

figure();
imshow(out_im);