function y = main(a,b)
y= a + b;
end

%problem 1
function[xp,xm]=solve_quad(a,b,c)
if (b >= 0)
    xp = (2*c)/(-b-sqrt(b^2-4*a*c));
    xm = (-b-sqrt(b^2-4*a*c))/(2*a);
else
    xp = (-b+sqrt(b^2-4*a*c))/(2*a);
    xm = (2*c)/(-b+sqrt(b^2-4*a*c));
end


%problem 2
function[costheta,sintheta]=cos_and_sin(x,y)
costheta = (x/abs(y))/(sqrt((x/y)^2+1));
sintheta = costheta*y/x;
end


%problem 3
function y = mytanh(x)
y = 1 - 2/(exp(2*x)+1);
end

for k=[-2, -1, 0, 1, 2, 3]
x = -10^k
[mytanh(x)]


%problem 4
%1st
xbar = mean(hw2q4datafile)
n = length(hw2q4datafile)
var_1 = 1/(n-1)*sum((hw2q4datafile-xbar).^2)

%2nd
var_2 = 1/(n-1)*(sum(hw2q4datafile.^2) - n*xbar^2)







