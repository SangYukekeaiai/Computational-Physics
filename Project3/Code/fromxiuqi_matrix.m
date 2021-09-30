clear all;clc;
p=-1:0.01:1;
h=p(2)-p(1);
n=length(p);
m=5*n;
H=zeros(n,n);
U=(p.^2-1);
t=1;
for i=1:n-1
    H(i,i)=2*t+U(i);
    H(i,i+1)=-t;
    H(i+1,i)=-t;
end
H(n,n)=2*t+U(length(p));
%[w,v]=eig(H);
s=linspace(-1,4,m);
lambda=zeros(m,1);
lam1=zeros(n,1);
xl=zeros(n,m);
xt=zeros(n,n);
k=2;%������
%��H������ֵ�뱾������
for i=1:m
    Hs=H-s(i).*eye(n);
    x=rand(n,1);
    for j=1:1000
        u=x/NOrm(x,2);
        x=Hs\u;
        lambda(i)=u'*x;
    end
    lambda(i)=1/lambda(i)+s(i);
    xl(:,i)=x;
end
lam1(1,1)=lambda(1,1);%��һ��ֵû���ظ����ܣ�ֱ�Ӹ���
xt(:,1)=xl(:,1);
for i=2:m
 if(lambda(i,1)-lambda(i-1,1)>1e-3)
        lam1(k)=lambda(i);%��¼n������ֵ
        xt(:,k)=xl(:,i);%��¼n����������
        k=k+1;
    else
 end
end
for k=1:6
subplot(2,3,k)
plot(p,xt(:,k),'r');
xlabel('x');ylabel('��');
legend(['E=',num2str(lam1(k))]);
end