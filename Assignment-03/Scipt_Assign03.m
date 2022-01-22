% AMIT KUMAR (2020AMA2257)


clear all;
clc;

infile = fopen('Assignment_04.txt','r');
[NN NE NM NP NIP NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON BC PLOAD UDL MAT] = assign03(infile)
[a E A O] = precalcu( NE, ELECON, CORD, MAT)
[lm] = dofmat(NE,ELECON,NEN,NDOF,CORD,MAT)
[Kg] = elementmat(lm,NDOF,NEN,NN,NE,O,E,A,a)
Fg = globalforce(NDOF,NL,NN,PLOAD)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg);
u11 = linsolve(Kg1,Fg1)
[u] = displacementVector(u11,BC,NN,NDOF,ND)
R = Kg*u - Fg
[LED] = LocalDisp(u,NDOF,NEN,NE,O,lm)
[Force_Member] = ForceInMember(LED,NE,NEN,NDOF,A,E,a)