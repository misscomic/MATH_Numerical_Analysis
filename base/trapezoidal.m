function val = trapezoidal(func,a,b,n)
% VAL = trapezoidal(FUNC,A,B,N)
%
% VAL is the approximation of \int_a^b func(x).dx using the trapezoidal rule
% FUNC	-- function to integrate
% A	-- lower limit of integration interval
% B	-- upper limit of integration interval
% N	-- number of sub-intervals (= (number of evaluation points)-1)
%
% FUNC must be able to compute a vector of values given a vector of
% inputs (for efficiency)

val = feval(func,a)+feval(func,b);
h = (b-a)/n;
xs = (1:(n-1))*h + a;
val = val + 2*sum(feval(func,xs));
val = val*h/2;
