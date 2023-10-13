function res = ode_task3(t, inputs, k, k_s, y, b)
    
    s = inputs(1)
    x = inputs(2)
    
    ds = -(k*s*x)/(k_s + s)
    dx = y * (k * s * x)/(k_s + s) - b * x

    res = [ds; dx]
    
end