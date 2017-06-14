n = 3;
xlist = 0:0.01:1;

xs = 0.5*(1-cos(((0:n)+0.5)*pi./(n+1)));  %chebyshev
fs = exp(xs);
fvals = exp(xlist);
dd = divdif(xs,fs);
ls = 0.996294+0.997955*xlist+0.536722*xlist.^2+0.176139*xlist.^3;
ps = dd_interp(xs,dd,xlist);

error1 = fvals - ls; %least squares
error2 = fvals - ps; %chebyshev

plot(xlist,error1)
hold on
plot(xlist,error2);
hold off
title('Error for approximations');
xlabel('x')
ylabel('errors')

 

