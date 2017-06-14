load('lsdata.mat','-ascii')
x = lsdata(1,:)';
y = lsdata(2,:)';
ynoisy = y +.1*randn(size(x));
A = lsdata;
plot(x,y,'.');
hold on

D = A'*A;
e = A'* ynoisy';

c = D\e;
yfit = c(1).*x + c(2);
plot(x,yfit,'X')

    