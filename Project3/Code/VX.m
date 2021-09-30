function VX = VX(X)
 A = 1.0;
 B = 4.0;
 VX = 3.0-A.*A.*B.*(B-1.0)/(cosh(A.*X).^2)/2.0;

