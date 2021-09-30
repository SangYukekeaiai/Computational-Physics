clear all;clc;
N=1001;
h=2./(N-1);
dt=0.00001;
P=dt/(h^2);
Tspan=20000;
v(1) = 0;
v(N) = 0;
x = -1:h:1;
phi=zeros(N,Tspan);
for i=2:N-1
    v(i) = -2500.*(0.5*x(i).^2-1);
    phi(i,1) = (x(i)+1).*(1-x(i));
end
phi([1,end],:) = 0.0;
a = zeros(1,N-2) - P; a(1) = 0.0;
c = zeros(1,N-2) - P; c(end) = 0.0;
b = zeros(1,N-2) + 1.0 + 2*P - dt.*v(2:1:(N-1));
for i=1:Tspan-1
    phi(2:1:(N-1), i+1) = chase(a, b, c, phi(2:1:(N-1), i));
   % sum_of_square = sum(phi(:,i+1).^2.0)*h;
   % phi(:,i+1) = phi(:,i+1)./sqrt(sum_of_square);
    phi(:,i)=nor(phi(:,i+1),h);
    E = 0;
    for k = 2:N
        E = E+(phi(k,i)-phi(k-1,i)).^2;
    end
    E = 0;
    for k = 2:N
        E = E+0.5.*(phi(k,i)-phi(k-1,i)).^2./h+h.*v(k).*phi(k,i).^2;
    end
    energy_value_num(i) = E;
end
plot(x,phi(:,Tspan));
