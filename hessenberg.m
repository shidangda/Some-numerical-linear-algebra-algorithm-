function [H,Q]=hessenberg(A)
%ÉÏhessenberg»¯º¯Êı
n=size(A,1);
I=eye(n);
for k=1:n-2
    [v,beta]=house(A(k+1:n,k));
    w=beta*A(k+1:n,k:n)'*v;
    A(k+1:n,k:n)=A(k+1:n,k:n)-v*w';
    w=beta*A(1:n,k+1:n)*v;
    w0=beta*I(1:n,k+1:n)*v;
    A(1:n,k+1:n)=A(1:n,k+1:n)-w*v';
    I(1:n,k+1:n)=I(1:n,k+1:n)-w0*v';
end
H=A;
Q=I;
end