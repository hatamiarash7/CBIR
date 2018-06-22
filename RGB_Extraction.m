function [colorMoments] = RGB_Extraction(image)
%RGB_EXTRACTION Summary of this function goes here
%   Detailed explanation goes here

R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

meanR = mean(R(:));
meanG = mean(G(:));
meanB = mean(B(:));

stdR = std(double(R(:)));
stdG = std(double(G(:)));
stdB = std(double(B(:)));

colorMoments = [meanR stdR meanG stdG meanB stdB];
end