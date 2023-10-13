clear all; close all; clc
%Bootstrapping with linear model: a differnt approach from the code in the
%slide in terms of generating the sample indices. In the slide, we generated
%the desire number of data for bootstrapping before hand and used arrayfun
%to apply the indices to the original data to extract the corresponding
%values. Here, we generate in the loop one set of sample indices at a time
%and extract the correspoding xdata and ydata values.
tic
xdata = 1:1:19; % x-values to evaluate the model at
ydata = [5.3058 4.6509 6.812 6.006 9.3565 9.4842 8.903 10.692...
12.569 11.77 13.534 14.481 15.133 17.836 17.522 17.608 17.894...
20.795 21.882]; % y-values
n = length(xdata);
X = [ones(n,1) xdata']; % coefficient matrix
Y = ydata';
% estimate parameters
theta = X\Y;
modelfit = X*theta; % model fit with original data
% perform the bootstraps
nsample = 1000; % number of bootstraps to perform
modelfit_ = zeros(nsample,n);
params = zeros(nsample,2);

for i = 1:nsample
inds = ceil(n*rand(1,n));
%inds = randi(n,1,n);
xdata_new=xdata(inds);
ydata_new=ydata(inds);
%xdata_new=inds;
% construct coefficient matrix
X = [ones(n,1) xdata_new'];
Y = ydata_new';
% estimate parameters
theta_ = X\Y;
% evaluate the model
modelfit_(i,:) = theta_(1) + xdata*theta_(2);
% record the parameters
params(i,:) = theta_;
end
toc
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
subplot(3,1,1)
plot(params(:,1),'.')
title('\theta_0')
subplot(3,1,2)
plot(params(:,2),'.')
title('\theta_1')
subplot(3,1,3)
plot(params(:,1),params(:,2),'.')
xlabel('\theta_0')
ylabel('\theta_1')


