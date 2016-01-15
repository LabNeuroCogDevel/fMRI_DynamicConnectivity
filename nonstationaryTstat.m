function [ tstat ] = nonstationaryTstat( pij,varargin )
%NONSTATIONARYTSTAT get the test statistic of roi-roi cor vector
%   First arg is roi-roi sliding window corrilation vector
%   Second is optional True/False for plotting

    %% vars
    % product is weighted to favor height (beta)
    % todo: make options in function call?
    alpha=.9;
    beta=1;
    % derived from input
    Nt = length(pij);
    pijm = median(pij);
    pijc = pij >= pijm;
    cidx = find(diff(pijc)~=0);
   
    if isempty(cidx)
        warning('roi-roi corr window stationary (all NaN?)');
        tstat=NaN;
        return;
    end
    % we can add to a plot if given a second input arguement
    wantplot=0;
    if(~isempty(varargin)); wantplot=varargin{1}; end


    %% readjust the index we picked to be closest to the median
    for in = 1:length(cidx)
         i=cidx(in);
         aidx = [-1 0 1];   % adjust index
         % TODO: simplify
         nidx= i+ [-1 0 1]; % actual indices for pij
         % reduce adjust indices to only those possible (in array bounds)
         aidx = aidx(nidx>0 & nidx<=Nt);
         % recalc acutal indices for pij
         nidx = i + aidx;

         % find which index is best (distance from median)
         a=abs(pij(nidx) - pijm);
         [m,mi]=min(a);
         % dont need this check
         % if m == pij(i); continue; end
         % change the cross pt to the index closest to the median
         cidx(in) = nidx(mi);
    end

    if wantplot
        hold off;   
        %plot(pijc); 
        plot(pij);
        hold on; 
        plot(pijm.*ones(Nt,1))
        plot(cidx,ones(size(cidx)) .* pijm,'x')
    end

    %% get length hieghts product
    nwin = length(cidx)+1;
    lh_prod = zeros(1,nwin);

   

    % looking at window ending on iterator of cidx, backwards
    for i=1:nwin
        if i==1
            %fprintf('*first idx\n')
            w=1:cidx(i);
        % go from last point to the end of pij
        elseif i>length(cidx)
            %fprintf('*last idx\n')
            w=cidx(i-1):length(pij);
        else
            w=cidx(i-1):cidx(i);
        end
        [h,hi]=max( abs( pij(w) - pijm ));
        l=length(w)-1;

        % if we want, we can plot the values
        if wantplot
            x = w(hi);
            val = pij(x);
            fprintf('@ %d/%d %d...%d (n=%d), max = %.02f (%.02f) x = %d\n',...
                     i,length(cidx),min(w),max(w),l,h,val, x)
            plot(x,val,'.k')
        end
        
        % weighted product
        lh_prod(i) = l^alpha .* h^beta;
    end

    % we dont use the last window
    tstat = sum(lh_prod(1:(end-1)));


end

