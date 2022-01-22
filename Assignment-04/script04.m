% AMIT KUMAR
% 2020AMA2257

clear all
clc

finp = fopen('Assignment_04.txt','r');
[NN NE NM NP NGPk NGPf NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT XiK WiK XiF WiF] = assign04(finp);
 [a E I] = precalcu( NE, ELECON, CORD, MAT);
[Ke] = elementmat(NN,NDOF,NGPk,E,I,WiK,XiK,a)
 Fe = forceVector(NDOF,NN,NGPf,WiF,XiF,a)
[CKe CFe] = ClosedForm(E,I,a)