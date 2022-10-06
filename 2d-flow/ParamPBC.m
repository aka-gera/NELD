function pbc = ParamPBC(flow, epsilon)
 
switch flow
    case 'shear'         % shear flow case with LE
        A = epsilon*[0 1 0;0 0 0;0 0 0];
        invL0 =eye(3); 
        Y = A;
        Yoff = zeros(3);
        theta = 1;
        Sigma = A(1,2);
    case 'pef'           % PEF case with KR
        A = epsilon*[-1 0 0;0 1 0;0 0 0];
        M = [2 -1 0;-1 1 0;0  0 1] ;
        [V,~] = eig(M);
        V = V(:,[1 3 2]) ; 
        Y = log(diag(V\M*V)) ;
        Yoff = zeros(3);
        invL0 = V/ abs(det(V))^(1/2);
        theta = 1;
        Sigma = A(1,1)/Y(1,1); 
end

pbc.invL0 = invL0;
pbc.L0 = inv(invL0);
pbc.A = A;
pbc.Y = Y;
pbc.Yoff = Yoff;
pbc.Sigma = Sigma;
pbc.T = 1/abs(Sigma);
pbc.theta = theta;