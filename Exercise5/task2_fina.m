clear all; close all; clc;
x = [0.0 1.0 1.0 2.0 1.8 3.0 4.0 5.2 6.5 8.0 10.0]';
y = [5.00 5.04 5.12 5.28 5.48 5.72 6.00 6.32 6.68 7.08 7.52]';

X = [ones(length(x), 1), x]

params = (X' * X) \ (X' * y)

y_fit = params(1) + params(2) * x

%figure
%plot(x, y, "b")
%hold on; 
%plot(x, y_fit, "r")

covariance_matrix = cov(y, y_fit)

std_b = sqrt(diag(covariance_matrix));
t_b = params./std_b

R2 = 1-sum((y-y_fit).^2)/sum((y-mean(y)).^2)