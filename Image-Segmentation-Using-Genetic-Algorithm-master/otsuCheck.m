%otsu
image = imread("images/fl.jpg");
s=length(size(image));
if( s == 3)
image = rgb2gray(image);
end
for n=2:8
idx= otsu(image,n);

m=0;
for i=1:size(idx,1)
    for j=1:size(idx,2)
        m=max(m,idx(i,j));
    end
end
for i=1:size(idx,1)
    for j=1:size(idx,2)
        idx(i,j)= (idx(i,j)/m);
    end
end
subplot(1,9,n-1)
imshow(idx)
end