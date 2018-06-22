queryImage = imread(imdb.images.name{1, 366});

[h, s, v] = rgb2hsv(queryImage);
[width, height, none] = size(queryImage);

rand_a = randi([10, width - 10], 1, 300);
rand_b = randi([10, height - 10], 1, 300);

queryFeature = zeros(1, 9);

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

    queryFeature(i, :) = [meanH stdH homogeneityH meanS stdS homogeneityS meanV stdV homogeneityV];
end

[indexQ, centerQ] = kmeans(queryFeature, 10);
modelQ = fitcknn(queryFeature, indexQ, 'NumNeighbors', 1);

queryIndexedDatabase = zeros(1, 10);

for i = 1:300
    class = predict(modelQ, queryFeature(i, :));
    queryIndexedDatabase(1, class) = queryIndexedDatabase(1, class) + 1; 
end

[x, y] = size(ICs);
distance = zeros(x, 1);

for i = 1:x
    distance(i, 1) = sqrt(sum((ICs(i,:) - queryIndexedDatabase).^2));
end

[sortedValue, sortedIndex] = sort(distance);

for i = 25:50
    finalImage = imread(imdb.images.name{1, sortedIndex(i)});
    subplot(5,10,i)
    imshow(finalImage)
    title(i-30)
end

subplot(5,10,1:25)
imshow(queryImage)
title("Query Image")

suptitle("Arash Hatami - Self Organizing Natural Scene .::. 2018")