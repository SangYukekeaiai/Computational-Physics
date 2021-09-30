clc;clear all;
global e1 V0;
tol = 1e-6; de = 0.0001; e1 = -2324; V0 = 0;
h = 0.0001;
n1 = length(-1:h:1);
x1 = -1:h:1;
u1(1) = 0;
u1(2) = 0.0001;
Q1 = zeros(1,n1);
S1 = ones(1,n1).*(e1-50.^2.*(x1.^2./2-1));
u1 = numerove(n1,h,S1,Q1,u1);%从右往左积分
f0 = u1(n1)-0;
istep = 0;
while (abs(de)>tol)
    e1 = e1 +de;
    Q1 = zeros(1,n1);
    S1 = ones(1,n1).*(e1-50.^2.*(x1.^2./2-1));
    u1 = numerove(n1,h,S1,Q1,u1);%从右往左积分
    f1 = u1(n1) - 0;
    if (f0.*f1<=0)
        e1 = e1-de;
        de = de./2;
    end
    istep = istep + 1;
    if (istep >= 187)
        
    end
    %plot(x1,u1),pause(0.05);
end
sum = 0;
for i = 1: length(x1)-1
    sum = (0.5.*(u1(i)+u1(i+1))).^2.*h+sum;
end
for i = 1:length(x1)
    u1(i) = u1(i)./sum.^(1/2);
end
e1


plot(x1,u1)
%axis([-1 1 -inf inf])