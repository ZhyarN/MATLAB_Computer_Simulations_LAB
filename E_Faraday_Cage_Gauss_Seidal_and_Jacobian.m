clc;
clear;
global L phi bndry
L=5;
N=101;
h=L/(N-1);


phi=zeros(N,N);
bndry=phi~=0;

%Outer Boundary
rect(0*h,0*h,0*h,N*h,0);
rect((N-1)*h,N*h,0*h,N*h,1000);

for i=0:N-1
rect(i*h,N*h,0*h,0*h,i*1000/(N-1));
rect(i*h,(N-1)*h,(N-1)*h,(N-1)*h,i*1000/(N-1));
end



%creating circle of rods
for alpha=0:1:360
    alpha=alpha*pi/180;
    A=(round((2.5+(0.5*cos(alpha)))*10))/10;
    B=(round((2.5+(0.5*sin(alpha)))*10))/10;
    rect(A,A,B,B,100);
end



imagesc(phi)
