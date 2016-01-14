function [ sig ] = weight_sd( X,W,xbar)
%WEIGHT_SD use W weight matrix and xbar for weighted SD
%
    sig=zeros(1,length(X));
    N=length(W);
    tau=1:N;
    for t=N:length(X)
      sig(t) = sqrt( sum( W(tau) .* ( X(t-N+tau)' - xbar(t) ).^2 ) );
    end
end

