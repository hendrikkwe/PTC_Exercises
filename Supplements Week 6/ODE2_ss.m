function ss = ODE2_ss(params,data)
%INPUT teta, data
%OUTPUT ss (lsq) value

y_obs = data.ydata; %data for prey population N_p
t=data.time;
s0=data.s0;
%call the ODE solver to get the states s:
y_cal = ODE2_Model(t,params,s0);
y_cal = y_cal(:,1); %separate the measured Np
%compute the expression to be minimized:
ss= sum((y_obs-y_cal).^2);
