%Nasruddin_Moia_Exercise_11

clc;
clear;


D=1; S=1; L=5; h=0.1; tau=0.001; N=2000;



x=[-L:h:L];


u0=[];

for i=1:length(x)
    if abs(x(i))<1.5
        u0(i)=1;
    else
        u0(i)=0;
    end
end

u=u0;

t=[0];
for i=1:N
    t(i+1)=t(i)+tau;
end



for n=1:N
    u_num=u;
    for i=2:length(x)-1
        if abs(x(i))<=L
            u_num(i)=u(i)+ (tau/h^2) * D * (u(i+1) - u(i)) + (tau/h^2) * D * (u(i-1) - u(i)) + tau*S;
        else
            Z=0;
            u_num(i)=u(i)+ (tau/h^2) * Z * (u(i+1) - u(i)) + (tau/h^2) * Z * (u(i-1) - u(i)) + tau*S;
        end
    end
    u=u_num;
end

figure(1)
plot(x,u,'blue');
hold on



for i=1:length(x)
    
    ut(i)=0.5*(erf((1.5-x(i))/(2*sqrt(D*t(i))))-erf((-1.5-x(i))/(2*sqrt(D*t(i)))));

end

plot(x,ut,'green');
title("the values of expected u and true u against x")
xlabel("x")
ylabel("u")
legend('Calculated Value','True Value')

%Discussion: Since we are not using changing S and D, we can see that the 
%measured graph goes beyond the true value by alot, and the sum of the
%areas underneath both aren't equal, meaning that at small taus, this
%function deviates a lot.

