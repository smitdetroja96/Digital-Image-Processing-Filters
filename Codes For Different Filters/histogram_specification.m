im = imread('lenaTest.jpg');
im=rgb2gray(im);
im2 = imread('Cameraman Image.png');
im2=rgb2gray(im2);
ft1 = zeros(1,256);
ft2 = zeros(1,256);
c1 =0;
c2=0;
for k=1:256
    t1 = im(im==k-1);
    t2 = im2(im2==k-1);
    ft1(1,k) = size(t1,1);
    ft2(1,k) = size(t2,1);
    c1 = c1+size(t1,1);
    c2 = c2 +size(t2,1);
end
imhist(im);
figure();
imhist(im2);
ft1 = ft1/c1;
ft2 = ft2/c2;

cdf_im = zeros(1,256);
cdf_ref = zeros(1,256);

for k=1:256
    cdf_im(1,k) = sum(ft1(1:k));
    cdf_ref(1,k) = sum(ft2(1:k));
end

output_hist = zeros(1,256);

for k=1:256
    t = cdf_ref - cdf_im(1,k);
    [m, n] = min(abs(t));
    output_hist(1,k) = n;
end

figure();
hist(output_hist);