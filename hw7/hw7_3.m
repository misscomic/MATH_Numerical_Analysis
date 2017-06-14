f = @(x) exp(-x)./(1+x);
k = 1:9;
nlist = 3 * 2.^k;
n = length(nlist);
exact = simpson(f,0,1,10^4/2)

for i = 1:length(nlist)
    gauint = compGauss3(f,0,1,nlist(i));
    gauerr(i) = gauint - exact;
end

loglog(nlist,gauerr);