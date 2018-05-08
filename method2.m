%最速下降法求方程的解
A=[10,1,2,3,4;1,9,-1,2,-3;2,-1,7,3,-5;3,2,3,12,-1;4,-3,-5,-1,15];
n=size(A,1);
for k=1:n-1
    L(k+1:n,k)=-A(k+1:n,k);
    U(1:k,k+1)=A(1:k,k+1);
end
L(n,n)=0;
U(n,n)=0;
D1=1./diag(A);
b=[12;-27;14;-17;12];
B=diag(D1)*(L+U); 
g=diag(D1)*b;
x=ones(5,1);
for k=1:1000  
    x=B*x+g;      %不能用x(0)存储一个向量
end
x

t=inv(diag(diag(A))-L);
M=t*U;
g=t*b;
x=ones(5,1);
for k=1:1000
    x=M*x+g;
end
x





    