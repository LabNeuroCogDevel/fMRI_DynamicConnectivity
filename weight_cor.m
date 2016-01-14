function [ p ] = weight_cor(W,x1,x2,x1_bar,x2_bar,x1_sig,x2_sig )
%WEIGHT_COR Summary of this function goes here
%   Detailed explanation goes here
 wc = weight_cov(W,x1,x2,x1_bar,x2_bar);
 p=zeros(size(x1));
 for i=1:length(x1)
  p(i) = wc(i) / (x1_sig(i) .* x2_sig(i) );
 end
end

