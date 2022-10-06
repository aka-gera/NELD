function  MyFigure(L0,LL,L,Nbeta,PBC)

datF =paramFig(PBC);
 
ft = datF.ft;
lw = datF.AxisWidth;
Ax = datF.AxisColor;
center = datF.center;
radius = datF.radius;
Angle = datF.Angle;

h=figure(1);
clf
hold on
colormap(datF.mapp)
p1=L0(:,1);p2=L0(:,2);p3=L0(:,3);p0=[0 0 0]';
MyBoxFill(p0,p1,p2,p3,datF)             % main box

figg = gca;
set(figg, 'Visible', 'off');

MyGridPoints(L,datF)                      % netgrid

quiver3(0,0,center(3)-radius,0,0,radius*2,'Color',Ax,'LineWidth',lw)
quiver3(0,center(2)-radius,0,0,radius*2,0,'Color',Ax,'LineWidth',lw)
quiver3(center(1)-radius,0,0,radius*2,0,0,'Color',Ax,'LineWidth',lw)
text(0,0,center(3)+radius,'Z','Color',Ax,'Interpreter','tex','FontSize',ft)
text(0,center(2)+radius,0,'Y','Color',Ax,'Interpreter','tex','FontSize',ft)
text(center(1)+radius,0,0,'X','Color',Ax,'Interpreter','tex','FontSize',ft)
axis equal

set(figg,'LooseInset',get(figg,'TightInset'));
view(datF.Angle)

hold off
AxLim = axis;
drawnow;
saveas(h,sprintf('%s_initial',PBC),'epsc');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h=figure(2);
clf
hold on
colormap(datF.mapp)
axis(AxLim)
p1=LL(:,1);p2=LL(:,2);p3=LL(:,3);p0=[0 0 0]';
MyBoxFill(p0,p1,p2,p3,datF)                % main box

figg = gca;
set(figg, 'Visible', 'off');
MyGridPoints(L,datF)                        % netgrid

quiver3(0,0,center(3)-radius,0,0,radius*2,'Color',Ax,'LineWidth',lw)
quiver3(0,center(2)-radius,0,0,radius*2,0,'Color',Ax,'LineWidth',lw)
quiver3(center(1)-radius,0,0,radius*2,0,0,'Color',Ax,'LineWidth',lw)
text(0,0,center(3)+radius,'Z','Color',Ax,'Interpreter','tex','FontSize',ft)
text(0,center(2)+radius,0,'Y','Color',Ax,'Interpreter','tex','FontSize',ft)
text(center(1)+radius,0,0,'X','Color',Ax,'Interpreter','tex','FontSize',ft)
axis equal

view(Angle)

hold off
drawnow;
% saveas(h,sprintf('%s_before.png',PBC));
saveas(h,sprintf('%s_before',PBC),'epsc');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h = figure(3);
clf
hold on
colormap(datF.mapp)
axis(AxLim)
p1=L(:,1);p2=L(:,2);p3=L(:,3);p0=[0 0 0]';
MyBoxFill(p0,p1,p2,p3,datF)             % main box

figg = gca;
set(figg, 'Visible', 'off');
 
MyGridPoints(L,datF)                     % netgrid
 
quiver3(0,0,center(3)-radius,0,0,radius*2,'Color',Ax,'LineWidth',lw)
quiver3(0,center(2)-radius,0,0,radius*2,0,'Color',Ax,'LineWidth',lw)
quiver3(center(1)-radius,0,0,radius*2,0,0,'Color',Ax,'LineWidth',lw)
text(0,0,center(3)+radius,'Z','Color',Ax,'Interpreter','tex','FontSize',ft)
text(0,center(2)+radius,0,'Y','Color',Ax,'Interpreter','tex','FontSize',ft)
text(center(1)+radius,0,0,'X','Color',Ax,'Interpreter','tex','FontSize',ft)
axis equal

set(figg,'LooseInset',get(figg,'TightInset'));
view(Angle)
hold off

drawnow;
saveas(h,sprintf('%s_after',PBC),'epsc');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if isequal(PBC ,'r-kr')
    h=figure(4);
    clf
    hold on
    colormap(datF.mapp)
    axis(AxLim)
    p1=L(:,1);p2=L(:,2);p3=L(:,3);p0=[0 0 0]';
    MyBoxFill(p0,p1,p2,p3,datF)  %main box

    figg=gca;
    set(figg, 'Visible', 'off');

    MyGridPoints(L,datF)   % netgrid

    quiver3(0,0,center(3)-radius,0,0,radius*2,'Color',Ax,'LineWidth',lw)
    quiver3(0,center(2)-radius,0,0,radius*2,0,'Color',Ax,'LineWidth',lw)
    quiver3(center(1)-radius,0,0,radius*2,0,0,'Color',Ax,'LineWidth',lw)
    text(0,0,center(3)+radius,'Z','Color',Ax,'Interpreter','tex','FontSize',ft)
    text(0,center(2)+radius,0,'Y','Color',Ax,'Interpreter','tex','FontSize',ft)
    text(center(1)+radius,0,0,'X','Color',Ax,'Interpreter','tex','FontSize',ft)
    axis equal

    set(figg,'LooseInset',get(figg,'TightInset'));
    view(Angle-[Nbeta,0])
    hold off

    drawnow;
    saveas(h,sprintf('%s_after_axis_rotated',PBC),'epsc');

end