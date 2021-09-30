clear all
clc
syms y(x) a
ode = diff(y,x,2) == (x^2-1-a)*y;
ySol(x) = dsolve(ode)
ySol = simplify(ySol)