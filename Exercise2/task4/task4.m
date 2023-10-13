
tspan = [0, 360];
k = [100, 3.835, 0.00001, 1.1];
s_0 = [1, 2, 3]; 

[t,s_res] = ode45(@ode_task4, tspan, s_0, [], k)

plot(t,s_res)

legend("x","y","z")