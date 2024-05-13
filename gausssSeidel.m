clear; clc; close all;
format short g

x2 = 0;
x3 = 0;

nn = 30 ;

xx1 = zeros(nn, 1);
xx2 = zeros(nn, 1);
xx3 = zeros(nn,1);

for i = 1:nn
    % Updating values using Gauss-Seidel method
    xx1(i+1) = (xx2(i))/5 - 2*(xx3(i))/5 + 12/5;
    xx2(i+1) = -3*(xx1(i+1))/8 + 2*(xx3(i))/8 - 25/8;
    xx3(i+1) = -(xx1(i+1))/4 - (xx2(i+1))/4 + 6/4;
end

XXX=[xx1,xx2,xx3];
disp(['     x1 Sol','     x2 Sol','    x3 Sol',])
disp(XXX)