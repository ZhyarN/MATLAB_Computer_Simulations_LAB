Z=input("please enter the dimensions NxN of the random-valued field of cells");

M=round(rand(Z),0);
display(M);
N=zeros(length(M)+2,length(M)+2);

%boundary creating loop (NxN)
C=zeros(1,length(M));
D=zeros(length(M)+2,1);
M=[C;M;C];
M=[D,M,D];

%this is for the person to decide after how many iterations it should stop
Iterations=input("input the number of iterations");




%this is the loop
for Iter=1:Iterations%this for loop is only for the iterations
    for i=(1+1:length(M)-1)%this for-loop and the one after are for the indicies of the sum to change per each element
        for j=(1+1:length(M)-1)
            NR=M(i-1,j)+M(i-1,j-1)+M(i,j-1)+M(i+1,j-1)+M(i+1,j)+M(i+1,j+1)+M(i,j+1)+M(i-1,j+1);%this basically sums all the surroundings of an element
            if M(i,j)==1 && NR<2%these if loops compare the result of NR to the conditions provided to change the element accordingly
                N(i,j)=0;
            elseif M(i,j)==1 && NR>=2 && NR<=3
                N(i,j)=1;
            elseif M(i,j)==1 && NR>3
                N(i,j)=0;
            elseif M(i,j)==0 && NR==3
                N(i,j)=1;
            end
        end 
    end
    
    spy(N)
    drawnow
    pause(0.05)%this basically shows us the result of each iteration per 1 sec to illustrate how the results change
    M=N;
end

