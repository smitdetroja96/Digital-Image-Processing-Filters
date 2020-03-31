clear all;
close all;

im = imread('lenaTest.jpg');
im = rgb2gray(im);
im = cast(im,'double');
m1 = [-1 0;0 1];
m2 = [0 -1;1 0];

[m,n] = size(im);

out_im = zeros(m,n);

for i=1:1:n-1
	for j=1:1:m-1
	   t = im(i: i + 1, j: j + 1);
       a = (sum(m1.* t));
       x = sum(a);
       b = (sum(m2.* t));
       y = sum(b);
       pixValue =sqrt(x.^2+ y.^2);
       out_im(i : i+1, j: j+1) = out_im(i:i+1,j:j+1) + pixValue;
    end
end

im = cast(im,'uint8');
imshow(im);
figure();
out_im = cast(out_im,'uint8');
imshow(out_im);