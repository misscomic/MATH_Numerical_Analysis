dx = @(x,y,z) sigma*(y-x);
dy = @(x,y,z) x*(rho-z)-y;
dz = @(x,y,z) x*y-beta*z;
sigma = 10; beta = 8/3; rho = 28;

h = 10^(-3);
x0 = [1;-1;1]; %x0 = [1;-1+10^-6;1];
xlist = 1:50;
hlist = h.^-(1:50)
[ylist,tlist] = rk4(f,x0,t0,h,50-1);
plot(xlist,ylist);
hold on
