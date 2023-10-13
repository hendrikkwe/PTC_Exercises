% solve numerically
tspan = [0, 300];
k = [0.06 0.03 5]; 
x_t_0 = [0 0];

[t, s] = ode23(@ode_task2, tspan, x_t_0, [], k)
plot(t,s)
legend("x_1", "x_2")

% solve symbolic 
syms x_1(t) x_2(t)

k = [0.06 0.03];
a = 5;

eqns = [
    diff(x_1, t) == -k(1) * x_1 + a 
    diff(x_2, t) == -k(1) * x_1 - k(2) * x_2 + a
]

conds = [
    x_1(0) == 0; x_2(0) == 0
]

[S_x_1, S_x_2] = dsolve(eqns, conds)

figure
fplot(S_x_1, [0 300], "r")
hold on
fplot(S_x_2, [0 300], "b")
legend("x_1", "x_2")

% again, both the solutions look equal, but indeed the numerical solution is only
% an estimation to the symbolical solution. One can see this by zooming into
% the plot

