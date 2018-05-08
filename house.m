% house
%输入向量x为列向量，输出向量v为列向量
function [v,beta] = house(x)
n = length(x);
Ita = norm(x,inf);
x = x/Ita;
sigma = x(2:n)'*x(2:n);
t(2:n) = x(2:n);
if sigma == 0
    beta = 0;
else
    alpha = sqrt((x(1))^2+sigma);
    if x(1) <= 0
        t(1) = x(1) - sigma;
    else
        t(1)=-sigma/(x(1) + alpha);
    end
    beta = 2*(t(1))^2/(sigma+(t(1))^2);
    v = t'/t(1);
end