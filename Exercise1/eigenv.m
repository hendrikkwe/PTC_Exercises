
A = [1 2; 3 4];
% Eigenvectors and eigenvalues of matrix A
[V,D] = eig(A);
% First eigenvector and corresponding eigenvalue
v1 = V(:,1);
lambda1 = D(1,1);
% Second eigenvector and corresponding eigenvalue
v2 = V(:,2);
lambda2 = D(2,2);