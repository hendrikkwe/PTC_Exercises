clear all; clc; close all

% Xa = b -> find a with truncated SVD
% a = X-1b
% a = pinv(X)b

X = [2 3 -1 ; 
    4 -1 2; 
    3 2 -3; 
    1 2 1]

% X = VSU

b = [5; 7 ;8; 3]

X_inv = pinv(X)

a_pinv = X_inv*b

a_backs = X\b

[U,S,V] = svd(X)

% pinv(X) = V * S-1 * U^T

X_svd_inv = V * pinv(S) * U'
