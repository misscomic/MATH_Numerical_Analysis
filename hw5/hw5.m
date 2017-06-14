xs = 0:(1/3):1;   %change for n = 1, 2, 3
fs = exp(-xs)./(1+xs);
xlist = 0:0.01:1;

dd = divdif(xs,fs);
ps = dd_interp(xs,dd,xlist);


fvals = exp(-xlist)./(1+xlist);
error = fvals - ps;

plot(xlist,error);
title('Differences between f(x) & P3(x)');
xlabel('x')
ylabel('errors')

emax = max(abs(error))




