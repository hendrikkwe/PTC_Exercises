clear all; close all; clc

T0 = 31; 
Ta = 23; 
Tw = 5;

data.x = [0 : 60 : 540 840 1020 1320]' ;
data.Y = [31 28 24 20 17.5 15.5 13.5 12 11 10 8 7 6.5]';
theta0 = [0.001 0.0001];
n = length(data.x); 


%fun = @(x,theta) 1./(1+exp(-(theta(1)+theta(2)*x)));  %define the model function   
fun = @(k,x) (T0 - ((k(1) .* Tw + k(2) .* Ta) ./ (k(1) + k(2)))) .* exp(-(k(1) + k(2)) .* x) + (k(1) .* Tw + k(2) .* Ta) ./ (k(1) + k(2));


%ssfun    = @(theta,data) sum((data.ydata-fun(data.xdata,theta)).^2); % ss function
ssfun    = @(k,data) sum((data.Y-fun(k,data.x)).^2); % ss function

% Then minimize ssfun using 'fminsearch'.

th_init = [0.001 0.0001]; % ... after some trial & error, by plotting various options
[thmin,ssmin] = fminsearch(ssfun,theta0,[],data);

yfit=fun(thmin,data.x);
%yfit=fun(thmin,data.t_meas);

figure;
plot(data.x,data.Y,'o',data.x,yfit)

%% Use the least square curve fit function (lscurvefit)
%lscurvefit computes the sum of square implicitly ....sum {(FUN(THETA,XDATA)-YDATA).^2}
% note from the above that the model function inputs must be given in the
% order (theta,xdata) unlike in fminsearch where you can be flexible with
% the order for the model function.

[thmin_,ssmin_] = lsqcurvefit(fun,theta0,data.x,data.Y);

yfit_=fun(thmin_,data.x);

figure;
plot(data.x,data.Y,'o',data.x,yfit_)