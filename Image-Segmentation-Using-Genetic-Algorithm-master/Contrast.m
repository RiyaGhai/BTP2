function [con] = Contrast(image)
con=0;
for i=2:size(image,1)-1
    for j=2:size(image,2)-1
        n=0;
        m=0; %x>x5
        k=0; %x<x5
        for ki=i-1:i+1
            for kj=j-1:j+1
                if image(ki,kj)>image(i,j)
                    m=m+image(ki,kj);
                    n=n+1;
                else
                    k=k+image(ki,kj);
                end
            end
        end
        con = con + (m/n) - (k/(9-n));
    end
end
end