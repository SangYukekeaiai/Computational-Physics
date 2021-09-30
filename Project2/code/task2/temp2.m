clear all;clc;
global gK gNa gL VK VNa VL I C count
gNa = 120; gK = 36; gL = 0.3;
VNa = 55; VK = -72; VL = -50;
C = 1; 
%I = 0;
%sz = [11]%设一个大小为1*11的矩阵
count = zeros([1 101]);%计算周期数
f = zeros([1 101]);%频率数
am = @(V) -0.1.*(35+V)./(exp(-0.1.*(35+V))-1);
bm = @(V) 4.*exp(-(60+V)./18);

ah = @(V) 0.07.*exp(-(60+V)./20);
bh = @(V) 1./(exp(-(30+V)./10)+1);

an = @(V) 0.01.*(-(50+V))./(exp(-0.1.*(50+V))-1);
bn = @(V) 0.125.*exp(-(60+V)./80);

%fu = @(V,h,m,n,t) (-gL.*(V-VL)-gNa.*m.^3.*h.*(V-VNa)-gK.*n.^4.*(V-VK)+I(j))./C;
fm = @(V,h,m,n,t) am(V).*(1-m)-bm(V).*m;
fh = @(V,h,m,n,t) ah(V).*(1-h)-bh(V).*h;
fn = @(V,h,m,n,t) an(V).*(1-n)-bn(V).*n;

V(1)=-70;%电压初始值
n(1) = 0.1;m(1) = 0.1;h(1) = 0.1;%h,m,n初始值
t = linspace(0,1000,100001);%时间间隔取为0-1000秒之间的100000段
s = length(t);%t格点数
l = t(2)-t(1);%两时间点之间的时间间距
%四阶荣根库塔算法



for j = 1:1:101
    I(j)= j-1;
   for i = 1:1:s-1
        fu = @(V,h,m,n,t) (-gL.*(V-VL)-gNa.*m.^3.*h.*(V-VNa)-gK.*n.^4.*(V-VK)+I(j))./C;
        k(1,1) = l.*fh(V(i),h(i),m(i),n(i),t(i));
        k(2,1) = l.*fm(V(i),h(i),m(i),n(i),t(i));
        k(3,1) = l.*fn(V(i),h(i),m(i),n(i),t(i));
        k(4,1) = l.*fu(V(i),h(i),m(i),n(i),t(i));
        k(1,2) = l.*fh(V(i)+1/2.*k(4,1),h(i)+1/2.*k(1,1),m(i)+1/2.*k(2,1),n(i)+1/2.*k(3,1),t(i)+l);
        k(2,2) = l.*fm(V(i)+1/2.*k(4,1),h(i)+1/2.*k(1,1),m(i)+1/2.*k(2,1),n(i)+1/2.*k(3,1),t(i)+l);
        k(3,2) = l.*fn(V(i)+1/2.*k(4,1),h(i)+1/2.*k(1,1),m(i)+1/2.*k(2,1),n(i)+1/2.*k(3,1),t(i)+l);
        k(4,2) = l.*fu(V(i)+1/2.*k(4,1),h(i)+1/2.*k(1,1),m(i)+1/2.*k(2,1),n(i)+1/2.*k(3,1),t(i)+l);
        k(1,3) = l.*fh(V(i)+1/2.*k(4,2),h(i)+1/2.*k(1,2),m(i)+1/2.*k(2,2),n(i)+1/2.*k(3,2),t(i)+l/2);
        k(2,3) = l.*fm(V(i)+1/2.*k(4,2),h(i)+1/2.*k(1,2),m(i)+1/2.*k(2,2),n(i)+1/2.*k(3,2),t(i)+l/2);
        k(3,3) = l.*fn(V(i)+1/2.*k(4,2),h(i)+1/2.*k(1,2),m(i)+1/2.*k(2,2),n(i)+1/2.*k(3,2),t(i)+l/2);
        k(4,3) = l.*fu(V(i)+1/2.*k(4,2),h(i)+1/2.*k(1,2),m(i)+1/2.*k(2,2),n(i)+1/2.*k(3,2),t(i)+l/2);
        k(1,4) = l.*fh(V(i)+k(4,3),h(i)+k(1,3),m(i)+k(2,3),n(i)+k(3,3),t(i)+l);
        k(2,4) = l.*fm(V(i)+k(4,3),h(i)+k(1,3),m(i)+k(2,3),n(i)+k(3,3),t(i)+l);
        k(3,4) = l.*fn(V(i)+k(4,3),h(i)+k(1,3),m(i)+k(2,3),n(i)+k(3,3),t(i)+l);
        k(4,4) = l.*fu(V(i)+k(4,3),h(i)+k(1,3),m(i)+k(2,3),n(i)+k(3,3),t(i)+l);
        h(i+1) = h(i) + 1/6.*(k(1,1)+2.*k(1,2)+2.*k(1,3)+k(1,4));
        m(i+1) = m(i) + 1/6.*(k(2,1)+2.*k(2,2)+2.*k(2,3)+k(2,4));
        n(i+1) = n(i) + 1/6.*(k(3,1)+2.*k(3,2)+2.*k(3,3)+k(3,4));
        V(i+1) = V(i) + 1/6.*(k(4,1)+2.*k(4,2)+2.*k(4,3)+k(4,4)); 
       if (V(i)>-40 & V(i+1)<-40)
         count(j) = count(j) + 1;
         if (count(j)==1)
             lengthtemp(j) = t(i);%将第一个峰的时间排除
         end
         length(j) = t(i)-lengthtemp(j);
         if(count(j)<=2)%将第一个峰不计入内,总的时间长度
             f(j) = 0;
         else
             f(j) = (count(j)-1)./length(j);
         end
       end
                  
   end 
end
plot(I,f)
xlabel('I');ylabel('f');
title('频率随电流的变化');
