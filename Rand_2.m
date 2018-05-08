clear
clc
n=6;
A=round(10*rand(n))
A0=A;
for k=1:n-1
    [c,p]=max(abs(A(k:n,k)));
    p=p+k-1;
    t=A(k,1:n);
    A(k,1:n)=A(p,1:n);
    A(p,1:n)=t;
    u(k)=p;
    if A(k,k)~=0
        A(k+1:n,k)=A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
    else
        stop
    end
end
L=eye(6);
for k=1:n
    for j=1:n
        if k<=j
           U(k,j)=A(k,j);
        else
            L(k,j)=A(k,j);
        end
    end
end
L
U
L*U
p=eye(n)
for k=1:n-1
    t=p(k,1:n);
    p(k,1:n)=p(u(k),1:n);
    p(u(k),1:n)=t;
end
p*A0

    
    
    
    
    
    