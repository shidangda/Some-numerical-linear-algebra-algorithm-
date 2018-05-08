function [lambda,Q]=QR(A,u)
%lambda为存放特征值的向量
%Q的列向量即为相应特征值的特征向量
%u为机器精度
[H,Q]=hessenberg(A);%对A上hessenberg化
n=size(A,1);
m=0;
while m==n
for i=2:n
    if abs(H(i,i-1))<=(abs(H(i,i))+abs(H(i-1,i-1)))*u
        H(i,i-1)=0;
    end
end %把H相应的元素置零
flag=0 %设置标记值，使break跳出二重循环
for i=n:-1:2
    if H(i,i-1)~=0
        if H(i-1,i-2)~=0
            m=n-i;
            for i=i-2:-1:2
                if H(i,i-1)==0
                    l=i-1;
                    flag=1
                    break;
                end
            end
            if flag==1
                break;
            end
        end
    end
end %二重循环以确定m和l
if m==n
    break;
end
[H(l+1:n-l-m,l+1:n-l-m),P]=QRiteration(H(l+1:n-l-m,l+1:n-l-m));%进行QR迭代，并算迭代后出H_22和P
Q=Q*diag(eye(l),P,eye(m));
H(1:l,l+1:n-m)=H(1:l,l+1:n-m)*P;
H(l+1:n-m,n-m+1:n)=p'*H(l+1:n-m,n-m+1:n);
end
end
     

            
            