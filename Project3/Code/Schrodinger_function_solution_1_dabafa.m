clc;clear all;

global e1;
eold=-0.99;olddpsi=0.5;tol=1e-6;  %-0.99;;-0.95;-0.89
de=2*tol;e1=eold

 while abs(de)>tol
     xturn=-sqrt(2*(e1+1))
     [x1,u1]=ode45(@wlch5fun,[-1, xturn],[0 0.0001]);
     [x2,u2]=ode45(@wlch5fun,[1 xturn],[0 -0.0001]);
     dpsi=u1(length(x1),2)-u2(length(x2),2);
     de=-dpsi*de/(dpsi-olddpsi);
     olddpsi=dpsi;eold=e1;e1=e1+de;
 end   
e1
plot(x1,u1(:,1),x2,u2(:,1))