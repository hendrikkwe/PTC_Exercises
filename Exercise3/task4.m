clear; close all; clc;
%Fitting the nonlinear model using matlab backslash 
X = [5 7 11 12 15 17 19]'; % X(input) data
Y = [0.93 0.91 0.84 0.82 0.76 0.71 0.66]'; % Y(response) data
n = length(X); % extract the length of data
XX = [ones(n,1) X.^2]; % Define the coefficient matrix
YY = log(1./Y); % reciprocal transformation
params = XX\YY; % estimate the parameters
theta1 = params(1); % recover the original parameter values
theta2 = params(2);
%theta = [theta1, theta2];
Yfit = 1./(exp(theta1+(theta2.*X.^2))); % Get the fitted values

figure;
plot(X,Y,'o',X,Yfit) % plot data and fitted values
title('model fit');
grid on