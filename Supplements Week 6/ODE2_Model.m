function [y, t] = ODE2_Model(t, params, s0)
%This function solves the ODEmodel
[t,y] = ode23s(@ODE2_fun,t,s0,[],params);