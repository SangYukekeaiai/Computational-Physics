clc, clear;
x = 0.6;
i  =  1;
for a=0:0.00001:4
    x = a*x*(1-x);
        y(i) = x;
        i = i+1;
end
plot(0:0.00001:4,y,'.');
