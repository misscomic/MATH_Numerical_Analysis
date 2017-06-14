load('lsdata.mat','-ascii')
x = lsdata(1,:)';
y = lsdata(2,:)';
A = ones(20,4);
i = 1:20;

for n = 1:20
    for i = 1:4
        A(n,i)=x(n)^(i-1);
    end
end

c = [0,1,2,3]';
err = A*c-y;
min(err)
    