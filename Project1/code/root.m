clc;clear all;
a = 3.500;
sym x;
x = 0:0.0001:1;
y = a.*(a.*(a.*x.*(1-x)).*(1-a.*x.*(1-x))).*(1-(a.*(a.*x.*(1-x)).*(1-a.*x.*(1-x))))-x;

plot(x,y)
grid on;
%axis([0 1 0 1])
