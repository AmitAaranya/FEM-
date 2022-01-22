   % AMIT KUMAR
% 2020AMA2257
clear all
clc

finp = fopen('Practice01.txt','r');
[NN NE NM NP NGPk NGPf NDIM NEN NDOF ND NIBC NL NEUDL NRC CORD ELECON MAT BC,IBC,...
    PLOAD ,UDL, UVL] = assign06(finp)
[a A E O I WiF WiK XiF XiK  ] = precalcu( NE, ELECON, CORD, MAT,NGPk, NGPf);
[lm] = dofmat(NE,ELECON,NEN,NDOF)
[Kg] = elementmat(lm,NEN,NE,NN,NDOF,E,I,a,O,A,NIBC,IBC)
[Fg,Fo] = forceVector(CORD,NEUDL,UDL,NL,PLOAD,NDOF,NE,NEN,NN,NGPf,WiF,XiF,a,UVL,lm,O,NIBC,IBC)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg)
u11 = linsolve(Kg1,Fg1)
[u] = displacementVector(u11,BC,NN,NDOF, ND)
R = Kg*u - Fg % Reactions in Global coordinates
[LED] = LocalDisp(u,NDOF,NEN,NE,O,IBC,NIBC,lm) % Displcement vector in LOCAL axis.
[IFV] = InternalElementalForce(Fo,LED,NDOF,NEN,NE,I,a,A,E)% Internal forces in each element in Local co
% [Sigma] = NodalStress(LED,NEN,E,NE,a) % Stress at nodal point of element
% [Max_Sigma] = MaximumStess(Sigma,NE,NEN) % Absolute Maximum stress in each element(Pa)