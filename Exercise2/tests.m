s0 = [1 0 0]; %initial values for A,B,C
k1 = 0.7; %model parameter
k2 = 0.2; %model parameter
syms A(t) B(t) C(t) %create symbolic functions
% system equations
eqns = [diff(A,t) == -k1*A diff(B,t) == k1*A - k2*B...
    diff(C,t) == k2*B];
% initial conditions
conds = [A(0) == s0(1); B(0) == s0(2); C(0) == s0(3)];
% Solve the system
[S_A, S_B, S_C] = dsolve(eqns, conds)
% plot the solution
figure
fplot(S_A, [0 10])
hold on
fplot(S_B, [0 10])
fplot(S_C, [0 10])