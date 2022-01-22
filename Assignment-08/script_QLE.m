% AMIT KUMAR
% 2020AMA2257
clear all
clc
%% Question No - 01

finp = fopen('Assgn08.txt','r');
[NN NE NM NP NGP NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT BC...
    PLOAD UDL ] = assign08(finp);
[E Mu WiF WiK XiF XiK ] = precalcu( NE,NEN, ELECON, CORD, MAT ,NGP);
[lm] = dofmat(NE,ELECON,NEN,NDOF);
[Kg] = elementmat(lm,NEN,NE,NN,NDOF,E,Mu,CORD,ELECON,NGP,WiK, XiK)
[Fg] = forceVector(CORD,NEUDL,UDL,NL,PLOAD,NDOF,NE,NEN,NN,lm,ELECON)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg);
 u11 = linsolve(Kg1,Fg1);
[u] = displacementVector(u11,BC,NN,NDOF, ND)
u1 = u*1000; % Displacement vector in mm
R = Kg*u - Fg % Reactions in Global coordinates
[LED] = LocalDisp(u,NDOF,NEN,NE,lm) % LOCAL ELEMENTAL DISPLACMENT MATRIX
[Sigma_GP] = stressAtGaussP(LED,NEN,E,Mu,NGP,CORD,ELECON,NDOF,NE,XiK)
% Coulumn of Sigma matrix reprentes [ Sigma_xx ,Sigma_yy , Sigma_xy]
[Sigma_Node] = StressAtNode(Sigma_GP,NE,NEN,NGP) % stress at nodes
Sigma_GP1 = Sigma_GP*10^-6;
Sigma_Node1 = Sigma_Node*10^-6;
%% OUTPUT
%%--------------- Writing Output -------------------------%%
% fout = fopen('Results.dat','wt');
fprintf('x..................Results.....................x \n\n')
fprintf('Displacement\t  %6.7f mm\n',u1)
fprintf('\n')
fprintf(' Reaction\t    %6.2f Newtons\n',R)
fprintf('\n\n')

fprintf('..........Stress at Gauss points (MPa) ............\n')
fprintf('\tSigma_xx\t \tSigma_yy\t \tSigma_xy\n')
fprintf('\t%0.2f\t\t \t%0.2f\t\t \t%0.2f\n',Sigma_GP1)
fprintf('\n')
fprintf('..........Stress at Nodal points (MPa) ............\n')
fprintf('\tSigma_xx\t \tSigma_yy\t \tSigma_xy\n')
fprintf('\t%0.2f\t\t \t%0.2f\t\t \t%0.2f\n',Sigma_Node1)
