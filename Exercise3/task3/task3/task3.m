X = [1 4 7 11 14 19 21 23]';
Y = [0.13 0.24 0.27 0.29 0.30 0.31 0.31 0.31]';

YY = 1./Y;
XX = [ones(length(X), 1) 1./X];

params = XX \ YY

y_fit = X./(params(2)+params(1)*X)

plot(1:length(Y),Y,'o',1:length(y_fit),y_fit); title('model fit');