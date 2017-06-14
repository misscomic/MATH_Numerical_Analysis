%problem 1
function[xp xm]=solve_quadratic(a,b,c)
if (b >= 0)
    xp = (2*c)/(-b-sqrt(b^2-4*a*c));
    xm = (-b-sqrt(b^2-4*a*c))/(2*a);
else
    xp = (-b+sqrt(b^2-4*a*c))/(2*a);
    xm = (2*c)/(-b+sqrt(b^2-4*a*c));
end