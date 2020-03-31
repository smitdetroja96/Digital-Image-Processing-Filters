clear all;
close all;
I=imread('lenaTest.jpg');
im=rgb2gray(I);

figure();
imshow(I);

im = fft2(double(im)); 
A1=fftshift(im); 
[M,N]=size(im); 
R=10; 
X=0:N-1;
Y=0:M-1;
[X,Y]=meshgrid(X,Y);

x=0.5*N;
y=0.5*M;
low=exp(-((X-x).^2+(Y-y).^2)./(2*R).^2);

J=A1.*low;
J1=ifftshift(J);
imout=ifft2(J1);
figure();
imshow(abs(imout),[10 280]);
