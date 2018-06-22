function [colorMoments] = HSV_Extraction(h, s, v)
%RGB_EXTRACTION Summary of this function goes here
%   Detailed explanation goes here

meanH = mean(h);
meanS = mean(s);
meanV = mean(v);

stdH = std(double(h));
stdS = std(double(s));
stdV = std(double(v));

colorMoments = [meanH stdH meanS stdS meanV stdV];
end