clear all;clc;
C = 0.11+0.66*i;
V = linspace(-2.0,2.0,400);
 [Re,Im]=meshgrid(V);
Z = Re+i*Im;
B = 0;
for K = 1:100
    B = B+(abs(Z)<=2);
    Z = Z.^2+ C;
end;
imagesc(B);
colormap(jet);
axis equal