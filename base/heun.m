function [ylist,tlist] = heun(f,y0,t0,h,n)
% function [ylist,tlist] = heun(f,y0,t0,h,n)
% Carry out n steps of Heun's method for dy/dt = f(t,y)
% with step size h and y(t0) = y0
ylist = zeros(length(y0),n+1);
ylist(:,1) = y0;
y = y0;
tlist(1) = t0;
for i = 1:n
  z = y + h*feval(f,t0+(i-1)*h,y);
  y = y + (h/2)*(feval(f,t0+(i-1)*h,y)+feval(f,t0+i*h,z));
  ylist(:,i+1) = y;
  tlist(i+1) = tlist(i) + h;
end

