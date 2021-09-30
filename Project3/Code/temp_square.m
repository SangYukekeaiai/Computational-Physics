clc;clear all;
global e1 V0;
tol = 1e-6; de = 0.0001; e1 = -0.7879; V0 = 0;

xturn = -sqrt(2*(e1+1));
n1 = 10001;
n2 = 10001;
x1 = linspace(1,xturn,n1);
x2 = linspace(-1,xturn,n2);
u1(1) = 0;
u1(2) = 0.0001;
u2(1) = 0;
u2(2) = 0.0001;
Q1 = zeros(1,n1);
Q2 = zeros(1,n2);
S1 = ones(1,n1).*(e1-x1.^2./2+1);
S2 = ones(1,n2).*(e1-x2.^2./2+1);
h1 = x1(2)-x1(1);
h2 = x2(2)-x2(1);
u1 = numerove(n1,h1,S1,Q1,u1);%从右往左积分
u2 = numerove(n2,h2,S2,Q2,u2);%从左往右积分
%temp1 = u2(n2);%归一化第一步
%u2(:) = u1(n1)./temp1.*u2(:);%归一化第二步
f0 = (u1(n1)-u1(n1-1))./h1-(u2(n2)-u2(n2-1))./h2;%判断斜率是否相等
istep = 0;
while (abs(de)>tol)
    e1 = e1 +de;
    xturn =  -sqrt(2*(e1+1));
    x1 = linspace(1,xturn,n1);
    x2 = linspace(-1,xturn,n1);
    h1 = x1(2)-x1(1);
    h2 = x2(2)-x2(1);
    Q1 = zeros(1,n1);
    Q2 = zeros(1,n2);
    S1 = ones(1,n1).*(e1-x1.^2./2+1);
    S2 = ones(1,n2).*(e1-x2.^2./2+1);
    u1 = zeros(1, n1); u2 = zeros(1, n2);
    u1(1) = 0;
    u1(2) = 0.0001;
    u2(1) = 0;
    u2(2) = 0.0001;
    %xturn = V0;
    u1 = numerove(n1,h1,S1,Q1,u1);%从右往左积分
    u2 = numerove(n2,h2,S2,Q2,u2);%从左往右积分
    %temp2 = u2(n2);%归一化第一步
    %u2(:) = u1(n1)./temp2.*u2(:);%归一化第二步
    f1 = (u1(n1)-u1(n1-1))./h1-(u2(n2)-u2(n2-1))./h2;
    if (f0.*f1<0)
        e1 = e1-de;
        de = de./2;
    end
    istep = istep + 1;
    %plot(x1,u1(:),x2,u2(:));pause;
end
e1


plot(x1,u1(:),x2,u2(:))