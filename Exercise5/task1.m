x_1 = [0.0 1.0 1.0 2.0 1.8 3.0 4.0 5.2 6.5 8.0 10.6];
y_1 = [5.00 5.04 5.12 5.28 5.48 5.72 6.00 6.32 6.68 7.08 7.52];

x_2 = [0.9 1.3 1.3 1.4 1.6 1.8 2.1 2.1 2.5 2.9 3.2 3.3 3.6 4.0 4.2 4.3];
y_2 = [2.5 4.03 4.1 4.4 5.1 6.05 7.48 7.6 9.8 12.4 14.3 15.2 18.1 19.9 23.0 23.9];

x_3 = [-3 -2 -1 0 1 2 3 ];
y_3 = [7.5 3 0.5 1 3 6 14];

% +++++++++++++++++++++
% DATA 1, linear
% +++++++++++++++++++++

degree = 1;
lin_coefficients_1 = polyfit(x_1, y_1, degree);
n = length(x_1);
predictions = zeros(1,n); % holds the prediction for each data point
for p=1:n

    trainix = setdiff(1:n,p);
    testix = p;
    
    lin_coefficients = polyfit(x_1(trainix), y_1(trainix), degree);
    predictions(p) = lin_coefficients(1) * x_1(testix) + lin_coefficients(2);

end

length(x_1)
length(predictions)

figure
plot(x_1, y_1, "b")
hold on; % Hold
plot(x_1, predictions, "r")

R2 = 100 * (1 - sum((y_1-predictions).^2) / sum((y_1-mean(y_1)).^2));
disp('Data 1 lin model: Q2 value')
disp(R2)


% +++++++++++++++++++++
% DATA 2, linear
% +++++++++++++++++++++

degree = 1;
lin_coefficients_2 = polyfit(x_2, y_2, degree);
n = length(x_2);
predictions = zeros(1,n); % holds the prediction for each data point
for p=1:n

    trainix = setdiff(1:n,p);
    testix = p;
    
    lin_coefficients = polyfit(x_2(trainix), y_2(trainix), degree);
    predictions(p) = lin_coefficients(1) * x_2(testix) + lin_coefficients(2);

end


figure
plot(x_2, y_2, "r")
hold on; % Hold
plot(x_2, predictions, "r")

R2 = 100 * (1 - sum((y_2-predictions).^2) / sum((y_2-mean(y_2)).^2));
disp('Data 2 lin model: Q2 value')
disp(R2)

% +++++++++++++++++++++
% DATA 3, linear
% +++++++++++++++++++++

degree = 1;
lin_coefficients_3 = polyfit(x_3, y_3, degree);
n = length(x_3);
predictions = zeros(1,n); % holds the prediction for each data point
for p=1:n

    trainix = setdiff(1:n,p);
    testix = p;
    
    lin_coefficients = polyfit(x_3(trainix), y_3(trainix), degree);
    predictions(p) = lin_coefficients(1) * x_3(testix) + lin_coefficients(2);

end

figure
plot(x_3, y_3, "r")
hold on; % Hold
plot(x_3, predictions, "r")


R2 = 100 * (1 - sum((y_3-predictions).^2) / sum((y_3-mean(y_3)).^2));
disp('Data 3 lin model: Q2 value')
disp(R2)

% quad model 
degree = 2;

% +++++++++++++++++++++
% DATA 1, quadratic
% +++++++++++++++++++++

degree = 2;
lin_coefficients_1 = polyfit(x_1, y_1, degree);
n = length(x_1);
predictions = zeros(1,n); % holds the prediction for each data point
for p=1:n

    trainix = setdiff(1:n,p);
    testix = p;
    
    lin_coefficients = polyfit(x_1(trainix), y_1(trainix), degree);
    predictions(p) = lin_coefficients(1) * x_1(testix)^2 + lin_coefficients(2) * x_1(testix) + lin_coefficients(3);

end

R2 = 100 * (1 - sum((y_1-predictions).^2) / sum((y_1-mean(y_1)).^2));
disp('Data 1 quad model: Q2 value')
disp(R2)


% +++++++++++++++++++++
% DATA 2, quadratic
% +++++++++++++++++++++

degree = 2;
lin_coefficients_2 = polyfit(x_2, y_2, degree);
n = length(x_2);
predictions = zeros(1,n); % holds the prediction for each data point
for p=1:n

    trainix = setdiff(1:n,p);
    testix = p;
    
    lin_coefficients = polyfit(x_2(trainix), y_2(trainix), degree);
    predictions(p) = lin_coefficients(1) * x_2(testix)^2 + lin_coefficients(2) * x_2(testix) + lin_coefficients(3);

end

R2 = 100 * (1 - sum((y_2-predictions).^2) / sum((y_2-mean(y_2)).^2));
disp('Data 2 quad model: Q2 value')
disp(R2)


% +++++++++++++++++++++
% DATA 3, quadratic
% +++++++++++++++++++++

degree = 2;
lin_coefficients_3 = polyfit(x_3, y_3, degree);
n = length(x_3);
predictions = zeros(1,n); % holds the prediction for each data point
for p=1:n

    trainix = setdiff(1:n,p);
    testix = p;
    
    lin_coefficients = polyfit(x_3(trainix), y_3(trainix), degree);
    predictions(p) = lin_coefficients(1) * x_3(testix)^2 + lin_coefficients(2) * x_3(testix) + lin_coefficients(3);

end

figure
plot(x_3, y_3, "r")
hold on; % Hold
plot(x_3, predictions, "r")

R2 = 100 * (1 - sum((y_3-predictions).^2) / sum((y_3-mean(y_3)).^2));
disp('Data 3 quad model: Q2 value')
disp(R2)
