tspan = [0 40];
initials = [2000, 100];

k = 5;
k_s = 20; 
y = 0.05; 
b = 0.01; 

[t,s] = ode23(@ode_task3, tspan, initials, [], k, k_s, y, b)

plot(t,s, "-x")
legend("s", "x")