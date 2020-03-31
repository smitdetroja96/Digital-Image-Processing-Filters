clear all;
close all;

im = imread('lenaTest.jpg');
doubleimage = double(im);

h = ones(3,3);
[n,m] = size(im);
[p,q] = size(h);
ll = -floor(p/2);
rl = floor(p/2);

out_im = im;
for i=1:n
    for j=1:m
        num = double(0);
        d = double(0);
        for k=ll:rl
            for l=ll:rl
                dx = double(i+k);
                dy = double(j+l);
                if((1<=dx && dx<=n) && (1<=dy && dy<=m))
                    num = num + doubleimage(dx,dy)*h(rl+1+k,rl+1+l);
                    d = d + h(rl+1+k,rl+1+l);
                end
            end
        end
        out_im(i,j) = floor(num/d);
    end
end

figure();
imshow(im);

figure();
imshow(out_im);