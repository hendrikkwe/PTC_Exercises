close all; clc; clear all;

tspan = [-5 5];
y0 = [2, 0.99005];

M = [1 0; 0 0];
options = odeset('Mass',M,'RelTol',1e-4,'AbsTol',[1e-6 1e-6]);

[t,s] = ode15s(@ode_task5,tspan,y0,options);

plot(t,s)
legend("z", "y")

