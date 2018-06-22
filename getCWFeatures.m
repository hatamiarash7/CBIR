function features = getCWFeatures()
    fileList = getAllFiles('C:\Users\hatamiarash7\Downloads\Dataset\test1\image.orig');
    waveletFeatures = zeros(length(fileList), 40);
    colorFeatures = zeros(length(fileList), 6);
    
    for i = 1:length(fileList)
        Image = imread(fileList{i, 1});
        waveletFeatures(i,:) = waveletTransform(Image);
        colorFeatures(i,:) = RGB_Extraction(Image);
    end
    
    features = [waveletFeatures, colorFeatures];
end

