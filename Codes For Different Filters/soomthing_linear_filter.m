clear all;
close all;
im=imread('lenaTest.jpg');
I=rgb2gray(im);
imshow(I);
figure();
I=im2double(I);
I=imnoise(I,'salt & pepper');
imshow(I);
figure();
w=[1 1 1;1 1 1;1 1 1];
J=I;
len=length(w);
for i=2:255
    for j=2:255
        s=0;
        for k=-floor(len/2):floor(len/2)
            for l=-floor(len/2):floor(len/2)
            s=s+w(k+floor(len/2)+1,l+floor(len/2)+1)*I(i+k,j+l);
            end
        end
        s=s/sum(sum(w));
        J(i,j)=s;
    end
end
imshow(J);