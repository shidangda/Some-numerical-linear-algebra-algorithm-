function [lambda,Q]=QR(A,u)
%lambdaΪ�������ֵ������
%Q����������Ϊ��Ӧ����ֵ����������
%uΪ��������
[H,Q]=hessenberg(A);%��A��hessenberg��
n=size(A,1);
m=0;
while m==n
for i=2:n
    if abs(H(i,i-1))<=(abs(H(i,i))+abs(H(i-1,i-1)))*u
        H(i,i-1)=0;
    end
end %��H��Ӧ��Ԫ������
flag=0 %���ñ��ֵ��ʹbreak��������ѭ��
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
end %����ѭ����ȷ��m��l
if m==n
    break;
end
[H(l+1:n-l-m,l+1:n-l-m),P]=QRiteration(H(l+1:n-l-m,l+1:n-l-m));%����QR����������������H_22��P
Q=Q*diag(eye(l),P,eye(m));
H(1:l,l+1:n-m)=H(1:l,l+1:n-m)*P;
H(l+1:n-m,n-m+1:n)=p'*H(l+1:n-m,n-m+1:n);
end
end
     

            
            