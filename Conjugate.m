%共轭梯度法求方程的解
clear;
clc;
x=[1;1;1;1;1];
b=[12;-27;14;-17;12];
A=[10,1,2,3,4;1,9,-1,2,-3;2,-1,7,3,-5;3,2,3,12,-1;4,-3,-5,-1,15];
r=b-A*x;
k=0;
while r~=0
    k=k+1;
    if k==1
        p=r;
    else
        beta=r'*r/(t'*t);
        p=r+beta*p;
    end
    alpha=r'*r/(p'*A*p);
    x=x+alpha*p;
    t=r;
    r=r-alpha*A*p;
end
x
k

