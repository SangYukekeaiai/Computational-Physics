u = 2.6:0.001:4;
x = 0.6;
for j = 1:150
    x = u.*(x-x.^2);
end
for i = 1:100
    x = u.*(x-x.^2);
    plot(u,x,'r.')
    hold on;
end