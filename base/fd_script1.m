% This is a script for trying out a method for setting up finite difference
% Laplace type operators in two dimensions.

dx = 0.02; %dx = 0.1; % common grid spacing
% dx = 0.01;
dy = dx;
N1 = 100+1; %N1 = 20+1; % number of grid points in x direction
% N1 = 200+1;
N2 = 115+1; %N2 = 23+1; % number of grid points in y direction
% N2 = 230+1;
x0 = 0;
y0 = 0;
xgrid = x0 + (0:N1-1)*dx;
ygrid = y0 + (0:N2-1)*dy;

% two-dimensional x and y vals: xgrid2(i,j) = x_{i-1,j-1}, ygrid2(i,j) =y_{i-1,j-1}
xgrid2 = ones(N2,1)*xgrid;
ygrid2 = ygrid'*ones(1,N1);

D1_sqr = spdiags([ones(N1,1),-2*ones(N1,1),ones(N1,1)],[-1,0,1],N1,N1);
D2_sqr = spdiags([ones(N2,1),-2*ones(N2,1),ones(N2,1)],[-1,0,1],N2,N2);
A = kron(speye(N2),D1_sqr)*(1/dx^2) + kron(D2_sqr,speye(N1))*(1/dy^2); % Laplace operator on rectangle

% domain for PDE consists of grid points for which Omega == 1
Omega = double(((xgrid2-1).^2+2*(ygrid2-1).^2 < 0.9) & ...
    (xgrid2 > 1 | ygrid2 > 1));

% construct indexes for identifying spatial location of entries in
% Kronecker product
i1 = 1:N1;
i2 = 1:N2;
i1_2d = kron(ones(1,N2),i1);
i2_2d = kron(i2,ones(1,N1));

Omega_idx = reshape(1:N1*N2,size(Omega));


Omegatr = Omega';
findOmegatr = find(Omegatr(:));
for k = 1:length(findOmegatr)
    i = i1_2d(findOmegatr(k));
    j = i2_2d(findOmegatr(k));
    if ~ Omegatr(i,j)
        fprintf('Omegatr not correct\n')
        break
    end
end
fprintf('Omegatr done\n')
contour(Omega)
axis equal
fprintf('Press any key to continue\n')
pause

% submatrix for region Omega
AOmega = A(findOmegatr,findOmegatr);

% solve & display the solution of a Poisson equation
b = ones(size(AOmega,1),1);
uOmega = AOmega \ b;
u0 = zeros(size(Omegatr));
u0(findOmegatr) = uOmega;
figure(2)
surf(ygrid,xgrid,u0)
fprintf('Press any key to continue\n')
pause

% modifications for inhomogeneous Dirichlet boundary conditions: 
% u(x,y) = g(x,y) for (x,y) not in Omega
g = @(x,y)-0.5*cos(pi*(x+y)/2);
Omegalist = Omegatr(:);
CfindOmegatr = find(Omegatr(:) == 0); % complementary set to findOmegatr
garray = g(xgrid2,ygrid2);
garraytr = garray';
grhs = garraytr(CfindOmegatr);
b = 10*b - A(findOmegatr,CfindOmegatr)*grhs;
% b_norm = norm(b)
tic; uOmega_a = AOmega \ b; toc
tic; uOmega_b = pcg(-AOmega, -b, 1e-8, 1000); toc
norm_diff = norm(uOmega_a - uOmega_b)
uOmega = uOmega_a;
u1 = garraytr;
u1(findOmegatr) = uOmega;
figure(3)
surf(ygrid,xgrid,u1)
