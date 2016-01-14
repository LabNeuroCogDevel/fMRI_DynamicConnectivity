function [ xbar] = weight_adj( X, W )
%WEIGHT_ADJ Exp Window weighted adjustment 
%   Adjust T by window lenght N using [paper]

 N=length(W);

 %% 
  xbar=zeros(1,length(X));
  tau=1:N;
  for t=N:length(X)
   xbar(t) = sum( X(t-N+tau)' .* W(tau));
  end

end

