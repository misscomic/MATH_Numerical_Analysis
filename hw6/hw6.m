xs = 0:(1/40):1;  
fs = [0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1,
    0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0];
xlist = 0:0.01:1;

dd = divdif(xs,fs);
ps = dd_interp(xs,dd,xlist);

plot(xlist,ps);
title('P(x) with n=20');
xlabel('x')
ylabel('p(x)')

pmax = max(abs(ps))




