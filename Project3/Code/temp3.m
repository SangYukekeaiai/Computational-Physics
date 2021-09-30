clear all;clc;
n = 21;
h = 1/(n-1);
H = zeros(n,n);
for i = 2:n-1
    for j = 1:n
        if(i==j)
            H(i,j) = -2;
            H(i-1,j) = 1;
            H(i+1,j) = 1;
        end
    end
end
H(1,1) = -2;
H(n,n) = -2;
H(2,1) = 1;
H(n-1,n) = 1;

H = H*(-1/h^2);


for i = 1:n
    sum1 = 0;
    for j = 1:n
        if(i ~= j)
            sum1 = sum1+H(i,j);
        end
    end
    difference(i) = H(i,i)-sum1;
    sum2(i) = H(i,i)+sum1;
end

lambda_min = min(difference);
lambda_max = min(sum2);
dlam = (lambda_max - lambda_min)./(10.*n);
dlam0 = dlam;
lambda = linspace(lambda_min-0.1.*dlam,lambda_max+0.1.*dlam,n);

for i = 1:n
    Pold = value_P(lambda(i),n,H);
    while(abs(dlam)>0.00000001)
        lambda(i) = lambda(i) + dlam;
        if(Pold.*value_P(lambda(i),n,H)<0)
            lambda(i) = lambda(i)-dlam;
            dlam = dlam./2;
        end
    end
    lambda(i);
    dlam = dlam0;
end
lambda
