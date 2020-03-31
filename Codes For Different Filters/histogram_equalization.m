clear all;
close all;
im=imread('lenaTest.jpg');
I=rgb2gray(im);
imshow(I);

figure();
imhist(I);
J=histeq(I);
figure();
imhist(J);
figure();
imshow(J);
K=I;
nopix=zeros(1,256);
for i=1:256
    for j=1:256
        nopix(I(i,j)+1)=nopix(I(i,j)+1)+1;
    end
end
for i=2:256
    nopix(i)=nopix(i-1)+nopix(i);
end

for i=1:256
    nopix(i)=floor(nopix(i)*255/nopix(256));
end

for i=1:256
    for j=1:256
        K(i,j)=nopix(K(i,j)+1);
    end
end
figure();
imshow(K);
figure();
imhist(K);
