function dT = beerode(t,T,k)
Tw = 5; Ta = 23;
dT = -k(1)*(T-Tw)-k(2)*(T-Ta);
end