H=[1,1,1,1;0,1,1,1;0,1,1,1;0,1,1,1];
n=size(H,1);
for j=2:n
    if abs(H(j,j-1))<=(abs(H(j,j))+abs(H(j-1,j-1)))
        H(j,j-1)=0;
    end
end
for j=n:-1:2
    if H(j,j-1)~=0
        if H(j-1,j-2)~=0
            m=n-j;
            for j=j-2:-1:2
                if H(j,j-1)==0
                    l=n-j+1;
                    break;
                end
            end
            break;
        end
    end
end
