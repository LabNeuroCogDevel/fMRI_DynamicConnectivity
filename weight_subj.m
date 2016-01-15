function [ p ] = weight_subj(roifile,N)
 %WEIGHT_SUBJ get PWCM for each subject's roi file
%   want path to afni ROIstat output and num timepoints of window (N)
 
    %% options
    W=weight_vec(N);


    %% read in rois
    sroi=dlmread(roifile,'\t',1,2);
    nroi=size(sroi,2);

    %% adjust and weight adjust SD
    for i=1:nroi
       m(i).x    = sroi(:,i);
       m(i).xbar = weight_adj(m(i).x,W);
       m(i).sd   = weight_sd (m(i).x,W,m(i).xbar );
    end

    %% calculate for each roi-roi pair. time consuming (150sec)
    tic
    p=zeros(nroi,nroi,length(m(1).x));
    for i=1:nroi
        for j=i:nroi
            p(i,j,:) = ...
               weight_cor(W,m(i).x,   m(j).x,    ...
                            m(i).xbar,m(j).xbar, ...
                            m(i).sd,  m(j).sd);
        end
    end
    toc

    %% scott likes his matrix square
    %pback=p;
    % first N time points are NaN
    p=p(:,:,N:end);
    % square it
    for i =1:size(p,3)
        p(:,:,i) = p(:,:,i)+p(:,:,i)';
    end

end

