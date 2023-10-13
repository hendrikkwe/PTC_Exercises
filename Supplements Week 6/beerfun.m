function T = beerfun(t,theta,T0)
[t,T] = ode45(@beerode,t,T0,[],theta);
end