function dat =paramFig(PBC)
 
xmax = 5;                            % size of x dimension of graph
ymax = 5;                            % size of y dimension of graph
zmax = 5;                            % size of z dimension of graph

aa = xmax ;
bb = ymax ;
cc = zmax ; 
[x,y,z] = meshgrid(-aa:aa, -bb:bb, -cc:cc);
dat.PP = [x(:), y(:), z(:)]  ;      % grid  

mm =100; 
lSpace = linspace(1,exp(1),mm)';
II =  ones(mm,1);
I0 =  zeros(mm,1);
III = II- log(lSpace) ;
dat.mapp =[II III III ];
 
dat.Angle = [105,25]; 
dat.MainBoxColor = [1 0 0];                 % Main Box  color
dat.MainBoxEdge = '-';                       
dat.MainBoxOpaque = 1;                      % Main Box opacity
dat.MainBoxMarkerWidth = 1;                 % Main Marker and Box Edge width


dat.GridEdge = 'o';
dat.GridColor = [0 0 0];                    % Grid color
dat.GridMarkerWidth =  2;                   % Marker and Box Edge width


dat.ft = 20;                                % font size
dat.AxisWidth = 3;                          % Axis marker width
dat.AxisColor = 'b';                        % Axis color

dat.aa = 15;
dat.bb = 1;
switch PBC
    case 'shear'        %GenKR

        dat.mapp =[II I0 I0 ];
        dat.Angle = [0,90];
        
        dat.posTextX = -2;
        dat.posTextY = 4;
        dat.posTextZ =  7;

        dat.aa = 0;
        dat.bb = 20;

        dat.xmin = -1.1;
        dat.xmax = 2.1;
        dat.ymin = -1.01;
        dat.ymax = 2.01;
        dat.zmin = -1.9;
        dat.zmax = 1.17; 
        
        dat.center = [0 ;0;1];
        dat.radius = 1.5;
        dat.centerOff = 0; 
        
    case 'pef'        %GenKR

        dat.mapp =[II I0 I0 ];
        dat.Angle = [180,90];
        
        dat.posTextX = 0;
        dat.posTextY = -5;
        dat.posTextZ =  7;

        dat.aa = 0;
        dat.bb = 20; 
        dat.xmin = -2.7;
        dat.xmax = 2.3;
        dat.ymin = -1.7;
        dat.ymax = 1.7;
        dat.zmin = -1.9;
        dat.zmax = 1.17; 
        
        dat.center = [-0.75 ;-0.3;1];
        dat.radius = -1.75;
        dat.centerOff =0.4; 
end
 
dat.Axi = [dat.xmin dat.xmax dat.ymin dat.ymax dat.zmin dat.zmax];