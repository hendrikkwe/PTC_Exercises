clear all;
close all;
clc;

% Constants
R = 8.314;
Tref = 300; % Kelvin
k1ref = 1;
k2ref = 1;
E1 = 10^4;
E2 = 10^4;
tspan = 0:1:9;
theta0 = [1, 0];

% Data for Experiment 1
data1.y = [
    1.000 0.000
    0.504 0.416
    0.186 0.489
    0.218 0.595
    0.022 0.506
    0.102 0.493
    0.058 0.458
    0.064 0.394
    0.000 0.335
    0.082 0.309
];

data1.temperature = 282; 
data1.time = 0:1:9;

% Data for Experiment 2
data2.y = [
    1.000 0.000
    0.415 0.518
    0.156 0.613
    0.196 0.644
    0.055 0.444
    0.011 0.435
    0.000 0.323
    0.032 0.390
    0.000 0.149
    0.079 0.222
];

data2.temperature = 313; 
data2.time = 0:1:9;

% Solve and plot for Experiment 1
subplot(121)
ABC_solved(data1, k1ref, E1, k2ref, E2, tspan, theta0, R, Tref)

% Solve and plot for Experiment 2
subplot(122)
ABC_solved(data2, k1ref, E1, k2ref, E2, tspan, theta0, R, Tref)

%%
function k = calculateK(T, kref, E, R, Tref)
    k = kref * exp(E ./ R .* (1./T - 1./Tref));
end

function ABC_solved(data, k1ref, E1, k2ref, E2, tspan, theta0, R, Tref)
    theta = [k1ref, E1, k2ref, E2];
    theta_optim = fminsearch(@(theta) loss(theta, data, tspan, theta0, R, Tref), theta);

    plot(data.time, data.y(:,1), 'bo'); hold on;
    plot(data.time, data.y(:,2), 'ro'); hold on;
    sol = predict_y(theta_optim, data, tspan, theta0, R, Tref);
    plot(data.time, sol(:,1), 'b-'); hold on;
    plot(data.time, sol(:,2), 'r-')
    title(sprintf("T = %.2f K", data.temperature))
    legend({"Substance A", "Substance B"})

    function loss_value = loss(theta, data, tspan, theta0, R, Tref)
        sol = predict_y(theta, data, tspan, theta0, R, Tref);
        y_true = data.y;
        loss_value = sum(sum((sol - y_true) .^ 2));
    end
end

function y_pred = predict_y(theta, data, tspan, theta0, R, Tref)
    k1ref = theta(1);
    E1 = theta(2);
    k2ref = theta(3);
    E2 = theta(4);
    [t, y_pred] = ode23(@(t, s) task3ODE(t, s, calculateK(data.temperature, k1ref, E1, R, Tref), calculateK(data.temperature, k2ref, E2, R, Tref)), tspan, theta0);
end

function ds = task3ODE(t, s, k1, k2)
    A = s(1);
    B = s(2);
    dA = -k1 * A;
    dB = k1 * A - k2 * B;
    ds = [dA; dB];
end