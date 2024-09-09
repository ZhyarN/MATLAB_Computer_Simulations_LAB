global L phi bndry


% set up the lattice
L=1;
N=101;
h=L/(N-1);

phi=zeros(N,N);
bndry=phi~=0;

% set outer box to 0 V
Vg = 0;
rect(0,0.02,0,L, Vg);
rect(L-0.02,L,0,L, Vg);
rect(0,L,0,0.02, Vg);
rect(0,L,L-0.02,L, Vg);

% set condensator voltage to 100 V
Vc = 100;
rect(0.4,0.6,0.55,0.57, -Vc);
rect(0.4,0.6,0.43,0.45, +Vc);

figure();
imagesc([0:N-1]*h,[0:N-1]*h,phi.');
axis xy
