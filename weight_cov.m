function [ cov_ ] = weight_cov( W,x1,x2,xbar1,xbar2 )
%WEIGHT_COV Summary of this function goes here
%   Detailed explanation goes here


    cov_=zeros(1,length(x1));
    N=length(W);
    tau=1:N;
    for t=N:length(x1)
      cov_(t) =  sum( W(tau) .* ...
                       ( x1(t-N+tau)' - xbar1(t) ) .* ...
                       ( x2(t-N+tau)' - xbar2(t) )  );
    end
end
