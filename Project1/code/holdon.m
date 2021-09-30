clear all;clc;
a=3.8;
for j = 1:1:9
for i=1:1:509
    x(1) = 0.5+0.01.*j;
    x(i+1) = a.*x(i).*(1-x(i));
end
k = 450:1:510;
%figure(j);
plot(k,x(k),'DisplayName','');
hold on
end
legend('x1=0.51','x1=0.52','x1=0.53','x1=0.54','x1=0.55','x1=0.56','x1=0.57','x1=0.58','x1=0.59');

