f = @(x)exp(-x)./(1+x)
k = 1:10;
nlist = 2.^k+1;
n = length(nlist);
exact = simpson(f,0,1,10^4/2)

for i = 1:length(nlist)
    trapint = trapezoidal(f,0,1,nlist(i));
    simpint = simpson(f,0,1,nlist(i)/2);
    traperr(i) = trapint - exact;
    simperr(i) = simpint - exact;
end

loglog(nlist,abs(traperr),nlist,abs(simperr));
