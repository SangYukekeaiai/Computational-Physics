
3¡¢²úÉúÊ±¿Õ»ìãç
clear all;clc;
a=0.84;
b=0.07;
global m n y
m=600;
n=600;
y=zeros(m,n);
ep=0.10;%¦Å
u=zeros(m,n);
v=zeros(m,n);
dt=0.05;
N=1000000;
h=0.5;
t=0;
%ÂİĞı²¨³õÌõ¼ş
u(1:300,298:302)=1;
v(1:300,294:298)=1;
for i=1:N
    t=t+dt;
    u=u+dt.*(-1/ep.*u.*(u-1).*(u-(v+b)./a)+f1(u)/h^2);
    v=v+dt.*(f2(u)-v);
    imshow(u);
end
function y=f1(u)
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
function y=f2(u)
global m n
for i=1:m
    for j=1:n
        if u(i,j)>=0 && u(i,j)<1/3
            y(i,j)=0;
        elseif u(i,j)>=1/3 && u(i,j)<=1
            y(i,j)=1-6.75*u(i,j)*(u(i,j)-1)^2;
        elseif u(i,j)>1
            y(i,j)=1;
        end
    end
end
end