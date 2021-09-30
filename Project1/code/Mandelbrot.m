clear all;clc;
x = linspace(-2.0,1.0,1000);
y = linspace(-1.5,1.5,1000);
[Re,Im]=meshgrid(x,y);
C = Re+i*Im;
B = 0;
Z = 0;
for l = 1:50
    Z = Z.^2+ C;
    B = B+(abs(Z)<=2);
end;
imagesc(B);
colormap(jet);
axis equal