[index, center] = kmeans(final, 10);

model = fitcknn(final, index, 'NumNeighbors', 1);

[x, y] = size(index);
ICs = zeros(x / 300, 10);

for i =  0:x / 300
    for j = 1:300
        class = predict(model, final(i * 300 + j, :));
        ICs(i + 1, class) = ICs(i + 1, class) + 1; 
    end
end