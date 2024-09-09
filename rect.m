% rect(minx, maxx, miny, maxy, v)
%
% assumes that global L, phi and bndry are defined
%
% sets all sites in phi that have 
%  minx <= x <= maxx   and
%  miny <= y <= maxy
% to the value v and the corresponding sites in bndry to 'true'
%
% 
function rect(minx, maxx, miny, maxy, v)
global L phi bndry

[N,~] = size(phi);
h = L/(N-1);

Ix = find([0:N-1]*h >= minx & [0:N-1]*h<=maxx);
Iy = find([0:N-1]*h >= miny & [0:N-1]*h<=maxy);
phi(Ix,Iy) = v;
bndry(Ix,Iy) = true;
