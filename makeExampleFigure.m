%% figure dims
dim_window  = [.15 .15 .3 .1];
dim_1xlong  = [.15 .15 .9 .1]; % 3x as long
dim_3xlong  = [.15 .15 .9 .3]; % 3x as long 3x as heigh


%% weight vector
W = weight_vec(50);
efig.w=figure('units','normalized','position',dim_window);
plot(W);

%% example rois  -- x, weight, sd, and cor
r.i.x = sin(1:150)'+rand(150,1);
r.j.x = sin(1:150)'+rand(150,1);
r.k.x = cos(1:150)'+rand(150,1);

% weight
r.i.w = weight_adj(r.i.x,W);
r.j.w = weight_adj(r.j.x,W);
r.k.w = weight_adj(r.k.x,W);

% sd
r.i.s = weight_sd (r.i.x,W,r.i.w );
r.j.s = weight_sd (r.j.x,W,r.j.w );
r.k.s = weight_sd (r.k.x,W,r.k.w );

% cor
r.c.ij = weight_cor(W,r.i.x, r.j.x, ...
                      r.i.w, r.j.w, ...
                      r.i.s, r.j.s);


%% plot Roi
efig.r=figure('units','normalized','position',dim_3xlong);
% plot([r.i;r.j;r.k]')
subplot(3,1,1); plot(r.i.x,'r'); ylim([-2 2]);
subplot(3,1,2); plot(r.j.x,'r'); ylim([-2 2]);
subplot(3,1,3); plot(r.k.x,'r'); ylim([-2 2]);
% - and the weighted 
subplot(3,1,1); hold on; plot(r.i.w,'g.');
subplot(3,1,2); hold on; plot(r.j.w,'g.');
subplot(3,1,3); hold on; plot(r.k.w,'g.');
% - and the sd
subplot(3,1,1); hold on; plot(r.i.s,'b--');
subplot(3,1,2); hold on; plot(r.j.s,'b--');
subplot(3,1,3); hold on; plot(r.k.s,'b--');

%% plot cor
efig.c=figure('units','normalized','position',dim_1xlong);
plot(r.c.ij)


