clc;clear all;



gNa=120;gK=36;gL=0.3;

ENa=55;EK=-72;EL=-50;

C=1;I=10;



am=@(V) -0.1.*(35+V)./(exp(-0.1.*(35+V))-1);

bm=@(V) 4.*exp(-(60+V)./18);



ah=@(V) 0.07.*exp(-(60+V)./20);

bh=@(V) 1./(exp(-(30+V)./10)+1);



an=@(V) 0.01.*(-(50+V))./(exp(-0.1.*(50+V))-1);

bn=@(V) 0.125.*exp(-(60+V)./80);



fV=@(t,V,m,h,n) -gNa.*m.^3.*h.*(V-ENa)/C;

fm=@(t,V,m,h,n) am(V).*(1-m)-bm(V).*m;

fh=@(t,V,m,h,n) ah(V).*(1-h)-bh(V).*h;

fn=@(t,V,m,h,n) an(V).*(1-n)-bn(V).*n;



t=linspace(0.0001,10,100);

j=t(2)-t(1);%²½³¤

d=length(t);

V(1)=-70;

m(1)=0.1;

h(1)=0.1;

n(1)=0.1;



for i=1:1:d-1

    k1=fV(t(i),V(i),m(i),h(i),n(i));

    l1=fm(t(i),V(i),m(i),h(i),n(i));

    p1=fh(t(i),V(i),m(i),h(i),n(i));

    z1=fn(t(i),V(i),m(i),h(i),n(i));



    k2=fV(t(i)+0.5.*j,V(i)+0.5.*j.*k1,m(i)+0.5.*j.*l1,h(i)+0.5.*j.*p1,n(i)+0.5.*j.*z1);

    l2=fm(t(i)+0.5.*j,V(i)+0.5.*j.*k1,m(i)+0.5.*j.*l1,h(i)+0.5.*j.*p1,n(i)+0.5.*j.*z1);

    p2=fh(t(i)+0.5.*j,V(i)+0.5.*j.*k1,m(i)+0.5.*j.*l1,h(i)+0.5.*j.*p1,n(i)+0.5.*j.*z1);

    z2=fn(t(i)+0.5.*j,V(i)+0.5.*j.*k1,m(i)+0.5.*j.*l1,h(i)+0.5.*j.*p1,n(i)+0.5.*j.*z1);



    k3=fV(t(i)+0.5.*j,V(i)+0.5.*j.*k2,m(i)+0.5.*j.*l2,h(i)+0.5.*j.*p2,n(i)+0.5.*j.*z2);

    l3=fm(t(i)+0.5.*j,V(i)+0.5.*j.*k2,m(i)+0.5.*j.*l2,h(i)+0.5.*j.*p2,n(i)+0.5.*j.*z2);

    p3=fh(t(i)+0.5.*j,V(i)+0.5.*j.*k2,m(i)+0.5.*j.*l2,h(i)+0.5.*j.*p2,n(i)+0.5.*j.*z2);

    z3=fn(t(i)+0.5.*j,V(i)+0.5.*j.*k2,m(i)+0.5.*j.*l2,h(i)+0.5.*j.*p2,n(i)+0.5.*j.*z2);



    k4=fV(t(i)+j,V(i)+j.*k3,m(i)+j.*l3,h(i)+j.*l3,n(i)+j.*z3);

    l4=fm(t(i)+j,V(i)+j.*k3,m(i)+j.*l3,h(i)+j.*l3,n(i)+j.*z3);

    p4=fh(t(i)+j,V(i)+j.*k3,m(i)+j.*l3,h(i)+j.*l3,n(i)+j.*z3);

    z4=fn(t(i)+j,V(i)+j.*k3,m(i)+j.*l3,h(i)+j.*l3,n(i)+j.*z3);



    V(i+1)=V(i)+j.*(k1+2.*k2+2.*k3+k4)./6;

    m(i+1)=m(i)+j.*(l1+2.*l2+2.*l3+l4)./6;

    h(i+1)=h(i)+j.*(p1+2.*p2+2.*p3+p4)./6;

    n(i+1)=n(i)+j.*(z1+2.*z2+2.*z3+z4)./6;

end



plot(t,V)

