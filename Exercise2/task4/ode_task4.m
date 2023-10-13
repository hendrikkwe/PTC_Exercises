function ds = ode_task4(t, l, k)
    
    x = l(1);
    y = l(2);
    z = l(3);

    s_var = k(1);
    w = k(2);
    q = k(3);
    f = k(4);

    d_x = s_var * (y - (x * y) + x - (q * x ^ 2));
    d_y = ((-y) - (x * y) + (f * z))/s_var;
    d_z = w * (x - z);

    ds = [d_x; d_y; d_z];
        
end