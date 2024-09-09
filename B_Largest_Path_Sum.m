% ps=pathsum2(x)
%
% compute the maximal path sum through
% backward computation
%
% given a triangle x corresponding to eg.
%            3
%           / \
%          7   4
%         / \ / \
%        2   4   6
%       / \ / \ / \
%      8   5   9   3
%
% starting from the bottom, add the larger of the 
% two branches to the 'parent'
%
% step 1:
%            3
%           / \
%          7   4
%         / \ / \
%        10  13  15
%
% step 2:
%            3
%           / \
%          20  19
%
% step 3:
%           23
paths = tril(magic(100)^2);
result=pathsum2(paths)

function ps=pathsum2(x)
   [m,n] = size(x);
   for l=m-1:-1:1
       for k = 1:m-1
          x(l,k) = x(l,k) + max([x(l+1,k), x(l+1,k+1)]);
       end
   end
   ps = x(1,1);
end
