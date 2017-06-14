A = [2 -1 0 3;
    1 -1 1 1;
    0 2 1 -2;
    1 0 1 1];
x = [1 1 0 2]';

for n = 1:50
    y = A*x;
    lambda = norm(y)/norm(x);
    x = y;
end


