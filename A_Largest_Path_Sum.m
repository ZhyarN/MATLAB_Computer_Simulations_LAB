% ps=pathsum(x)
%
% compute the maximal path sum through
% forward computation
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
% compute:
%
% psl:    7                 psr:     4
%        / \                        / \
%       2   4                      4   6
%      / \ / \                    / \ / \
%     8   5   9                  5   9   3
% 
% the result is the larger of the two plus 3

paths = tril(magic(100)^2);
result=pathsum(paths)


function ps=pathsum(x)
   [m,n] = size(x);
   if m==1
      ps = x;
      return
   else
     psl = pathsum(tril(x(2:end,1:end-1)));
     psr = pathsum(tril(x(2:end,2:end)));
     ps = x(1,1)+max([psl,psr]);
   end
end
