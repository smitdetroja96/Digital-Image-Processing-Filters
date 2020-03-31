clear all;
close all;

A = 1.3;
I = double(imread('lenaTest.jpg'));
imshow(I);
A = double(A);
f = double(I);
[m,n]=size(f);
j0 = f;
for i=3:m-2
    for j=3:n-2
        j0(i,j) = (-8*f(i,j))+(1*f(i-1,j))+(1*f(i+1,j))+(1*f(i,j-1))+(1*f(i,j+1))...
    +(1*f(i-1,j-1))+(1*f(i+1,j+1))+(1*f(i-1,j+1))+(1*f(i+1,j-1)); 
    end
end

I1 = f.*(A-1)+j0;
figure(); 
imshow(I1);