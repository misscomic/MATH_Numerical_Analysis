y0 = 0;
t0 = 0;
hlist = 2.^(-(1:10));
f = @(t,y) 1+y.^2;
for k = 1:10
    h = 2.^(-k);
   [ylist,tlist] = rk4(f,y0,t0,h,10-1);
    plot(hlist,tlist);
    hold on
end

