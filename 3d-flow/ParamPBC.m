function pbc= ParamPBC(flow, epsilon) 

switch flow 
    case 'r-kr'                   % R-KR

        A = epsilon*[1 0 0;0 1 0; 0 0 -2];
        M = [0 -2 1;1 1 0;0 1 0];
        [V,J] = eig(M);
        S = [1 1 0;-1i 1i 0;0 0 1];
        Jreal = S*J/(S);
        Vreal = V/(S); 
        H = real(logm(Jreal));
        Hdiag = diag(H);
        Hoff = H - diag(Hdiag);
        invL0 = Vreal/ abs(det(Vreal))^(1/3);
        Y = Hdiag ;
        Yoff = Hoff;
        theta = 1;
        Sigma = A(1,1)/H(1,1);

    case 'dob'                    % GenKR

        A = epsilon*[1 0 0;0 1 0; 0 0 -2];  
        M1 = [1 1 1;1 2 2;1 2 3];
        M2 = [2 -2 1;-2 3 -1;1 -1 1]; 
        [V,~] = eig(M1);
        JJ1 = log(diag(V\M1*V));JJ2=log(diag(V\M2*V));
        Y = [JJ1 JJ2];
        Yoff = zeros(3);
        invL0 = V/ abs(det(V))^(1/3);
        theta = [1;1];
        Sigma = Y\diag(A); 
end

pbc.invL0 = invL0;
pbc.L0 = inv(invL0);
pbc.A = A;
pbc.Y = Y;
pbc.Yoff = Yoff;
pbc.Sigma = Sigma;
pbc.T = 1/abs(Sigma(1));
pbc.theta = theta;