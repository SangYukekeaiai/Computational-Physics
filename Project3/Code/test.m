function dydx = test(x,y)
global e1
dydx = [y(2);(-e1+50^2.*(x^2./2-1))*y(1)];