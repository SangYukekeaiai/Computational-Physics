function y=f11(u)
global m n
for i=2:m-1
    for j=2:n-1
        y(i,j)=u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j-1)-4*u(i,j);
    end
end
for j=2:n-1
    y(1,j)=u(1,j-1)+u(1,j+1)+2*u(2,j)-4*u(1,j);
    y(m,j)=u(m,j-1)+u(m,j+1)+2*u(m-1,j)-4*u(m,j);
end
for i=2:m-1
    y(i,1)=u(i-1,1)+u(i+1,1)+2*u(i,2)-4*u(i,1);
    y(i,n)=u(i-1,n)+u(i+1,n)+2*u(i,n-1)-4*u(i,n);
end
y(1,1)=2*u(1,2)+2*u(2,1)-4*u(1,1);
y(1,n)=2*u(1,n-1)+2*u(2,n)-4*u(1,n);
y(m,1)=2*u(m,2)+2*u(m-1,1)-4*u(m,n);
y(m,n)=2*u(m,n-1)+2*u(m-1,n)-4*u(m,n);
end