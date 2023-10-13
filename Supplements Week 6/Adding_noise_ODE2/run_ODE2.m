clear all; close all;clc;
% Script file adding noise to data for the predator-prey model: i.e.
% generating noisy data from the true solution and making the fits...Class
% Exercise Task 2

data.time=linspace(0,100);%time data

data.s0    = [40 9]; % intial condition


param_true=[0.0972 0.0047 0.0193 0.001];%True pramater values
s=ODE2_Model(data.time,param_true,data.s0);

%%Adding Gaussian noise to the simulated solutions
n_sim = 100;
sig=5;
n=length(data.time);
param_chain=zeros(n_sim,size(param_true,2));%preallocating to hold the parameter chains
param_0=[0.03 0.004 0.01 0];%initial guess;assume you do not know the true parameters
for i = 1:n_sim
    s_noisy = s+sig*randn(size(s));
    data.ydata=s_noisy;
    param_opt=fminsearch(@ODE2_ss,param_0,[],data);%making optimization with the noisy data
    param_chain(i,:)=param_opt;%collecting the parameter values in the loop
end

% Plotting the parameter chains
figure;
subplot(2,2,1)
plot(param_chain(:,1),'.')
title('r')
subplot(2,2,2)
plot(param_chain(:,2),'.')
title('a')
subplot(2,2,3)
plot(param_chain(:,3),'.')
title('s')
subplot(2,2,4)
plot(param_chain(:,4),'.')
title('p')

%visualizing  model and fits
figure; hold on;
for i = 1:n_sim
    plot(data.time,ODE2_Model(data.time,param_chain(i,:),data.s0),'y-');
end
plot(data.time,s,'k');




