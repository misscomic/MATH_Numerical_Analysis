xs5 = -5:(10/5):5;   %for n = 5, 10, 15,20
fs5 = 1./(1+xs5.^2);
xs10 = -5:(10/10):5;   
fs10 = 1./(1+xs10.^2);
xs15 = -5:(10/15):5;   
fs15 = 1./(1+xs15.^2);
xs20 = -5:(10/20):5;   
fs20 = 1./(1+xs20.^2);
xlist = -5:0.01:5;
ys = 1./(1+xlist.^2);

dd5 = divdif(xs5,fs5);
ps5 = dd_interp(xs5,dd5,xlist);
dd10 = divdif(xs10,fs10);
ps10 = dd_interp(xs10,dd10,xlist);
dd15 = divdif(xs15,fs15);
ps15 = dd_interp(xs15,dd15,xlist);
dd20 = divdif(xs20,fs20);
ps20 = dd_interp(xs20,dd20,xlist);

plot(xlist,ps5,xlist,ps10,xlist,ps15,xlist,ps20,xlist,ys);
title('Interpolants');
xlabel('x')
ylabel('pvalues')