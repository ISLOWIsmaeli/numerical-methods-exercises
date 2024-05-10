% Welcome message
disp("Welcome to the Gauss-Jordan elimination method calculator.");
disp("Please follow the instructions given below.");

% Prompt user to enter the number of rows and columns
row = input("Enter the number of rows: ");
column = input("Enter the number of columns (excluding the last column which contains the constants): ");

% Initialize the matrix and constants vector
matrix = zeros(row, column + 1); % +1 to include the constants column

% Allow entry of matrix values
for i = 1:row
    for j = 1:column
        number = input(["Enter the number for matrix[", num2str(i), "][", num2str(j), "]: "]);
        matrix(i, j) = number;
    end
end

% Allow entry of constants
for i = 1:row
    constant = input(["Enter the constant for equation ", num2str(i), ": "]);
    matrix(i, column + 1) = constant;
end

% Forward Elimination to Gauss-Jordan Form
for i = 1:min(row, column)
    % Partial Pivoting
    [~, max_row] = max(abs(matrix(i:row, i))); % Find the row with maximum absolute value in the current column
    max_row = max_row + i - 1; % Adjust row index
    if matrix(max_row, i) == 0
        disp("No solution exists");
        return;
    end
    if max_row ~= i
        % Swap rows if necessary
        temp = matrix(i, :);
        matrix(i, :) = matrix(max_row, :);
        matrix(max_row, :) = temp;
    end

    % Make leading entry 1
    matrix(i, :) = matrix(i, :) / matrix(i, i);

    % Elimination
    for j = [1:i-1, i+1:row]
        multiplier = matrix(j, i);
        matrix(j, :) = matrix(j, :) - multiplier * matrix(i, :);
    end

    disp(["The [",num2str(i),"] iteration"])
    disp(matrix)
end

% Display the final reduced matrix and solutions
disp("The final reduced matrix (Gauss-Jordan form) is:");
disp(matrix);

disp("The solutions are:");
disp(matrix(:, column + 1)); % Display the last column, which contains the solutions directly

