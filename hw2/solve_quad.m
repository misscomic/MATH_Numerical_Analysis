function[xp,xm]=solve_quad(a,b,c)
if (b >= 0)
    xp = (2*c)/(-b-sqrt(b^2-4*a*c));
    xm = (-b-sqrt(b^2-4*a*c))/(2*a);
else
    xp = (-b+sqrt(b^2-4*a*c))/(2*a);
    xm = (2*c)/(-b+sqrt(b^2-4*a*c));
end

a=1;b=-10^6;c=1;
z = -4*a*c/b^2;
delta = abs(b)*(1+z/2-z^2/4);
x_m = (-b-delta)/(2*a);
x_m =

   9.9995e-07;
   
   
a=1;b=10^6;c=1;
z = -4*a*c/b^2;
delta = abs(b)*(1+z/2-z^2/4);
x_m = (-b-delta)/(2*a);
x_m =

  -1.0000e+06;
  
  