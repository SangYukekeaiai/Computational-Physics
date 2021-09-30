function phi=nor(phi,h)
norm=0;
for k=1:length(phi)
    norm=norm+phi(k)^2;  
end
norm=1/sqrt(h*norm);
phi=norm.*phi;
