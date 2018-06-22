clear;
clc;
load('matlab.mat');
final = zeros(length(imdb.images.set) * 300, 9);
index_counter = 1;

Labels = imdb.images.class;
TargetLabel = zeros(max(imdb.images.class), length(imdb.images.set));

for j = 1:length(imdb.images.set)
    originImage = imread(imdb.images.name{1, j});
    [h, s, v] = rgb2hsv(originImage);
    [width, height, none] = size(originImage);

    rand_a = randi([10, width - 10], 1, 300);
    rand_b = randi([10, height - 10], 1, 300);
    
    for i = 1:300
        maskH = h(rand_a(i):rand_a(i) + 9, rand_b(i):rand_b(i) + 9);
        meanH = mean(mean(maskH));
        stdH = std(std(double(maskH)));    
        grayMatrixH = graycomatrix(maskH);
        grayPropertiesH = graycoprops(grayMatrixH);
        homogeneityH = grayPropertiesH.Homogeneity;
   
        maskS = s(rand_a(i):rand_a(i) + 9, rand_b(i):rand_b(i) + 9);
        meanS = mean(mean(maskS));
        stdS = std(std(double(maskS)));
        grayMatrixS = graycomatrix(maskS);
        grayPropertiesS = graycoprops(grayMatrixS);
        homogeneityS = grayPropertiesS.Homogeneity;
   
        maskV = v(rand_a(i):rand_a(i) + 9, rand_b(i):rand_b(i) + 9);
        meanV = mean(mean(maskV));
        stdV = std(std(double(maskV)));
        grayMatrixV = graycomatrix(maskV);
        grayPropertiesV = graycoprops(grayMatrixV);
        homogeneityV = grayPropertiesV.Homogeneity;
   
        final(index_counter, :) = [meanH stdH homogeneityH meanS stdS homogeneityS meanV stdV homogeneityV];
        index_counter = index_counter + 1;
    end
end