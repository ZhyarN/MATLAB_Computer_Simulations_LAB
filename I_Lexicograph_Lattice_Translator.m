clc;
clear;

%Nasruddin_Moia_Exercise_1_6

N=4;

m=[];%a matrix for the angles

%__________________________________________________________

for i=1:N
    for j=1:N
        m(i,j)=rand*2*pi;
    end
end

%_________________________________________________________

n=[];%a matrix for the cos and sin of each angle in m
for i=1:N
    for j=1:N
    n(i,j,1)=cos(m(i,j));
    n(i,j,2)=sin(m(i,j));

    end
end

%____________________________________________________________

l=zeros(N,N);%this is the lexigraph
a=1;
for i=1:N
    for j=1:N
    l(N+1-i,j)=a;
    a=a+1;
    end
end

%___________________________________________________________

display("this is the angles that we have:");
display(m);
display("these are the cos and sin of each angle");
display(n);
display("these are the lexicographs of each indice");
display(l);

display("the desired lexicograph has the lattice:");
[ii,jj]=lex2lat(5);
display(ii);
display(jj);

display("the desired lattice has the lexicograph:");
val=lat2lex(4,3);
display(val);

%___________________________________________________________________

result=[];%this calculates the result of adding right and up neighbour values based on lexicographs
boundary_right=linspace(N,N^2,N);
boundary_up=((N-1)*N)+linspace(1,N,N);


for k=1:N^2

    if ~ismember(k,boundary_right) && k~=N^2
    [iii,jjj]=lex2lat(k);
    [iiii,jjjj]=lex2lat(k-(N-1));
    [iiiii,jjjjj]=lex2lat(k+N);
    result(k)=(n(iii,jjj,1)*n(iiii,jjjj,1))+(n(iii,jjj,2)*n(iiii,jjjj,2))+((n(iii,jjj,1)*n(iiiii,jjjjj,1)))+((n(iii,jjj,2)*n(iiiii,jjjjj,2)));
    

    elseif ~ismember(k,boundary_up) && k~=N^2
    [iii,jjj]=lex2lat(k);
    [iiii,jjjj]=lex2lat(k+1);
    [iiiii,jjjjj]=lex2lat(k-(N^2)+N);
    result(k)=(n(iii,jjj,1)*n(iiii,jjjj,1))+(n(iii,jjj,2)*n(iiii,jjjj,2))+((n(iii,jjj,1)*n(iiiii,jjjjj,1)))+((n(iii,jjj,2)*n(iiiii,jjjjj,2)));
    
    elseif k==N^2
    [iii,jjj]=lex2lat(k);
    [iiii,jjjj]=lex2lat(k-(N-1));
    [iiiii,jjjjj]=lex2lat(k-(N^2)+N);
    result(k)=(n(iii,jjj,1)*n(iiii,jjjj,1))+(n(iii,jjj,2)*n(iiii,jjjj,2))+((n(iii,jjj,1)*n(iiiii,jjjjj,1)))+((n(iii,jjj,2)*n(iiiii,jjjjj,2)));

    else
    [iii,jjj]=lex2lat(k);
    [iiii,jjjj]=lex2lat(k+1);
    [iiiii,jjjjj]=lex2lat(k+N);
    result(k)=(n(iii,jjj,1)*n(iiii,jjjj,1))+(n(iii,jjj,2)*n(iiii,jjjj,2))+((n(iii,jjj,1)*n(iiiii,jjjjj,1)))+((n(iii,jjj,2)*n(iiiii,jjjjj,2)));
    
    end

end
display("this is the resultant elements for the summation:");
display(result);
display("this is the final result of the H");
display(-1*sum(result));


%____________________________________________________________

function [ii,jj]=lex2lat(z)%this function takes lexicographs and returns the lattice indicies
global l;
global N;

ii=1;
jj=1;

for i=1:N;
    for j=1:N;
        if l(i,j)==z;
            ii=i;
            jj=j;
        return
        end
    end
end
end

%___________________________________________________________

function[val]= lat2lex(oo,oi)
global l;

val=l(oo,oi);

end

%____________________________________________________________

