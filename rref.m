disp("Welcome to the Row Echelon");
disp("method calculator.");
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

% Forward Elimination to Row Echelon Form
for i = 1:min(row, column) % Iterate until the minimum of row or column
    % Partial Pivoting
    [~, max_row] = max(abs(matrix(i:row, i))); % Find the row with maximum absolute value in the current column
    max_row = max_row + i - 1; % Adjust row index
    if matrix(max_row, i) == 0
        disp("No unique solution exists");
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
    for j = i + 1:row
        multiplier = matrix(j, i);
        matrix(j, :) = matrix(j, :) - multiplier * matrix(i, :);
    end
    disp(["The [",num2str(i),"] iteration"])
    disp(matrix)
end

if matrix(row, row) == 0
    disp("No unique solution exists");
    return;
end

% Back Substitution
solution = zeros(row, 1);
for i = row:-1:1
    solution(i) = matrix(i, column);
    for j = i + 1:column-1
        solution(i) = solution(i) - matrix(i, j) * solution(j);
    end
    solution(i) = solution(i) / matrix(i, i);
end

disp("The final reduced matrix (row echelon form) is:");
disp(matrix);

disp("The solution is:");
disp(solution);

disp("The solution in integers is:");
disp(int32(solution));

