n = 10;n2 = 20;n3 = 40;
xlist = 0:0.01:1;
xs = 0.5*(1-cos(((0:n)+0.5)*pi./(n+1)));  %chebyshev
fs = [0,0,0,0,0,1,0,0,0,0,0];
xs2 = 0.5*(1-cos(((0:n2)+0.5)*pi./(n2+1))); %n=20
fs2 = [0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0];
xs3 = 0.5*(1-cos(((0:n2)+0.5)*pi./(n2+1))); %n=40
fs3 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

dd = divdif(xs,fs);
ps = dd_interp(xs,dd,xlist);
dd2 = divdif(xs2,fs2);
ps2 = dd_interp(xs2,dd2,xlist);
dd3 = divdif(xs3,fs3);
ps3 = dd_interp(xs3,dd3,xlist);

plot(xlist,ps,xlist,ps2,xlist,ps3);
title('P(x) (cheby)');
xlabel('x')
ylabel('p(x)')

pmax = [max(abs(ps)),max(abs(ps2)),max(abs(ps3))];
pmax
