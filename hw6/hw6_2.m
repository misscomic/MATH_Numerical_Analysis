xs = 0:(1/10):1;   %not a knot
fs = [0,0,0,0,0,1,0,0,0,0,0];
xlist = 0:0.01:1;

ps = spline(xs,fs,xlist);

plot(xlist,ps);
title('P(x) with n=10 (spline)');
xlabel('x')
ylabel('p(x)')

pmax = max(abs(ps))