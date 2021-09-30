%f(u)º¯Êı
function y=f2(u)
global n1 n2
for i=1:n1
    for j=1:n2
        if u(i,j)>=0 && u(i,j)<1/3
            y(i,j)=0;
        elseif u(i,j)>=1/3 && u(i,j)<=1
            y(i,j)=1-6.75*u(i,j)*(u(i,j)-1)^2;
        elseif u(i,j)>1
            y(i,j)=1;
        end
    end
end
