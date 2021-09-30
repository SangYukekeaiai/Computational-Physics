function dydx = test3(x,y)
global e1
dydx = [y(2);50^2.*(-e1+x^2./2-1)*y(1)];