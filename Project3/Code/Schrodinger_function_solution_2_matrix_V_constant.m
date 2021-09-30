clear all;clc;
n = 201;
h = 1/(n-1);
H = zeros(n,n);
for i = 2:n-1
    for j = 1:n
        if(i==j)
            H(i,j) = -2;
            H(i-1,j) = 1;
            H(i+1,j) = 1;
        end
    end
end
H(1,1) = -2;
H(n,n) = -2;
H(2,1) = 1;
H(n-1,n) = 1;

H = H*(-1/h^2);

for i = 1:n
    energy(i) = i.^2.*pi.^2;
    s(i) = 0.9999999.*energy(i);
end


k = 100;
x = zeros([n n]);
save = rand(n,1);
for i = 1:n
    [lambda(i),x(:,i)] = invpowerit(H,save,s(i),k);
    sum_of_square(i) = 0;
    for j = 1:n-1
        sum_of_square(i) = sum_of_square(i)+x(j,i).^2.*h;
    end
    for m = 1:n
        x(m,i) = x(m,i)./sum_of_square(i).^(1/2);
    end
end


figure
plot(linspace(-1,1,n),x(:,1));
figure
plot(linspace(-1,1,n),x(:,2));
figure
plot(linspace(-1,1,n),x(:,3));
figure
plot(linspace(-1,1,n),x(:,n));