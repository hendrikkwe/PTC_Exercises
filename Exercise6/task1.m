clear all; close all; clc;

load("ross.mat")

data.time = time;
data.y = [ih, im];
data.s0 = [0.0734, 0.0361];

init = [4.6371 1.5075 0.1005 0.3317];

[theta_opt, ssmin] = fminsearch(@ss_fun, init, [], data);

[s, t]=solve_ode(data.time, theta_opt, data.s0)

figure;
plot(data.time,data.y,'o',t,s) %plot the data vs solution
grid on

% numerical Jacobian
J = jacob(@solve_ode,data.time,theta_opt,[],data.s0);
% covariance estimate
n=length(data.time);
p=length(theta_opt);
sigma2 = ssmin/(n-p);
C = sigma2*inv(J'*J)

function err = ss_fun(params, data)

    [t,s] = solve_ode(data.time, params, data.s0);
     
    err = sum(sum((data.y - s).^2));
end

function [t,s] = solve_ode(t, unknowns, s0)
    [s,t] = ode23(@ode,t,s0,[],unknowns);
end

function ds = ode(t, s, k)
    
    i_h = s(1); 
    i_m = s(2);

    mab = k(1);
    ac = k(2);
    r = k(3);
    mu = k(4);

    d_i_h = mab * i_m * (1 - i_h) - i_h * r;
    d_i_m = ac * i_h * (1 - i_m) - mu * i_m;

    ds = [d_i_h; d_i_m];
   
end