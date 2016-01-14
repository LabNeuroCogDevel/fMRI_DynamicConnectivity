N=50;
%% read in rois
roi='/Volumes/Zeus/preproc/MM_rest/MHRest_MB_ln/Roistatfiles/10767_20140814_roistats.txt';
tic, p=weight_subj(roi,N);toc,

% 
% for i=1:nroi
%     for j=1:nroi
%         snum=ceil(i/nroi)+mod(j,nroi),
%         subplot(nroi,nroi,snum )
%         title(sprintf('%d %d',i,j))
%         plot( reshape( p(i,j,:) ,1, 300) );
%     end
% end
% 
% 
% 
% psize=5
% for i=1:5
%     for j=1:5
%         snum=ceil(i/psize)+mod(j,psize),
%         subplot(psize,psize,snum )
%         title(sprintf('%d %d',i,j))
%         plot( reshape( p(i,j,:) ,1, 300) );
%     end
% end
