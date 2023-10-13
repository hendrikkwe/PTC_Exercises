clear all; close all; clc;

x = rand(1, 1000); 
y = x + randn(1, 1000);

figure
hold on; 

for i = 1:1000

sample_is = sort(randi(1000, 100, 1));

theta = x(sample_is)' \ y(sample_is)'

y_fit = x(sample_is)' * theta

plot(x(sample_is), y_fit)
plot(x(sample_is),y(sample_is), ".")

end