% AMIT KUMAR
% 2020AMA2257
clear all
clc
% Question

finp = fopen('Assgn09.txt','r');
[NN NE NM NP NGPk NGPf NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT BC...
    PLOAD UDL ] = assign09(finp);
[E WiF WiK XiF XiK ] = precalcu( NE,NEN, ELECON, CORD, MAT ,NGPk, NGPf);
[lm] = dofmat(NE,ELECON,NEN,NDOF);
[Kg] = elementmat(lm,NEN,NE,NN,NDOF,E,CORD,ELECON,NGPk,WiK, XiK)
[Fg] = forceVector(CORD,NEUDL,UDL,NL,PLOAD,NDOF,NE,NEN,NN,lm,ELECON,NGPf,WiF,XiF)
[Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg);
 T11 = linsolve(Kg1,Fg1);
[T] = Temp_at_Global_Node(T11,BC,NN,NDOF, ND)
[Contour_Plot] = ContourPlot(T,CORD,NN)      % Contour Ploting 
[TLN] = Temp_at_LocalNode(T,NDOF,NEN,NE,lm);  % Temp at LocalNode of an element

% Resulting Heat Flux at GaussPoints of an element in X & Y direction
[HeatFlux_GP] = HeatFluxAtGaussP(TLN,NEN,E,NGPk,CORD,ELECON,NE,XiK);
[HeatFlux_Node] = HeatFlux_AtNode(HeatFlux_GP);

%%  Printing Results %%

fprintf('................Results.................\n\n')
fprintf('Node number\t Temperature(degree)\n')
fprintf('%d\t           %1.3f\n',[(1:NN)',T]')
fprintf('\n')
% fprintf('.....Net Heat Flux at Gauss Point........\n')
% fprintf('\t    \t  q(x)  \t  q(y)')
% fprintf('\n')
% fprintf('%d\t    %f\t  %f\n',[1:4*NE;HeatFlux_GP])




