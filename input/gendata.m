ieee='b';
accuracy='real*8';

nx = 500;
ny = 500;
nz = 100;

Lx = 100e3;
Ly = 100e3;

H0 = 500;       % shelf depth
H1 = 2000;      % ocean depth
d = 10e3;      % shelf width

dx = Lx/nx*ones(nx,1);
dy = Ly/ny*ones(ny,1);
dz = H1/nz*ones(nz,1);

x = dx(1)/2+cumsum([0; dx])';
y = dy(1)/2+cumsum([0; dy])';
z = -H1+cumsum(dz)'-dz(1)/2;

h = -ones(nx,1)*((H0-H1)*exp(-y(1:ny)/d)+H1);
h(1,:) = 0; h(end,:) = 0;
h(:,1) = 0; h(:,end) = 0;

Temp = 10*(-z/H1);

fid=fopen('dx.grid','w',ieee); fwrite(fid,dx,accuracy); fclose(fid);
fid=fopen('dy.grid','w',ieee); fwrite(fid,dy,accuracy); fclose(fid);
fid=fopen('dz.grid','w',ieee); fwrite(fid,dz,accuracy); fclose(fid);

fid=fopen('topog','w',ieee); fwrite(fid,h,accuracy); fclose(fid);
fid=fopen('temp.prof','w',ieee); fwrite(fid,Temp,accuracy); fclose(fid);