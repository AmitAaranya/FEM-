% AMIT KUMAR
% 2020AMA2257

clear all
clc
%% Question no - 2.1
% Number of Element = 1
% Fixed pinned boundary condition

finp = fopen('Assgn05_Que_2.1.txt','r');
[NN NE NM NP NGPk NGPf NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT BC, UVL, PLOAD] = assign051(finp);
[a AA Z E I WiF WiK XiF XiK ] = precalcu( NE, ELECON, CORD, MAT,NGPk, NGPf);
[lm] = dofmat(NE,ELECON,NEN,NDOF,CORD,MAT)
[Kg] = elementmat(CORD,lm,NEN,NE,NN,NDOF,NGPk,E,I,WiK,XiK,a)
 [Fg] = forceVector(CORD,NL,PLOAD,NDOF,NE,NEN,NN,NGPf,WiF,XiF,a,UVL,lm)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg)
u11 = linsolve(Kg1,Fg1)
[u] = displacementVector(u11,BC,NN,NDOF, ND)
u1 = [u];
R1 = Kg*u1-Fg
DeB1 = u1(2*NN-1)
SigmaA1_1 = round(((abs(R1(2))/Z))*10^-6 ,5)

%% Question no - 2.2
% Number of Element = 2
% Fixed pinned boundary condition

finp = fopen('Assgn05_Que_2.2.txt','r');
[NN NE NM NP NGPk NGPf NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT BC, UVL, PLOAD] = assign051(finp);
[a AA Z E I WiF WiK XiF XiK ] = precalcu( NE, ELECON, CORD, MAT,NGPk, NGPf);
[lm] = dofmat(NE,ELECON,NEN,NDOF,CORD,MAT)
[Kg] = elementmat(CORD,lm,NEN,NE,NN,NDOF,NGPk,E,I,WiK,XiK,a)
 [Fg] = forceVector(CORD,NL,PLOAD,NDOF,NE,NEN,NN,NGPf,WiF,XiF,a,UVL,lm)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg)
u11 = linsolve(Kg1,Fg1);
[u] = displacementVector(u11,BC,NN,NDOF, ND)
u2 = [u];
R2 = Kg*u2-Fg
DeB2 = u2(2*NN-1)
SigmaA1_2 = round(((abs(R2(2))/Z))*10^-6 ,5)

%% Question no - 2.3
% Number of Element = 4
%  Fixed pinned boundary condition

finp = fopen('Assgn05_Que_2.3.txt','r');
[NN NE NM NP NGPk NGPf NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT BC, UVL, PLOAD] = assign051(finp);
[a AA Z E I WiF WiK XiF XiK ] = precalcu( NE, ELECON, CORD, MAT,NGPk, NGPf);
[lm] = dofmat(NE,ELECON,NEN,NDOF,CORD,MAT)
[Kg] = elementmat(CORD,lm,NEN,NE,NN,NDOF,NGPk,E,I,WiK,XiK,a)
 [Fg] = forceVector(CORD,NL,PLOAD,NDOF,NE,NEN,NN,NGPf,WiF,XiF,a,UVL,lm)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg)
u11 = linsolve(Kg1,Fg1)
[u] = displacementVector(u11,BC,NN,NDOF, ND);
u3 = [u]
R3 = Kg*u3-Fg
DeB3 = u3(2*NN-1)
SigmaA1_3 = round(((abs(R3(2))/Z))*10^-6 ,5)

%% Question no - 2.4
% Number of Element = 6
%  Fixed pinned boundary condition

finp = fopen('Assgn05_Que_2.4.txt','r');
[NN NE NM NP NGPk NGPf NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT BC, UVL, PLOAD] = assign051(finp);
[a AA Z E I WiF WiK XiF XiK ] = precalcu( NE, ELECON, CORD, MAT,NGPk, NGPf);
[lm] = dofmat(NE,ELECON,NEN,NDOF,CORD,MAT)
[Kg] = elementmat(CORD,lm,NEN,NE,NN,NDOF,NGPk,E,I,WiK,XiK,a)
 [Fg] = forceVector(CORD,NL,PLOAD,NDOF,NE,NEN,NN,NGPf,WiF,XiF,a,UVL,lm)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg)
u11 = linsolve(Kg1,Fg1)
[u] = displacementVector(u11,BC,NN,NDOF, ND);
u4 = [u]
R4 = Kg*u4-Fg
DeB4 = u4(2*NN-1)
SigmaA1_4 = round(((abs(R4(2))/Z))*10^-6 ,5)

%% Ploting of result obtained againt the number of element

Ne = [1 2 4 6]; % Element arrey 
DeB= abs(10^3*[ DeB1 DeB2 DeB3 DeB4]);
SigmaA =[SigmaA1_1 SigmaA1_2 SigmaA1_3 SigmaA1_4]
subplot(2,1,1);
plot(Ne,DeB,'r-*')
title('Fixed pinned boundary condition problem')
xlabel('Number of element')
ylabel('Downward Deflection at point B (mm)')

subplot(2,1,2);
plot(Ne,SigmaA,'b--o')
ylabel('Maximum stress at section A (MPa)')

