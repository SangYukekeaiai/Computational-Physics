clear all;clc;
x = 0.9; a = 0:0.0001:4; y = 0; N = 300;
for j = 1:N
    x = a.*x.*(1-x);
    df = log(abs(-2.*a.*x+a));
    y = y + df;
end
plot(a,y/N)
line([0,4],[0,0])