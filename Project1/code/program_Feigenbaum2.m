clear all;clc;
a = 0:0.000001:4;
x = 0.5;
tic
for j = 1:450
    x = a.*x.*(1-x);
end
for i = 1:100
    x = a.*x.*(1-x);
    plot(a,x,'b.','MarkerSize',0.001)
    hold on;
end
toc