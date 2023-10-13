A = randn(4400);

disp("Invert A of length 4400")
tic
inv(A);
toc

B = randn(3390);

disp("Calc SVD of B with length 5000")

tic
svd(B);
toc

C = randn(6400);
x = randn(6400, 1);

tic
C\x;    
toc