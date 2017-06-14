function intval = compGauss3(f,a,b,n)
% function intval = compGauss3(f,a,b,n)
% Composite 3-point Gaussian integration rule for computing
% integral of f(x).dx from x = a to x = b with the simple
% 3-point Gauss rule applied to each of n pieces:
% integral f(x).dx from x_i to x_{i+1}.
intval = 0;
h = (b-a)/n; % width of each piece
x = linspace(a,b,n+1);
for i = 0:n-1
  intval = intval + 5/9 * feval(f,x(i+1)+h/2-sqrt(3/5)*h/2);
  intval = intval + 8/9 * feval(f,x(i+1)+h/2);
  intval = intval + 5/9 * feval(f,x(i+1)+h/2+sqrt(3/5)*h/2);
end
intval = h*intval/2;