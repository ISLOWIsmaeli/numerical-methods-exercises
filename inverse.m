% Welcome message
disp("Welcome to the matrix inverse calculator.");
disp("Please follow the instructions given below.");

% Prompt user to enter the number of rows and columns
row = input("Enter the number of rows: ");
column = input("Enter the number of columns: ");

% Validate if inverse can be found
if row ~= column
    disp("The matrix must be square to find its inverse.");
    disp("Exiting program.");
    return;
end

% Allow entry of matrix values
matrix = zeros(row, column);
for i = 1:row
    for j = 1:column
        number = input(["Enter the number for matrix[", num2str(i), "][", num2str(j), "]: "]);
        matrix(i, j) = number;
    end
end

% Display the input matrix
disp("The input matrix is:");
disp(matrix);

% Function to calculate determinant using cofactor expansion
function det_value = determinant(matrix)
    [row, column] = size(matrix);

    if row == 1 && column == 1 % Base case for 1x1 matrix
        det_value = matrix(1, 1);
        return;
    elseif row == 2 && column == 2 % Base case for 2x2 matrix
        det_value = matrix(1, 1) * matrix(2, 2) - matrix(1, 2) * matrix(2, 1);
        return;
    end

    det_value = 0;
    for j = 1:column
        % Calculate cofactor
        cofactor = (-1)^(1+j) * matrix(1, j) * determinant(matrix_minor(matrix, 1, j));
        % Sum up cofactors
        det_value = det_value + cofactor;
    end
end

% Function to calculate minor of a matrix
function minor = matrix_minor(matrix, row_index, column_index)
    minor = matrix([1:row_index-1, row_index+1:end], [1:column_index-1, column_index+1:end]);
end

% Function to calculate matrix of minors
function minors_matrix = minors(matrix)
    [row, column] = size(matrix);
    minors_matrix = zeros(row, column);
    for i = 1:row
        for j = 1:column
            minors_matrix(i, j) = determinant(matrix_minor(matrix, i, j));
        end
    end
end

% Function to calculate cofactor matrix
function cofactor_matrix = cofactor(matrix)
    cofactor_matrix = minors(matrix);
    [row, column] = size(cofactor_matrix);
    for i = 1:row
        for j = 1:column
            cofactor_matrix(i, j) = (-1)^(i+j) * cofactor_matrix(i, j);
        end
    end
end

% Calculate determinant
det_value = determinant(matrix);

% Check if matrix is singular
if det_value == 0
    disp("The matrix is singular, it does not have an inverse.");
    return;
end

% Calculate adjugate matrix
adjugate_matrix = cofactor(matrix)';

% Calculate inverse matrix
inverse_matrix = adjugate_matrix / det_value;

% Display step-by-step calculations
disp("Step-by-step calculations:");
disp("1. Calculate minors matrix:");
disp(minors(matrix));
disp("2. Calculate cofactor matrix:");
disp(cofactor(matrix));
disp("3. Calculate adjugate matrix (transpose of the cofactor matrix):");
disp(adjugate_matrix);
disp("4. Calculate determinant:");
disp(["Determinant = ", num2str(det_value)]);
disp("5. Calculate inverse matrix:");
disp(inverse_matrix);

% Display inverse matrix
disp("The inverse matrix is:");
disp(inverse_matrix);

