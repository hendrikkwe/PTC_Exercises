clear all; close all; clc;

load('/Users/hendrikwe/projects/studium/Programmierung/MATLAB/PTC_LUT/Exercise5/xy.mat');

b_0 = [1 0.1]; % initial quess for the optimizer
n = length(xy(:, 1)); % number of data points

options = optimset('Display', 'iter'); 
[bmin,ssmin] = fminsearch(@f_ss,b_0,[],xy);

J = [1-exp(-bmin(2).*xy(:,1)), xy(:,1).*bmin(1).*exp(-xy(:,1).*bmin(2))]

sigma2 = ssmin/(n-2); % std of measurument noise estimated by the resid
C = sigma2 * inv(J'*J)

function res = f(x, theta)

    res = theta(1) .* x .* exp(1 + theta(2) + x.^2); 

end

function sum_of_squares = f_ss(theta, xy)
   
    f_output = f(xy(:,1), theta);
    
    sum_of_squares = sum((xy(:,2) - f_output).^2);
end
