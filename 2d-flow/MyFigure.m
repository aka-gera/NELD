function  MyFigure(LL0,LL,L,PBC)

datF =paramFig(PBC);

center = datF.center;
radius = datF.radius;
centerOff = datF.centerOff;
Angle = datF.Angle;
AxLim = datF.Axi;
ft = datF.ft;
lw = datF.AxisWidth;
Ax =datF.AxisColor;

LX = LL0;
h=figure(1);
clf
hold on
colormap(datF.mapp)
p1=LX(:,1);p2=LX(:,2);p3=LX(:,3);p0=[0 0 0]';
MyBoxFill(p0,p1,p2,p3,datF)          % main box

axis(datF.Axi)
figg = gca;
set(figg, 'Visible', 'off');
 
MyGridPoints(LX,datF)                % grid points 

quiver3(0,center(2)-radius,0,0,radius*2,0,'Color',Ax,'LineWidth',lw)
quiver3(center(1)-radius,0,0,radius*2,0,0,'Color',Ax,'LineWidth',lw)
text(0+centerOff,center(2)+radius+centerOff,0,'Y','Color',Ax,'Interpreter','tex','FontSize',ft)
text(center(1)+radius,0,0,'X','Color',Ax,'Interpreter','tex','FontSize',ft)
axis equal
set(figg,'LooseInset',get(figg,'TightInset'));
view(Angle)

hold off
drawnow;
saveas(h,sprintf('%s_initial_box',PBC),'epsc');
% saveas(h,sprintf('%s_initial_box',PBC),'fig');


LX = LL;
h=figure(2);
clf
hold on
colormap(datF.mapp)
p1=LX(:,1);p2=LX(:,2);p3=LX(:,3);p0=[0 0 0]';
MyBoxFill(p0,p1,p2,p3,datF)      % main box

figg=gca;
set(figg, 'Visible', 'off');
MyGridPoints(LX,datF)              % grid points
 
quiver3(0,center(2)-radius,0,0,radius*2,0,'Color',Ax,'LineWidth',lw)
quiver3(center(1)-radius,0,0,radius*2,0,0,'Color',Ax,'LineWidth',lw)
text(0+centerOff,center(2)+radius+centerOff,0,'Y','Color',Ax,'Interpreter','tex','FontSize',ft)
text(center(1)+radius,0,0,'X','Color',Ax,'Interpreter','tex','FontSize',ft)
view(datF.Angle)
axis(AxLim)

hold off
drawnow;
saveas(h,sprintf('%s_before',PBC),'epsc');
% saveas(h,sprintf('%s_before',PBC),'fig');


LX = L;
h=figure(3);
clf
hold on
figg=gca;
set(figg, 'Visible', 'off');

colormap(datF.mapp)
axis(AxLim)
p1=LX(:,1);p2=LX(:,2);p3=LX(:,3);p0=[0 0 0]';
MyBoxFill(p0,p1,p2,p3,datF)      % main box 
MyGridPoints(LX,datF)              % grid points 

quiver3(0,center(2)-radius,0,0,radius*2,0,'Color',Ax,'LineWidth',lw)
quiver3(center(1)-radius,0,0,radius*2,0,0,'Color',Ax,'LineWidth',lw)
text(0+centerOff,center(2)+radius+centerOff,0,'Y','Color',Ax,'Interpreter','tex','FontSize',ft)
text(center(1)+radius,0,0,'X','Color',Ax,'Interpreter','tex','FontSize',ft)
axis equal

set(figg,'LooseInset',get(figg,'TightInset'));
view(Angle)
hold off

drawnow;
saveas(h,sprintf('%s_after',PBC),'epsc');
% saveas(h,sprintf('%s_after',PBC),'fig');

