clc;
clear all;
global e1 V0;
tol = 1e-6; de = 0.0001; e1 = 22.1; V0 = 0;

[x1,ul] = ode45(@test2,[-1,1],[0 0.0001]);%从左往右积分
f0 = ul(length(x1),1)-0;%判断斜率是否相等
while (abs(de)>tol)
    e1 = e1 +de;
    [x1,ul] = ode45(@test2,[-1,1],[0 0.0001]);
    f1 = ul(length(x1),1)-0;
    if (f0*f1<=0)
        e1 = e1-de;
        de = de./2;
    end
end
sum = 0;
for i = 1: length(x1)-1
    h = x1(i+1)-x1(i);
    sum = (0.5.*(ul(i)+ul(i+1))).^2.*h+sum;
end
for i = 1:length(x1)
    ul(i) = ul(i)./sum.^(1/2);
end
e1


plot(x1,ul(:,1))
axis([-1 1 -inf inf])