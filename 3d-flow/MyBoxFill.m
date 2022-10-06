function MyBoxFill(p0,p1,p2,p3,dat)

lw = dat.MainBoxMarkerWidth;
bOpaque = dat.MainBoxOpaque;
bEdge = dat.MainBoxEdge;

p4=p1+p2;
p5=p1+p3;
p6=p2+p3;
p7=p3+p4;

singleFill([p0,p1,p4,p2],lw,bOpaque,bEdge)
singleFill([p0,p1,p5,p3],lw,bOpaque,bEdge)
singleFill([p0,p2,p6,p3],lw,bOpaque,bEdge)
singleFill([p7,p5,p3,p6],lw,bOpaque,bEdge)
singleFill([p1,p5,p7,p4],lw,bOpaque,bEdge)
singleFill([p4,p7,p6,p2],lw,bOpaque,bEdge)
 


    function singleFill(PP,lw,bOpaque,bEdge)
        
        bColor = PP(3,:);
        fill3(PP(1,:), PP(2,:),PP(3,:),bColor,...
            'FaceAlpha',bOpaque,...
            'LineStyle',bEdge,'LineWidth',lw) 
    end
end