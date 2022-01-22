% AMIT KUMAR
% 2020AMA2257
clear all
clc
%% Question No - 01
% 
finp = fopen('Assgn07.1.txt','r');
[NN NE NM NP NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT BC PLOAD UDL ] = assign07(finp);
[ A E Mu] = precalcu( NE,NEN, ELECON, CORD, MAT);
[lm] = dofmat(NE,ELECON,NEN,NDOF)
[Kg] = elementmat(lm,NEN,NE,NN,NDOF,E,A,Mu,CORD,ELECON)
[Fg] = forceVector(CORD,NEUDL,UDL,NL,PLOAD,NDOF,NE,NEN,NN,lm)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg)
 u11 = linsolve(Kg1,Fg1)
[u] = displacementVector(u11,BC,NN,NDOF, ND);
u1 = u*1000 % Displacement vector in mm
R1 = Kg*u - Fg % Reactions in Global coordinates


%% Question - 02
%
finp = fopen('Assgn07.2.txt','r');
[NN NE NM NP NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT BC PLOAD UDL ] = assign07(finp);
[ A E Mu] = precalcu( NE,NEN, ELECON, CORD, MAT);
[lm] = dofmat(NE,ELECON,NEN,NDOF)
[Kg] = elementmat(lm,NEN,NE,NN,NDOF,E,A,Mu,CORD,ELECON)
[Fg] = forceVector(CORD,NEUDL,UDL,NL,PLOAD,NDOF,NE,NEN,NN,lm,ELECON)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg)
 u11 = linsolve(Kg1,Fg1)
[u] = displacementVector(u11,BC,NN,NDOF, ND);
u2 = u*1000 % Displacement vector in mm
R2 = Kg*u - Fg % Reactions in Global coordinates

%% OUTPUT
%%--------------- Writing Output -------------------------%%
% fout = fopen('Results.dat','wt');
fprintf('Results for Question Number 1 \n\n')
fprintf('Displacement\t  %6.7f mm\n',u1)
fprintf('\n')
fprintf(' Reaction\t    %6.2f Newtons\n',R1)
fprintf('\n\n')

fprintf('Results for Question Number 2 \n\n')
fprintf('Displacement\t  %6.7f mm\n',u2)
fprintf('\n')
fprintf(' Reaction\t    %6.2f Newtons\n',R2)
