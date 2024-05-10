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
% X(K)=JX(K-1)+C
for i = 1:nn
    if i ==1
        xx1(i)=x1;
        xx2(i)=x2;
        xx3(i)=x3;
        
        err1(i)=2e1;
        err2(i)=2e1;
        err3(i)=2e1;
    else 
      xx1(i) = -6*xx2(i-1)/27 + xx3(i-1)/27 + 85/27;
      xx2(i)= -6*xx1(i-1)/15 - 2*xx3(i-1)/15 + 72/15;
      xx3(i) = -xx1(i-1)/54 - xx2(i-1)/54 + 110/54;
      
      err1(i)=abs(xx1(i)-xx1(i-1));
      err2(i)=abs(xx2(i)-xx2(i-1));
      err3(i)=abs(xx3(i)-xx3(i-1));
    end
end
XXX=[xx1,err1,xx2,err2,xx3,err3];
disp(['    x1 Sol','    x1 Errors','    x2 Sol','    x2 Errors','    x3 Sol','    x1 Errors'])
disp(XXX)