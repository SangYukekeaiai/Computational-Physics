function U = numerove(N,H,Q,S,U)

G = H*H/12.0;
for i = 2:1:N-1
    C0 = 1.0+G.*Q(i-1);
    C1 = 2.0-10.0.*G.*Q(i);
    C2 = 1.0+G.*Q(i+1);
    D = G.*(S(i+1)+S(i-1)+10.0*S(i));
    UTMP = C1*U(i)-C0*U(i-1)+D;
    U(i+1) = UTMP/C2;
end
