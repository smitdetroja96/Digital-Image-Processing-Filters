clear all;
close all;
im = imread('lenaTest.jpg');

figure();
imshow(im);
I = double(im);

sigma = 1.76;
sz = 4;
[x,y]=meshgrid(-sz:sz,-sz:sz);

M = size(x,1)-1;
N = size(y,1)-1;
Exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
Kernel= exp(Exp_comp)/(2*pi*sigma*sigma);

Output=zeros(size(I));

I = padarray(I,[sz sz]);

for i = 1:size(I,1)-M
    for j =1:size(I,2)-N
        Temp = I(i:i+M,j:j+M).*Kernel;
        Output(i,j)=sum(Temp(:));
    end
end

Output = uint8(Output);
figure,imshow(Output);