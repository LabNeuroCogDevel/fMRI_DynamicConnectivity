% sliding window size
N=50;

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
roifiles={};
roistatdir='/Volumes/Zeus/preproc/MM_rest/MHRest_MB_ln/Roistatfiles/';
for f=dir(roistatdir)'
  if ~f.isdir; roifiles={roifiles{:} [ roistatdir f.name]};end
end

%NB: know 333 rois, not derived from data. fixme?
subjptstat = zeros(333,333,length(roifiles));

parfor i=1:length(roifiles)
    N=50;
    tic
    psubj{i} = weight_subj(roifiles{i},N);
    subjptstat(:,:,i) = ptstat_subj(psubj{i} );
    toc
end

plot(histcounts(subjptstat(~isnan(subjptstat))))