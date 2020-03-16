
[x,y]=meshgrid(-6:.3:6,-6:.2:6);
u = ones(61,41);
v = sin(x.*y);
quiver(x,y,u,v)