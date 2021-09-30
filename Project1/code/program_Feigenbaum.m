clear all;clc;
a = [0:0.00001:4];
X = ones(510,400001);
X(1,:) = 0.5.*X(1,:);
tic
for j = 1:510
X(j+1,:) = a.*X(j,:).*(1-X(j,:));
    if j>449&&j<459
        scatter(a,X(j,:),0.000001,'b.');
        hold on;
    end
end
toc
%plot(a,X(450:470,:),'b.','MarkerSize',0.1)
