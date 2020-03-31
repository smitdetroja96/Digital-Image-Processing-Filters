clear all;
close all;

im = imread('lenaTest.jpg');
im = im2double(rgb2gray(im));

imshow(im);
h = ones(3,3);
[n,m] = size(im);
[p,q] = size(h);
ll = 0-floor(p/2);
rl = floor(p/2);

resimage = im;
for i=1:n
    for j=1:m
        num = double(0);
        den = double(0);
        for k=ll:rl
            for l=ll:rl
                dx = double(i+k);
                dy = double(j+l);
                if((1<=dx && dx<=n) && (1<=dy && dy<=m))
                    num = num + im(dx,dy)*h(rl+1+k,rl+1+l);
                    den = den + h(rl+1+k,rl+1+l);
                end
            end
        end
        resimage(i,j) = floor(num/den);
    end
end


figure();
imshow(resimage);