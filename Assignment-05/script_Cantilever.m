% AMIT KUMAR
% 2020AMA2257

clear all
clc
%% Question no - 01.1
% Number of Element = 1
% Cantilever Beam

finp = fopen('Assgn05_Que_1.1.txt','r');
[NN NE NM NP NGPk NGPf NDIM NEN NDOF ND NL NEUDL NRC NEUVL CORD ELECON MAT BC UDL UVL PLOAD] = assign051(finp)
[a E I WiF WiK XiF XiK ] = precalcu( NE, ELECON, CORD, MAT,NGPk, NGPf)
[lm] = dofmat(NE,ELECON,NEN,NDOF,CORD,MAT)
[Kg] = elementmat(CORD,lm,NEN,NE,NN,NDOF,NGPk,E,I,WiK,XiK,a)
 [Fg] = forceVector(CORD,NL,PLOAD,NDOF,NE,NEN,NN,NGPf,WiF,XiF,a,UVL,lm,NEUVL,NEUDL,UDL)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg)
u11 = linsolve(Kg1,Fg1)
[u] = displacementVector(u11,BC,NN,NDOF, ND);
u1 = [u]
R1 = Kg*u1-Fg
% DeB1 = u1(2*NN-1)
% SigmaA1_1 = round(((abs(R1(2))/Z))*10^-6 ,5)



