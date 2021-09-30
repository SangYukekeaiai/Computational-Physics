clc;clear all;
global e1;
tol = 1e-6; de = 0.0001; e1 = -2324;
xturn = 0;
%xturn = -sqrt(2*(e1+1));
[x1,ul] = ode45(@test,[-1,xturn],[0 0.0001]);%从左往右积分
[x2,ur] = ode45(@test,[1,xturn],[0 0.0001]);%从右往左积分
temp1 = ur(length(ur),1);%归一化第一步
ur(:,:) = ul(length(ul),1)./temp1.*ur(:,:);%归一化第二步
f0 = ul(length(x1),2)-ur(length(x2),2);%判断斜率是否相等
while (abs(de)>tol)
    e1 = e1 +de;
    xturn = -sqrt(abs(2*(e1/2500+1)));
    [x1,ul] = ode45(@test,[-1,xturn],[0 0.0001]);
    [x2,ur] = ode45(@test,[1,xturn],[0 0.0001]);
    temp2 = ur(length(ur),1);%归一化第一步
    ur(:,:) = ul(length(x1),1)./temp2.*ur(:,:);%归一化第二步
    f1 = ul(length(x1),2)-ur(length(x2),2);
    if (f0.*f1<0||f0.*f1==0)
        e1 = e1-de;
        de = de./2;
    end
end
for k = 1:length(x2)
    ur_fixed(k,:) = ur(length(x2)-k+1,:);
    x2_fixed(k) = x2(length(x2)-k+1);
end
u_tot = [ul(:,1);ur_fixed(:,1)];
x_tot = [x1 ; x2_fixed'];

sum = 0;
for s = 1:length(x_tot)-1
    h(s) = x_tot(s+1)-x_tot(s);
    sum = (0.5.*(u_tot(s)+u_tot(s+1))).^2.*h(s)+sum;
end
for r = 1:length(x_tot)
    u_tot(r) = u_tot(r)./sum.^(1/2);
end

e1
%x1(length(ul))
%x2(length(ur))

plot(x1,ul(:,1),x2,ur(:,1));
figure
plot(x_tot,u_tot);