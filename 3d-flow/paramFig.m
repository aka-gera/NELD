function dat =paramFig(PBC)

 
xmax = 5;                    % size of x dimension of graph
ymax = 5;                    % size of y dimension of graph
zmax = 5;                    % size of z dimension of graph

aa = xmax ;
bb = ymax ;
cc = zmax ;

% [x,y,z] = meshgrid(-(aa-1):(aa), -(bb-1):bb, -(cc-1):cc);
% dat.P = [x(:), y(:), z(:)]  ;  % grid
[x,y,z] = meshgrid(-(aa-1):(aa-1), -(bb-1):(bb-1), -(cc-1):(cc-1)); 

dat.PP = [x(:), y(:), z(:)]  ;              % grid 


mm = 100; 
lSpace = linspace(1,exp(1),mm)';
II =  ones(mm,1); 
III = II- log(lSpace) ;
dat.mapp =[II III III ]; 

dat.Angle = [105,25]; 

dat.MainBoxColor = [1 0 0];                 % Main Box color
dat.MainBoxEdge = '-';                      
dat.MainBoxOpaque = 1;                      % Main Box opacity
dat.MainBoxMarkerWidth = 1;                 % Main Marker and Box Edge width


dat.GridEdge = 'o';
dat.GridColor = [0 0 0];                    % Grid color
dat.GridMarkerWidth = 0.1;                  % Marker and Box Edge width


dat.ft = 20;                                % font size
dat.AxisWidth = 3;                          % Axis marker width
dat.AxisColor = 'b';                        % Axis color

dat.aa = 15;
dat.bb = 1;
switch PBC  
    case 'r-kr'          %Rotating Box

        % Title position
        dat.posTextX = 0;
        dat.posTextY = -9;
        dat.posTextZ =  11;


        aa = xmax+2.8 ;
        bb = ymax+3.3 ;
        cc = zmax+1.3 ;

        dat.center = [0.5;0;1];
        dat.radius = 2; 

    case 'dob'        %GenKR

        % Title position
        dat.posTextX = 0;
        dat.posTextY = -3;
        dat.posTextZ =  7;

        aa = xmax+2.8 ;
        bb = ymax+1.3 ;
        cc = zmax+1.3 ;

        dat.center = [0;0;1.6];
        dat.radius = 2.2; 
end
 
dat.xmax = aa;
dat.ymin = -bb;
dat.ymax = bb;
dat.zmin = -(cc-1.7);
dat.zmax = cc;
dat.Axi =3.0*[-1 1 -1 1 -1 1];
% dat.Axi =zz+ [dat.xmin dat.xmax dat.ymin dat.ymax dat.zmin dat.zmax];