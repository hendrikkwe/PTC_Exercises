% Script file obtain statistics for parameter estimates of beerODE model by
% adding noise to data
clear all; close all; clc;

t=[0:60:540 840 1020 1320];%time

k1k2_true=[0.003 0.00016];   % True parameter values


T0=31; %Initial temperature of beer

% Simulate the model with the true parameter values
T=beerfun(t,k1k2_true,T0);

%%Adding gaussian random noise to the simulated solution
n_sim = 500;
sig=0.5;
n=length(t);
param_chain=zeros(n_sim,size(k1k2_true,2));%preallocating to hold the parameter chains
modelfit=zeros(n_sim,n);%preallocating to hold the model fits
k1k2_0=[0.001 0.001];%initial guess of parameters; we assume we do not know the true parameters
for i = 1:n_sim
    T_noisy = T+sig*randn(size(T));%adding gaussian random noise
    data=[t',T_noisy];%collect the time and noisy data in a matrix
    thopt=fminsearch(@beerss,k1k2_0,[],data,T0);%get the optimized solution with the noisy data
    modelfit(i,:)=beerfun(t,thopt,T0);%collect your model fits
    param_chain(i,:)=thopt;%collect your optimized parameter values
end

%Plot the parameter chains
figure;
subplot(3,1,1)
plot(param_chain(:,1),'.')
title('k_1')
subplot(3,1,2)
plot(param_chain(:,2),'.')
title('k_2')
subplot(3,1,3)
plot(param_chain(:,1),param_chain(:,2),'.')
title('k_1,k_2')

% visualize model and fits
figure;
hold on;
plot(t,modelfit','y')
plot(t,T,'k');
xlabel('t');
ylabel('T');
%OR do this to visualize model and fits
figure; hold on;
for i = 1:n_sim
    plot(t,beerfun(t,param_chain(i,:),T0),'y-');
end
plot(t,T,'k');









