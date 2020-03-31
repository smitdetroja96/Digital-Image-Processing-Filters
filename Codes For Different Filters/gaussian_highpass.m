clear all;
close all;
I=imread('lenaTest.jpg');
im = fft2(double(rgb2gray(I))); 
A=fftshift(im); 
[M,N]=size(im); 
R=10; 
X=0:N-1;
Y=0:M-1;
[X,Y]=meshgrid(X,Y);

x=0.5*N;
y=0.5*M;
low=exp(-((X-x).^2+(Y-y).^2)./(2*R).^2);

hi=1-low; 


K=A.*hi;
out_im=ifftshift(K);
imout=ifft2(out_im);

figure();
imshow(I);

figure(); 
imshow(abs(imout),[10 280]);