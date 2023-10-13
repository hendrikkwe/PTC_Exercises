clear all; close all; clc;

x = [1, 4, 7, 10, 13, 16, 19];
y = [0.43, 1.29, 1.96, 2.32, 2.77, 2.83, 2.70];

b0 = [3,8];

fun = @(theta, x) theta(1)*(1-exp(-theta(2).*x));

fit = lsqcurvefit(fun, b0, x, y)

modelfit=fun(fit,x);

figure; 
hold on;
plot(x,fun(fit, x))
plot(x,y, ".")

n_samples = 1000;
n = length(x);
chain = zeros(n_samples,length(fit));
modelfit_ = zeros(n_samples,n);

for i = 1:n_samples
    %i
    inds = randi(n,1,n);%generate random indices
    %inds = ceil(n*rand(1,n));%alternative way to generate random indices
    xdata_new=x(inds);%extract the corresponding xdata
    ydata_new=y(inds);%extract the corresponding ydata
    b_ = lsqcurvefit(fun,b0,xdata_new,ydata_new); %perform optimization with the generated data
    modelfit_(i,:)=fun(b_,x);
    
    chain(i,:) = b_;%collect the parameter values
end


% visualize data and fits
figure;
hold on;
plot(x,modelfit_','y')
plot(x,modelfit','k')
plot(x,y,'ko');
xlabel('x');
ylabel('y');

%visualize the parameter chains
figure;
subplot(2,1,1)
plot(chain(:,1),'.')
title('\theta_1')
subplot(2,1,2)
plot(chain(:,2),'.')
title('\theta_2')

