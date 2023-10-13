function ss = beerss(theta,data,T0)
t = data(:,1);
Tobs = data(:,2);
Tmod = beerfun(t,theta,T0);
ss = sum((Tobs-Tmod).^2);
end