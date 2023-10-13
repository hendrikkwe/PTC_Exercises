clear all; close all; clc;

x1 = [1.0 1.0 2.0 1.8 3.0 4.0 5.2 6.5 8.0 10.0]';
x2 = [1.0 1.5 2.0 2.0 3.0 4.0 4.9 7.0 7.0 9.0]';

XX = [x1 x2];

%y_noise = func_with_noise(x1, x2, 1, 2)
    
%theta_guess = XX \ y_noise
    
%y_fit = XX * theta_guess;

vectorList = zeros(1000, 2); 
vectorResults = zeros(1000, 10); 

for i = 1:1000
       
    y_noise = func_with_noise(x1, x2, 1, 2);
    
    theta_guess = XX \ y_noise; 
    
    vectorList(i, :) = theta_guess ;

    vectorResults(i, :) = XX * theta_guess;

end

cov(vectorList)
figure;

plot(vectorList(:,1))
figure;

plot(vectorList(:,2))
figure;

hold on; 
for c = 1:1000

    
    plot(XX, vectorResults(c,:), ".")

end


plot(XX, x1 * 1 + x2 * 2)


% Repeat the data generation and estimation 1000 times 
% and collect the obtained samples for the parameters


function y = func_with_noise(x1,x2, theta_1, theta_2)
    
    error = 0 + 1 * randn(1, 1);

    y = x1 * theta_1 + x2 * theta_2 + error ; 
end