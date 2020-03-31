im = double(imread('lenaTest.jpg')); 
h = size(im,1); 
l = size(im,2); 

out_im = im;

filter = [1 +2 +1; 0 0 0; -1 -2 -1]; 

for i = 2 : h-1
   for j = 2 : l-1  
        temp = im(i - 1 : i + 1, j - 1 : j + 1);
        a = (sum(filter.* temp));
        x = sum(a);
        b = (sum(filter'.* temp));
        y = sum(b);
        pix =sqrt(x.^2+ y.^2);
        out_im(i, j) = pix;
   end
end
out_im = uint8(out_im); 
figure(); 
imshow(abs(out_im)); 