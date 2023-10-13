function ds = ode_task2(t, x, k)
    
    % k_1 = k(1)
    % k_2 = k(2)
    % a = k(3)
   
    disp(t)
    disp(x)
    

    a = k(3);
   

    d_x_1 = -k(1) * x(1) + a
    d_x_2 = -k(1) * x(1) - k(2) * x(2) + a

    ds =[d_x_1; d_x_2]

end