function features = getColorFeatures()
    fileList = getAllFiles('C:\Users\hatamiarash7\Downloads\Dataset\test1\image.orig');
    feature = zeros(length(fileList), 6);
    for i = 1:length(fileList)
        Image = imread(fileList{i, 1});
        feature(i,:) = RGB_Extraction(Image);
    end
    features = feature;
end

