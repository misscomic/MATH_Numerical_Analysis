function [x,xs,fvals] = newton(func,dfunc,x,eps)
% [x,xs,fvals] = newton(func,dfunc,x,eps)
%
% Uses Newton's method to solve
%	func(x) = 0
% Approximate solution returned as x.
% A history of the iterates is returned as xs and the function
% values as fvals.
% The input x is the initial guess.
% The function is given as a Matlab function with the name in func
% and its derivative is another Matlab function with the name in dfunc.

xs = [x];
fval = feval(func,x);
fvals = [fval];
while norm(fval) >= eps
  dfval = feval(dfunc,x);
  x = x - dfval\fval;
  xs = [xs x];
  fval = feval(func,x);
  fvals = [fvals fval];
end


