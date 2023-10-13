load('data_8.mat');

coeff_poly = polyfit(x, yr, 2);

y_poly = polyval(coeff_poly, x);
y_poly(y_poly < 0) = 0;

% log-transform on y
log_yr = log(yr);

% least-squares fit
X = [ones(size(x)), x, x.^2];
coeff_exp = X \ log_yr;

a = coeff_exp(1);
b = coeff_exp(2);
c = coeff_exp(3);

y_exp = exp(a + b * x + c * x.^2);

initial_guess = [a, b, c];
options = optimset('fminsearch');
options.Display = 'iter'; 
options.TolFun = 1e-6;    
options.TolX = 1e-6;     

fun = @(params) sum((exp(params(1) + params(2) * x + params(3) * x.^2) - yr).^2);
optimized_params = fminsearch(fun, initial_guess, options);

a_optimized = optimized_params(1);
b_optimized = optimized_params(2);
c_optimized = optimized_params(3);

y_exp_optimized = exp(a_optimized + b_optimized * x + c_optimized * x.^2);

figure;
plot(x, yr, 'ro', 'DisplayName', 'Original Data');
hold on;
plot(x, y_poly, 'b-', 'DisplayName', 'Polynomial Fit');
plot(x, y_exp, 'g--', 'DisplayName', 'Exponential Fit (LSQ)');
plot(x, y_exp_optimized, 'm-.', 'DisplayName', 'Exponential Fit (fminsearch)');
legend('Location', 'Northwest');
xlabel('x');
ylabel('yr');
title('Data Fitting');
grid on;
hold off;
