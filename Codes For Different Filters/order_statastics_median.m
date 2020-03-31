clear all;
close all;

im = imread('lenaTest.jpg');
[n,m] = size(im);

p = 5;
ll = 0-floor(p/2);
rl = floor(p/2);

out_im = im;
for i=1:n
    for j=1:m
    	sz = 0;
        a = [];
        for k=ll:rl
            for l=ll:rl
                dx = double(i+k);
                dy = double(j+l);
                sz = sz+1;
                if((1<=dx && dx<=n) && (1<=dy && dy<=m))
                	a(sz) =  im(dx,dy);
                else
                	a(sz) = 0;
                end
            end
        end
        out_im(i,j) = median(a);
    end
end

figure();
imshow(im);

figure();
imshow(out_im);