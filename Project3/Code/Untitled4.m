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
%f1

plot(x1,ul(:,1),x2,ur(:,1));
figure
plot(x_tot,u_tot);
axis([-1 1 -inf inf])