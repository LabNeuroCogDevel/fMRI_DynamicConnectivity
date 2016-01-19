% sliding window size
N=50;
nROI=333; % should get this from file, but easier to define here
roistatdir='/Volumes/Zeus/preproc/MM_rest/MHRest_MB_ln/Roistatfiles/';

%% FOR ONE SUBJECT
% read in rois
roi='/Volumes/Zeus/preproc/MM_rest/MHRest_MB_ln/Roistatfiles/10767_20140814_roistats.txt';

% get roi-roi correlations for each window
% roi x roi x (time-window_size)
tic, p=weight_subj(roi,N);toc,
%
ptstat = ptstat_subj(p);

%% FOR ALL SUBJ
% fixe me; vecotize

roifiles = ROIfile_fromdir(roistatdir);
[ subjptstat,psubj ] = tstat_roistatdir( roifiles,nROI );

plot(histcounts(subjptstat(~isnan(subjptstat))))
%save('nsp_tstats.mat','subjptstat','roifiles','psubj','-v7.3')