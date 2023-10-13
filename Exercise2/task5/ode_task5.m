function ds = ode_task5(t, s)

    % 5 = 2z + 100 log(y)
    % (5 - 2z)/100 = log(y)
    % 10^(5 - 2z)/100 = y

    z = s(1);
    y = s(2);

    dz = -2 * z + y^2;
    %y = 10^((5 - 2*z)/100);
    y_e = 2 * z + 100 * log(y) - 5;

    ds = [dz; y_e];

end