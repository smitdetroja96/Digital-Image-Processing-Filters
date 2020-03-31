clear all;
close all;

im = imread('lenaTest.jpg');
im = imresize(im,0.5);
[n,m] = size(im);

p = 30;
ll = -floor(p/2);
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

out_image =  out_im-im;
imshow(im);
figure();
imshow(out_image);