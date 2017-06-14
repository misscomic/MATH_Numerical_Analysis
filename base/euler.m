function [ylist,tlist] = euler(f,y0,t0,h,n)
% function [ylist,tlist] = euler(f,y0,t0,h,n)
% Carry out n steps of Euler's method for dy/dt = f(t,y)
% with step size h and y(t0) = y0
ylist = zeros(length(y0),n+1);
tlist = zeros(1,n+1);
ylist(:,1) = y0;
tlist(1) = t0;
y = y0;
for i = 1:n
  y = y + h*f(t0+(i-1)*h,y);
  ylist(:,i+1) = y;
  tlist(i+1) = t0+i*h
end

