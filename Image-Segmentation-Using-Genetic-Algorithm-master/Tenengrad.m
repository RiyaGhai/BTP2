function [FM] = Tenengrad(Image)
%         Sx = fspecial('sobel');
%         Gx = imfilter(double(Image), Sx, 'replicate', 'conv');
%         Gy = imfilter(double(Image), Sx', 'replicate', 'conv');
%         FM = Gx.^2 + Gy.^2;
%         FM = mean2(FM);
        
        [Gx, Gy] = imgradientxy(Image);
        FM = Gx.^2 + Gy.^2;
        FM = FM.^0.5;
        FM = mean2(FM);
end