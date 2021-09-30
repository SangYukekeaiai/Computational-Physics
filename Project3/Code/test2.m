function dydx = test2(x,y)
global e1 V0
dydx = [y(2);(-e1+V0)*y(1)];