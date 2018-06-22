function features = getWaveletFeatures()
    fileList = getAllFiles('C:\Users\hatamiarash7\Downloads\Dataset\test1\image.orig');
    feature = zeros(length(fileList), 40);
    for i = 1:length(fileList)
        Image = imread(fileList{i, 1});
        feature(i,:) = waveletTransform(Image);
    end
    features = feature;
end