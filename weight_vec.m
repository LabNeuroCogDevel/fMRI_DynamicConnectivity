function [ W ] = weight_vec(N)
%WEIGHT_VEC calculate weight vector
%   
  theta=floor(N/3);
  W0 = (1 - exp(-1/theta) )/ (1 - exp(-N/theta) );
  tau = 1:N;
  W  = W0*exp((tau - N)/theta);
end

