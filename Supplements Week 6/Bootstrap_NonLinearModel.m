%Script file for bootstrapping for the nonlinear model in Class Exercise 3
clear all; close all; clc;

load data_1.mat %load('data_1.mat')


xdata = xy(:,1);
ydata = xy(:,2);

x0 = [1,0.15];
fun = @(theta,x) 1./(1+exp(-(theta(1)+theta(2)*x)));  %define the model function
b = lsqcurvefit(fun,x0,xdata,ydata);
modelfit=fun(b,xdata);


%% bootstrap
n_samples = 1000;
n = length(xdata);
chain = zeros(n_samples,length(b));
modelfit_ = zeros(n_samples,n);


for i = 1:n_samples
    %i
    inds = randi(n,1,n);%generate random indices
    %inds = ceil(n*rand(1,n));%alternative way to generate random indices
    xdata_new=xdata(inds);%extract the corresponding xdata
    ydata_new=ydata(inds);%extract the corresponding ydata
    b_ = lsqcurvefit(fun,x0,xdata_new,ydata_new); %perform optimization with the generated data
    modelfit_(i,:)=fun(b_,xdata);%collect the fits in the loop
    %modelfit_(i,:) = 1./(1+exp(-(b_(1)+b_(2)*xdata)));%alternative way
    chain(i,:) = b_;%collect the parameter values
end




% visualize data and fits
figure;
hold on;
plot(xdata,modelfit_','y')
plot(xdata,modelfit','k')
plot(xdata,ydata,'ko');
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




