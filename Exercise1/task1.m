
% #### a ####

% to make solving the linear equations easier, write it in form: Ax = b
% where: 

b = [5; 10; 3];

A = [2 3 -1; 4 -2 3; 1 1 1];

% solve

x = A \ b

% equally but slower: 

x = inv(A) * b

% #### b ####

b_b = [5; 10; 3; 8];

A_b = [2 3 -1; 4 -2 3; 1 1 1; 3 -1 2];

% here the least squares solution has to be used, this is done using a
% pseudo inverse that is created using SVD

x_b = pinv(A_b) * b_b

% #### c ##### 

b_c = [0; 0]

A_c = [1 1 1; 
       2 -1 3]

x_c_lsq = lsqminnorm(A_c, b_c)

x_c_backs = A_c \ b_c

% \ brings the least square solution
% lsqminnorm brings the smalles possible 2-norm (euklidian norm) minimizing
% the norm(X)

