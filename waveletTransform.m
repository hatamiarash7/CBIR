function [waveletMoments] = waveletTransform(image)
% input: image to process and extract wavelet coefficients from
% output: 1x20 feature vector containing the first 2 moments of wavelet
% coefficients
% imgGray = double(rgb2gray(image))/255;
% imgGray = imresize(imgGray, [256 256]);
[m,n,p] =  size(image);
if p == 3
    image = rgb2gray(image);
end
imgGray = imresize(image, [256 256]);
% [a,b,c,d] = dwt2(imgGray, 'coif1');
coeff_1 = dwt2(imgGray, 'coif1');

coeff_2 = dwt2(coeff_1, 'coif1');

coeff_3 = dwt2(coeff_2, 'coif1');

coeff_4 = dwt2(coeff_3, 'coif1');

% construct the feaute vector
meanCoeff = mean(coeff_4);
stdCoeff = std(coeff_4);

[waveletMoments] = [meanCoeff stdCoeff];

end