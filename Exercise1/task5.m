close all; clear all; clc;
% Task 5
%Note: i used another picture because it took too long to load the cat.jpg
%Load image 
image = imread('C:\Users\sfeye\OneDrive\Desktop\3.Semester-Finnland\Principles for Technical Computing\Week 1-exercises\Task 5\rhino.png');

imshow(image)

%Convert to grayscale
gray = rgb2gray(image);
imshow(gray)

%Gray image needs to be converted for svd 
gray_double = double(gray);
[U,S,V] = svd(gray_double, 'econ');

%Extract the diagonal values from the sigma-matrix
diagonalS = diag(S);

%define truncation values 
trun_values = [5, 10, 20, 30, 50, 100, 200, 220];

% define matrix for similarity values 
similarity = zeros(length(trun_values), 1);

%Reconstruction for every truncation value 
figure; 

for  i = 1:length(trun_values)
    trun_diagonal = diagonalS;
    trun_diagonal(trun_values(i):end) = 0;
    trun_s = diag(trun_diagonal);
    reconstructed_image = U * trun_s * V';

    %Calculate similarity
    similarity_score = sum(trun_diagonal)/ sum(diagonalS);
    similarity(i) = similarity_score;

    %show reconstructed image
    subplot(2, ceil(length(trun_values)/2), i)
    imshow(reconstructed_image ./ 255)
end

%Plot similarity score 
figure; 
plot(trun_values, similarity, "-o")
xlabel("Truncated values")
ylabel("Similarity Score")