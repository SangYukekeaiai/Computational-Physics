function Pn = value_P(lambda,n,A)
P(1) = A(1,1)-lambda;
P(2) = (A(2,2)-lambda).*P(1) - A(1,2).^2;
for i = 3:n
    P(i) = (A(i,i)-lambda).*P(i-1)-A(i,i-1).^2.*P(i-2);
end
Pn = P(n) ;
%P(3) = (A(3,3)-lambda).*P(2)-A(3,2).^2.*P(1);
%Pn = P(3);
