% function [resimg] = testhist(image,HM)

image = imread("images\fl3.jpg");
s=length(size(image));
if( s == 3)
image = rgb2gray(image);
end

GlobalAverage=20
HM=GlobalAverage
HM
ILE = find(image>=HM);
IHE = find(image<HM);

IL = image;
IL(ILE)=255;
IH = image;
IH(IHE)=0;


[k1,v1]=selfhist(IL,0);
[k2,v2]=selfhist(IH,1);

for i=1:size(v1,2)
    v1(i)=round(v1(i)*HM);
end

for i=1:size(v2,2)
    v2(i)=round(v2(i)*(255-HM))+HM;
end
histogram(v1);
histogram(v2);

keys=[k1,k2];
vals=[v1,v2];

M = containers.Map(keys,vals);
% M[keys]=[vals];

resimg=image;
for i=1:size(image,1)
    for j=1:size(image,2)
        resimg(i,j) = M(double(image(i,j)));
    end
end
subplot(1,3,1)
imshow(image)
subplot(1,3,2)
imshow(resimg)
subplot(1,3,3)
histogram(resimg)

EI=histeq(image);

subplot(2,3,1);
imshow(image);
subplot(2,3,2);
imshow(EI);
subplot(2,3,3);
histogram(EI);
subplot(2,3,4);
imshow(image);
subplot(2,3,5);
imshow(resimg);
subplot(2,3,6);
histogram(resimg);


    PSNRofResultHist = PSNR(EI,image)    
    PSNRofResultBiHist = PSNR(resimg,image)
    
   
    TenegradOfImage = Tenengrad(image)
    TenegradOfResultHistogarmEQ = Tenengrad(EI)  
    TenegradOfResultBihistogarmEQ = Tenengrad(resimg)
    
    contrastOfOriginalImage=Contrast(image)
    ContrastOfResultUsingHistogramEQ=Contrast(EI)
    ContrastOfResultUsingBiHistogramEQ=Contrast(resimg)
    
% end



