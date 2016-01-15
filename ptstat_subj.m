function [ ptstat ] = ptstat_subj( p )
%PWCM Pearson Weighted Correlation Matrix
%   a la Zalesky (Time resolved resting state brain networks)

    % how many rois do we have
    nroi = size(p,2);
    nT   = size(p,3);
    %% get test stat
    pij = reshape(p(1,2,:),1,size(p,3));
    nonstationaryTstat(pij,0);

    ptstat = zeros(nroi);   % store tstat
    badroi = zeros(1,nroi); % count what rois fail
    tic
    for i=1:nroi
        for j=(i+1):nroi
            pij=reshape(p(i,j,:),1,nT);
            ptstat(i,j)=nonstationaryTstat(pij);
            if ptstat(i,j) == 0
                badroi(i)=badroi(i)+1;
                badroi(j)=badroi(j)+1;
            end
        end
    end
    toc

    ptstat = ptstat + ptstat';

end

