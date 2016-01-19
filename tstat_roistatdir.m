function [ subjptstat,psubj ] = tstat_roistatdir( roifiles ,nROI )
%TSTAT_ROISTATDIR get ROI-ROI test statistic per subject (ROIstat files)
%  uses ptstat_subj on subjected read in from each file in roifiles
%  retruns a roi X roi X subject matrix  AND
%          a cellarray of roi X roi X time matrices per subject 

    %nROI=333;
    %roistatdir=ROIfile_fromdir('/Volumes/Zeus/preproc/MM_rest/MHRest_MB_ln/Roistatfiles/');

    %NB: know 333 rois, not derived from data. fixme?
    subjptstat = zeros(nROI,nROI,length(roifiles));

    parfor i=1:length(roifiles)
        N=50;
        tic
        psubj{i} = weight_subj(roifiles{i},N);
        subjptstat(:,:,i) = ptstat_subj(psubj{i} );
        toc
    end
end

