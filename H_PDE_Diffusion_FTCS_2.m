%Nasruddin_Moia_Exercise_11

clc;
clear;


L=5; h=0.1; tau=0.0001; N=2000;



x=[-L:h:L];

for i=1:length(x)
    D=[1-abs(x)/10];
end


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

for i=1:length(x)
    if (x(i)<0.1 & t(i)<0.6 && t(i)>0.1)
        S(i)=4;
    else
        S(i)=0;
    end
end


for n=1:N
    
    u_num=u;
    for i=2:length(x)-1
        if abs(x(i))<=L
            u_num(i)=u(i)+ (tau/h^2) * D(i) * (u(i+1) - u(i)) + (tau/h^2) * D(i) * (u(i-1) - u(i)) + tau*S(i);
        else
            Z=0;
            u_num(i)=u(i)+ (tau/h^2) * Z * (u(i+1) - u(i)) + (tau/h^2) * Z * (u(i-1) - u(i)) + tau*S(i);
        end
    end
    u=u_num;
    t(n+1)=t(n)+tau;
end

figure(1)
plot(x,u,'blue');
hold on

for i=1:length(x) 
    ut(i)=0.5*(erf((1.5-x(i))/(2*sqrt(D(i)*t(i))))-erf((-1.5-x(i))/(2*sqrt(D(i)*t(i)))));
end

plot(x,ut,'green');
title("the values of expected u and true u against x")
xlabel("x")
ylabel("u")
legend('Calculated Value','True Value')

%In this graph one can see that even though the measured graph deviates
%from the true results, it's underneath area doesn't go beyond it, and
%therefore it is truer for lesser values of tau than the previous code.