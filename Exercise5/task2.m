rows = 5;
columns = 4;

random_matrix = rand(rows, columns)

% ++++++++++++++++
% Mean
% ++++++++++++++++

variable_means = zeros(1, size(random_matrix, 2));

for col = 1:size(random_matrix, 2)
    variable_means(col) = sum(random_matrix(:, col)) / size(random_matrix, 1);
end

% to test
variable_means = mean(random_matrix);

disp("Means of the variables (columns):");
disp(variable_means);

% ++++++++++++++++
% Variances
% ++++++++++++++++

variable_variances = zeros(1, size(random_matrix, 2));

for col = 1:size(random_matrix, 2)
    col_mean = sum(random_matrix(:, col)) / size(random_matrix, 1);
    squared_diff = (random_matrix(:, col) - col_mean).^2;
    variable_variances(col) = sum(squared_diff) / (size(random_matrix, 1) - 1); 
end

disp("Variances of the variables (columns):");
disp(variable_variances);

% ++++++++++++++++
% Covariances
% ++++++++++++++++

num_variables = size(random_matrix, 2);
covariance_matrix = zeros(num_variables, num_variables);

for i = 1:num_variables
    for j = 1:num_variables
        mean_i = sum(random_matrix(:, i)) / size(random_matrix, 1);
        mean_j = sum(random_matrix(:, j)) / size(random_matrix, 1);
        
        cov_ij = sum((random_matrix(:, i) - mean_i) .* (random_matrix(:, j) - mean_j)) / (size(random_matrix, 1) - 1);
        
        covariance_matrix(i, j) = cov_ij;
    end
end

%cov(random_matrix)

% Display the covariance matrix
disp("Covariance Matrix:");
disp(covariance_matrix);

% ++++++++++++++++
% Correlation
% ++++++++++++++++

correlation_matrix = zeros(num_variables, num_variables);

for i = 1:num_variables
    for j = 1:num_variables

        column_i = random_matrix(:, i);
        column_j = random_matrix(:, j);
        
        mean_i = sum(column_i) / size(random_matrix, 1);
        mean_j = sum(column_j) / size(random_matrix, 1);
        
        std_i = sqrt(sum((column_i - mean_i).^2) / (size(random_matrix, 1) - 1));
        std_j = sqrt(sum((column_j - mean_j).^2) / (size(random_matrix, 1) - 1));
        
        correlation_coefficient = sum((column_i - mean_i) .* (column_j - mean_j)) / ((size(random_matrix, 1) - 1) * std_i * std_j);
        
        correlation_matrix(i, j) = correlation_coefficient;
    end
end

disp("Correlation Matrix:");
disp(correlation_matrix);

