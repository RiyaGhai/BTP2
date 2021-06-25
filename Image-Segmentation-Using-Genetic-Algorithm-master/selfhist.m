%selfhist
function [key,val] = selfhist(img,flag)

% for i=1:255
% pdf(i)=0;
% end

M = containers.Map('KeyType','double','ValueType','double');
a=size(img,1);
b=size(img,2);
for i=1:a
    for j=1:b
%         if flag==0
%             if(img(i,j)~=255)
%             pdf(i*size(img,1)+j) = pdf(i*size(img,1)+j)+1;
%             end
%         else
%             if(img(i,j)~=0)
%              pdf(i*size(img,1)+j-n) = pdf(i*size(img,1)+j-n)+1;
%             end
%         end
if isKey(M,double(img(i,j))) == 1
    M(img(i,j)) = M(img(i,j))+1;
else
    M(img(i,j))=1;
end
    end
end
map=M;
sort(M);

if flag==0
    M.remove(255);
else
    M.remove(0);
end

key = cell2mat(keys(M));
val = cell2mat(values(M));
sumofval=0;
for i=1:size(val,2)
sumofval= val(i)+sumofval;
end
sumofval;
for i=1:size(val,2)
    val(i)=val(i)/sumofval;
    
end
for i=2:size(val,2)
    val(i)=val(i)+val(i-1);
end



end