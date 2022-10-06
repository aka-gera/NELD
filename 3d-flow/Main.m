
clear all;
rng('default'); 
epsilon = 1.1;                                % rate of the deformation of the background flow
flow = 'r-kr';                                % choose the type of the flow (i.e 'r-kr' or 'dob') 

pbc = ParamPBC(flow, epsilon);                % get pbcs parameter

N = 10   ;                                    % number of step in a period 
dt = pbc.T/N    ;                             % step size
Sigma =  pbc.Sigma;                           % period of the stretch matrix
Y = pbc.Y;
Yoff = pbc.Yoff;

theta = -.5*pbc.theta;
thetaNoPBC = theta; 
n = 0;                                       % number of remappings
igif = 1; 
LL0 =  MyExp( Y*thetaNoPBC) *pbc.L0;

while igif <=1
    LLt = MyExp( Y*thetaNoPBC) *pbc.L0;                       % Lattice without remapping
    L = expm( n(1)*pbc.Yoff )*MyExp( Y*theta) *pbc.L0;
 
    if  abs(abs(n(1))-1)<1e-8 
        Nbeta = n(1)*pbc.Yoff(1,2)*180/pi;
        MyFigure(LL0,LLt,L,Nbeta,flow);                       % Plot the box with the remapping
        igif = igif +1;
    end

    theta1  = theta + Sigma*dt;                               % update the time
    theta = theta1  - round(theta1);
    thetaNoPBC = thetaNoPBC + Sigma*dt;                        
    n = n+ theta-theta1   ;
end
