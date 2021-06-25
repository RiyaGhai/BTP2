% img = imread("images\download.jpg");

 function CalculateAverage(segmentedImg,image)

m = containers.Map('KeyType','double','ValueType','any');
% image = imread("images/download.jpg");
for i=1: size(segmentedImg,1)
    for j=1: size(segmentedImg,2)
        m(segmentedImg(i,j))=0;
    end
end
Nobins=size(m,2);
backMean=0;
k= keys(m);
k= cell2mat(k);
for z=1:size(k,2)
    s=0.0;
    c=0;
for i=1: size(segmentedImg,1)
    for j=1: size(segmentedImg,2)
        if(segmentedImg(i,j)== k(1,z))
            s = s+ double(image(i,j));
            c=c+1;
        end
    end
end
m(k(1,z))=round(s/c);
if backMean < round(s/c)
    backMean= round(s/c);
end

end


k= values(m);
k= cell2mat(k);
s=0;
for i=1:size(k,2)
%     if (k(1,i)~=backMean)
    s = s+ k(1,i);
%     end
end

% GlobalAverage = round( (round(s/size(k,2)-1)+ backMean)/2);
GlobalAverage = round(round(s/size(k,2)))
[ig]= testhist(image,GlobalAverage);
end

        