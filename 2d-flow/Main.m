
clear all;
rng('default');
epsilon = 1.1 ;                         % rate of the deformation of the background flow
flow = 'shear';                           % choose the type of the flow (i.e 'pef', or 'shear')
 
pbc = ParamPBC(flow, epsilon);   % get pbcs parameter

N = 100   ;                       % number of step in a period

dt = pbc.T/N    ;                % step size
Sigma =  pbc.Sigma;              % period of the stretch matrix
Y = pbc.Y;
Yoff = pbc.Yoff;
theta = 0*pbc.theta;
thetaNoPBC = theta;

n = 0;                          % Number of remappings
igif = 1; 
LL0 =  pbc.L0;

while igif <=1
    LLt = MyExp( Y*thetaNoPBC) *pbc.L0;                   % Lattice without remapping
    L = expm( n*pbc.Yoff )*MyExp( Y*theta) *pbc.L0;
    
    if  abs(abs(n)-1)<1e-8
        MyFigure(LL0,LLt,L,flow);                         % Plot the box with the remapping
        igif = igif +1;
    end
    
    theta1  = theta + Sigma*dt;                           % update the time
    theta = theta1  - round(theta1) ;
    thetaNoPBC = thetaNoPBC + Sigma*dt;
    n = n + theta-theta1   ;
end
