clear all;
close all;
im=imread('lenaTest.jpg');
figure();
imshow(im);

I1=im;
I=zeros(size(im));
I2=zeros(size(im));

f1=[0 1 0;1 -4 1; 0 1 0];
f2=[1 1 1;1 -8 1; 1 1 1];

im=padarray(im,[1,1]);
im=double(im);

for i=1:size(im,1)-2
    for j=1:size(im,2)-2
       
        I(i,j)=sum(sum(f1.*im(i:i+2,j:j+2)));
       
    end
end

I=uint8(I);
figure();
imshow(I);

B=I1-I;
figure();
imshow(B);