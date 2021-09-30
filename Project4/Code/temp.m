clear all;clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������ֵ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global n1 n2 la a b ep
a=0.84;
b=0.07;
n1=800;%x�����
n2=800;%y�����
ep=0.08;
la=zeros(n1,n2);%������˹�����u���ú����ɢֵ
u=zeros(n1,n2);%u������ɢֵ����ʼ��
v=zeros(n1,n2);%v������ɢֵ����ʼ��
t=0;%ʱ���ʼֵ
dt=0.05;%ʱ����
N=60000;%ʱ�����
h=0.5;%���ڸ����

%%%%%%%%%%%%%%%%%%%ѭ���������u����ֵ�Ⲣ��ͼ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:N%ʱ��ѭ������
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
figure