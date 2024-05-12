clear; clc; close all;
format short g
x1 = 0;
x2 = 0;
x3 = 0;

nn = 30 ;

xx1 = zeros(nn, 1);
xx2 = zeros(nn, 1);
xx3 = zeros(nn,1);

err1 = zeros(nn, 1);
err2 = zeros(nn, 1);
err3 = zeros(nn,1);

tol=1e-6;
% X(K)=JX(K)+C
for i = 1:nn
    if i ==1
        xx1(i)=x1;
        xx2(i)=x2;
        xx3(i)=x3;
        
        err1(i)=2e1;
        err2(i)=2e1;
        err3(i)=2e1;
    else
       % Storing previous values before updating
        x1_old = xx1(i);
        x2_old = xx2(i);
        x3_old = xx3(i);
        
        % Updating values using Gauss-Seidel method
        xx1(i) = (x2_old)/5 - 2*(x3_old)/5 + 12/5;
        xx2(i) = -3*(xx1(i))/8 + 2*(x3_old)/8 - 25/8;
        xx3(i) = -(xx1(i))/4 - (xx2(i))/4 + 6/4;
        
        % Calculating errors
        err1(i)=abs(xx1(i)-x1_old);
        err2(i)=abs(xx2(i)-x2_old);
        err3(i)=abs(xx3(i)-x3_old);
        
        % Checking convergence
        if err1(i)<tol && err2(i)<tol && err3(i)<tol
            break;
        end
    end
end
XXX=[xx1,err1,xx2,err2,xx3,err3];
disp(['    x1 Sol','    x1 Errors','    x2 Sol','    x2 Errors','    x3 Sol','    x1 Errors'])
disp(XXX)