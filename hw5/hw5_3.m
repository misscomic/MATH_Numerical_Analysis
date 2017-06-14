xs1 = (1/2).^(1:8);  
fs1 = exp(-xs1)./(1+xs1);
xs2 = 2*(1/2).^(1:8);   
fs2 = exp(-xs2)./(1+xs2);
xs3 = 3*(1/2).^(1:8);   
fs3 = exp(-xs3)./(1+xs3);
xlist = (1/2).^(1:8);

dd1 = divdif(xs1,fs1);
ps1 = dd_interp(xs1,dd1,xlist);
dd2 = divdif(xs2,fs2);
ps2 = dd_interp(xs2,dd2,xlist);
dd3 = divdif(xs3,fs3);
ps3 = dd_interp(xs3,dd3,xlist);

fvals = exp(-xlist)./(1+xlist);
err1 = abs(fvals - ps1);
err2 = abs(fvals - ps2);
err3 = abs(fvals - ps3);
% err1 = fvals - ps1;
% err2 = fvals - ps2;
% err3 = fvals - ps3;
loglog(xlist,err1,xlist,err2,xlist,err3);
title('Maximum Absolute Errors');
xlabel('h')
ylabel('pvalues')

emax1 = max(abs(err1))
emax2 = max(abs(err2))
emax3 = max(abs(err3))
max(log(emax1)./(-(1:8)*log(2)))
max(log(emax2)./(-(1:8)*log(2)))
max(log(emax3)./(-(1:8)*log(2)))
