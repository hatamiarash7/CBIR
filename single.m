clear
image = imread('C:\Users\hatamiarash7\Downloads\Dataset\test1\image.orig\500.jpg');
fileList = getAllFiles('C:\Users\hatamiarash7\Downloads\Dataset\test1\image.orig');

waveletFeature(1,:) = waveletTransform(image);
colorFeature = RGB_Extraction(image);
CWFeature = [waveletFeature, colorFeature];

waveletFeatures = getWaveletFeatures();
colorFeatures = getColorFeatures();
CWFeatures = getCWFeatures();

waveletDistances = zeros(1000, 1);
colorDistances = zeros(1000, 1);
cwDistance = zeros(1000, 1);

for i = 1:1000
    waveletDistances(i,1) = sqrt(sum((waveletFeatures(i,:)-waveletFeature).^2));
    colorDistances(i,1) = sqrt(sum((colorFeatures(i,:)-colorFeature).^2));
    cwDistance(i,1) = sqrt(sum((CWFeatures(i,:)-CWFeature).^2));
end

[waveletSortedValues, waveletSortedIndex] = sort(waveletDistances);
[colorSortedValues, colorSortedIndex] = sort(colorDistances);
[CWSortedValues, CWSortedIndex] = sort(cwDistance);

wavelet_i1 = imread(fileList{waveletSortedIndex(1), 1}); 
wavelet_i2 = imread(fileList{waveletSortedIndex(2), 1});
wavelet_i3 = imread(fileList{waveletSortedIndex(3), 1});
wavelet_i4 = imread(fileList{waveletSortedIndex(4), 1});
wavelet_i5 = imread(fileList{waveletSortedIndex(5), 1});

color_i1 = imread(fileList{colorSortedIndex(1), 1}); 
color_i2 = imread(fileList{colorSortedIndex(2), 1});
color_i3 = imread(fileList{colorSortedIndex(3), 1});
color_i4 = imread(fileList{colorSortedIndex(4), 1});
color_i5 = imread(fileList{colorSortedIndex(5), 1});

cw_i1 = imread(fileList{CWSortedIndex(1), 1}); 
cw_i2 = imread(fileList{CWSortedIndex(2), 1});
cw_i3 = imread(fileList{CWSortedIndex(3), 1});
cw_i4 = imread(fileList{CWSortedIndex(4), 1});
cw_i5 = imread(fileList{CWSortedIndex(5), 1});