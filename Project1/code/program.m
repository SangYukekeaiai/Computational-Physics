clear all;clc;
a=[0.500 2.000 3.225 3.500 3.550 3.800];
tic
for j = 1:1:6;
for i=1:1:509
    x(1) = 0.9 ;
    x(i+1) = a(j).*x(i).*(1-x(i));
end
k = 450:1:510;
figure(j);
plot(k,x(k));
end
toc

