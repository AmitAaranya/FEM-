% AMIT KUMAR
% 2020AMA2257
clear all 
clc

finp = fopen('Assgn10.txt','r');
[NN NE NM NP NGPk NGPm NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT BC...
    PLOAD UDL ] = assign10(finp);
[E Mu Density Wim WiK Xim XiK ] = precalcu( NE,NEN, ELECON, CORD, MAT ,NGPk,NGPm);
[lm] = dofmat(NE,ELECON,NEN,NDOF);
[Kg] = elementmat(lm,NEN,NE,NN,NDOF,E,Mu,CORD,ELECON,NGPk,WiK, XiK);
[Mg] = Mass_Matrix(lm,NEN,NE,NN,NDOF,Density,CORD,ELECON,NGPm,Wim, Xim);
[Mg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Mg,Kg); % Appling Boundary conditions

% Calculating Eigen Values and Eigen Vectors
[Natural_Fre, EigenVector ] = Frequencies(Kg1,Mg1,NN,NDOF,ND,BC);
Natural_Frequency_Hz = Natural_Fre
Mode_shapes = EigenVector


%%------------------------ Results Printing-------------------------------%

Print = fopen('Results.txt','wt');
fprintf(Print,'----------------------- Results -------------------------\n');
fprintf(Print,'First Five Natural frequencies & corresponding mode-Shapes\n\n');
fprintf(Print,'Eigen value(Hz)\n');
fprintf(Print,'\n');
fprintf(Print,'%5.2f\t\t',Natural_Fre(1:5));
fprintf(Print,'\n\n');
fprintf(Print,'Corresponding Mode-Shapes\n\n');
fprintf(Print,'%1.4f\t\t%1.4f\t\t%1.4f\t\t%1.4f\t\t%1.4f\n',EigenVector(:,1:5)') ;

fclose(finp);
fclose(Print);

