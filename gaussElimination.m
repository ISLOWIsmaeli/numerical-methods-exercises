disp("Welcome to the Gaussian");
disp("elimination method calculator.");
disp("Please follow the instructions");
disp("given below.");

row = input("Enter the number of rows: ");
column = input("Enter the number of columns: ");

% Initialize the matrix
matrix = zeros(row, column);

% Allow entry of matrix values
for i = 1:row
    for j = 1:column
        number = input(["Enter the number for matrix[", num2str(i), "][", num2str(j), "]: "]);
        matrix(i, j) = number;
    end
end

% Forward Elimination
for i = 1:row - 1
    pivot_row = i;
    while pivot_row <= row && matrix(pivot_row, i) == 0
        pivot_row = pivot_row + 1;
    end
    if pivot_row > row
        disp("No solution exists");
        return;
    end

    if pivot_row ~= i
        % Swap rows if necessary
        temp = matrix(i, :);
        matrix(i, :) = matrix(pivot_row, :);
        matrix(pivot_row, :) = temp;
    end

    for j = i + 1:row
        % Elimination
        multiplier = matrix(j, i) / matrix(i, i);
        matrix(j, :) = matrix(j, :) - multiplier * matrix(i, :);
    end
    disp(["The [",num2str(i),"] iteration"])
    disp(matrix)
end

if matrix(row, row) == 0
    disp("No solution exists");
    return;
end

solution = zeros(row, 1);
solution(row) = matrix(row, column) / matrix(row, row);
for i = row - 1:-1:1
    sum_val = matrix(i, column);
    for j = i + 1:row
        sum_val = sum_val - matrix(i, j) * solution(j);
    end
    solution(i) = sum_val / matrix(i, i);
end

disp("The final reduced matrix is:");
disp(matrix);

disp("The solution is:");
disp(solution);

disp("The solution in integers is:");
disp(int32(solution));

