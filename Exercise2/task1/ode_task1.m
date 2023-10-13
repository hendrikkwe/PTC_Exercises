function ds = ode_task1(t, s, k)

    x = s(1);
    z = s(2);
    
    dx = z + 4; 
    dz = -3 * x; 

    ds = [dx; dz];

end