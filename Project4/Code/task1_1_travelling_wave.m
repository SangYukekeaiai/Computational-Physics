clear all;clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%参数数值%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global n1 n2 la a b ep
a=0.84;
b=0.07;
n1=800;%x格点数
n2=800;%y格点数
ep=0.04;
la=zeros(n1,n2);%拉普拉斯算符对u作用后的离散值
u=zeros(n1,n2);%u函数离散值（初始）
v=zeros(n1,n2);%v函数离散值（初始）
t=0;%时间初始值
dt=0.05;%时间间隔
N=60000;%时间点数
h=0.5;%相邻格点间隔

%%%%%%%%%%%%%%%%%%%循环遍历求得u的数值解并画图%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:N%时间循环步进
    t=t+dt;
    u=u+dt.*(f1(u,v)+laplace(u)/h^2);
    v=v+dt.*(f2(u)-v);
    if mod(t,4)>1
        u(:,1)=1;
    else
        u(:,1)=0;
    end
    %imagesc(u);
    imshow(u);
end







