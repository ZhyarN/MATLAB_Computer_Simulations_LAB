clear;
clc;

D=1;
N=1000;
a=-1;
b=1;


r_points=rand(D,N);%random points: we generate random points

s_points=a + ((b - a) * r_points);%scaled points: we scale the random 
%points to be in our desired interval of -1 and 1 only

f_points=[];%functioned points: we find the values of f(x) for all those
%points to see to which y does each x correspond to, we do that through the
%loop below

for i=1:D
    for j=1:N
        f_points(i,j)=(((s_points(i,j))^2)+1)*exp(-2*(s_points(i,j)^2));
    end
end

result = (b - a)^D / N*sum(f_points(:));%this is the monte-carlo summation
%that approximates the integration

display(result);

f=@(x)(((x).^2)+1).*exp(-2*(x.^2));
tres=quad(f,a,b);
display(tres);

