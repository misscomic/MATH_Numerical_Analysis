n = 5;
xlist = 0:0.01:1;

xs = 0.5*(1-cos(((0:n)+0.5)*pi./(n+1)));  %chebyshev
fs = exp(-xs)./(1+xs);
dd = divdif(xs,fs);
ps = dd_interp(xs,dd,xlist);

fvals = exp(-xlist)./(1+xlist);
error = fvals - ps;

plot(xlist,error);
title('Differences (Chebyshev with degree=5)');
xlabel('x')
ylabel('errors')

emax = max(abs(error))
emin = min(abs(error))