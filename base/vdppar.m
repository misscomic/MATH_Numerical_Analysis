function dx = vdppar(t,x,flages,mu)
dx = zeros(2,1);
dx(1) = x(2);
dx(2) = mu*(1-x(1)^2)*x(2)-x(1);

[t,x] = ode45('VDPPAR',[0 20],[2 0],[],1); %mu = 2
function phasport(equations,timespan,plotrange,solver)
    clf;
    axis(plotrange);
    hold on;
    button = 1;
    [xinit(1),xinit(2),button] = ginput(1);
    if button ~=1 break; end;
    [T,Y] = feval(solver, equations, timespan, xinit);
    plot(Y(:,1),Y(:2));
    [T,Y] = feval(solver, equations, -timespan, xinit);
    plot(Y(:,1),Y(:2));
end;

    