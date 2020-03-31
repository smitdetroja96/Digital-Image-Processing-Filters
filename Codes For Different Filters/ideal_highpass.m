clear all;
close all;
im = imread('lenaTest.jpg');
im=rgb2gray(im);
[M,N]=size(im);
F=fft2(double(im));
u=0:(M-1);
v=0:(N-1);
idx=find(u>M/2);
P = 50;
u(idx)=u(idx)-M;
idy=find(v>N/2);
v(idy)=v(idy)-N;
[V,U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2);
H=double(D>P);
G=H.*F;
imout=real(ifft2(double(G)));
imshow(im);
figure();
imshow(imout, []);