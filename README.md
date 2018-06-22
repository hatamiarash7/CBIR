# Content Base Image Retrieval

This project is a simple CBIR system that :

1. Classify images from your data-set
2. Extract content features
3. Get an image for query
4. Analysis data-set to find similar examples


## Some Results

![enter image description here](https://github.com/hatamiarash7/CBIR/raw/master/results/1.png)
![enter image description here](https://github.com/hatamiarash7/CBIR/raw/master/results/2.png)
![enter image description here](https://github.com/hatamiarash7/CBIR/raw/master/results/3.png)
![enter image description here](https://github.com/hatamiarash7/CBIR/raw/master/results/4.png)

## Instructions
First you need to build a data-set from images. I'm using [vlfeat](https://github.com/vlfeat/vlfeat) to do that. At the end you have your data-set information in `matlab.mat` file.

We have many files here to use for each purpose and learning. In final project we have 3 file : `main.m` , `clustring.m` , `query.m`

1. run `main.m` to extract all features from data-set
2. run `clustring.m` to classify features
3. run `query.m` to find similar images
