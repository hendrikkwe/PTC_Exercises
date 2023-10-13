load('/Users/hendrikwe/projects/studium/Programmierung/MATLAB/PTC_LUT/Exercise3/task2/data_1.mat');

X = xy(:,1);
Y = xy(:,2);

%YY = log(Y);
%XX = [ones(length(X),1) X];

YY = log((1./Y)-1);
XX = [ones(length(X),1) X];

params = XX \ YY;

y_fit = 1./(1+exp(-(-params(1) - params(2).*X)))

plot(1:length(Y),Y,'o',1:length(y_fit),y_fit); title('model fit');