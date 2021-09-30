%%%%%%%%%%%%%%%%%%%%%扩散方程的非齐次项%%%%%%%%%%%%%%%%%%%%
function y = f1(u,v)
global a b ep
y = -1/ep.*u.*(u-1).*(u-(v+b)./a);
end