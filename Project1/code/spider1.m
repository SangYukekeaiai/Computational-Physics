clear all;clc;
format long;
x1 = [];a = 0.500;
x = 0:0.001:1;
y =a.*x.*(1-x);
plot(x,x);
hold on;
plot(x,y,'r');
hold on;

for i = 1:100
    hold on;
    x1(1) = 0.5;
    x1(i+1) =a.*x1(i).*(1-x1(i));
    plot([x1(i),x1(i)],[x1(i),x1(i+1)]);
    hold on;
    plot([x1(i),x1(i+1)],[x1(i+1),x1(i+1)]);
    hold on;
end
