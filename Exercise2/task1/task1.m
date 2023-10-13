% choose initial values for S 
s0 = [2, 3];
tspan = [0, 10];

% solve numerically
[t_line,s] = ode23(@ode_task1, tspan, s0, []);

% solve symbolically 
syms x(t) z(t)

eqns = [diff(x,t)==z+4 diff(z,t)==-3*x];

conds = [x(0) == 2, z(0)==3];

[S_x, S_z] = dsolve(eqns, conds)

figure
fplot(S_x, [0 10], "r")
hold on
fplot(S_z, [0 10], "r")
hold on 
figure 
plot(t_line,s, "b")

% both the solutions look equal, but indeed the numerical solution is only
% an estimation to the symbolical solution. One can see this by zooming into
% the plot



