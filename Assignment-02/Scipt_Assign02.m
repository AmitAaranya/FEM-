clear all;
clc;

infile = fopen('Assignment_02.txt','r');
[NN NE NM NP NIP NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON BC PLOAD UDL MAT] = assign02(infile)
[a E A] = precalcu( NE, ELECON, CORD, MAT)
[lm] = dofmat(NE,ELECON,NEN,NDOF)
 [Kg] = elementmat(NN,NE,lm,E,A,a,NDOF,NEN)
 Fg = globalforce(NDOF,NL,NN,PLOAD)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg);
 u1 = linsolve(Kg1,Fg1);
u = [0; u1]
  R = Kg*u - Fg