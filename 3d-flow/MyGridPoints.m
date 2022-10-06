function MyGridPoints(L,dat) 
 
P = dat.PP;
lw = dat.GridMarkerWidth;
mColor = dat.GridColor;
mEdge = dat.GridEdge;
center = dat.center;
radius = dat.radius;

LL =  L*P'    ;

inds = (vecnorm(LL - center * ones(1,size(LL,2)), 2, 1) < radius);
%inds = LL(1,:)<dat.xmax & LL(1,:)>-dat.xmax ...
%    & LL(2,:)<dat.ymax & LL(2,:)>-dat.ymax ...
%& LL(3,:)<dat.zmax & LL(3,:)>-dat.zmax;
LB=LL(:,inds) ;

scatter3(LB(1,:),LB( 2,:),LB(3,:),  10+ 4*abs(2+LB(1,:)),...
    'Marker',mEdge,...
    'LineWidth',lw,...
    'MarkerEdgeColor',mColor,...
    'MarkerFaceColor',mColor) 