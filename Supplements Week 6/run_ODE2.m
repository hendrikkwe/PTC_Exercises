clear all; close all;clc;
% Script file for computing the Jacobian numerically for the predator-prey model in ClassExerscise task 1
load('ODE2_data.mat')

data.time=t;%time data
data.ydata=y;%response data for N_p
data.s0    = [40 9]; % intial condition      

theta0=[0.2 0.025 0.02 0.01];%initial guess


[theta_opt, ssmin] = fminsearch(@ODE2_ss,theta0,[],data);%call the optimizer

[s, t]=ODE2_Model(data.time,theta_opt,data.s0);%evaluate the model with optimized parameters

figure;
plot(data.time,data.ydata,'o',t,s) %plot the data vs solution
grid on


% numerical Jacobian
J = jacob(@ODE2_Model,data.time,theta_opt,[],data.s0);
% covariance estimate
n=length(data.time);
p=length(theta_opt);
sigma2 = ssmin/(n-p);
C = sigma2*inv(J'*J)




