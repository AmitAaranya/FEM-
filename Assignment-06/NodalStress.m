function [Sigma] = NodalStress(LED,NEN,E,NE,a)
Sigma = zeros(2*NEN,NE);  % 2 - Axial Stress & Bending Stress 

for i = 1:NE
    an = a(i);
syms xi
B = [-1 0 0 1 0 0; 0 (6*xi/an) (3*xi-1) 0 -(6*xi/an) (3*xi+1)]/an ;
DisplaceMentV = LED(:,i);
BB = [subs(B,xi,-1);subs(B,xi,1)] ;   
SigmaE = E*BB*DisplaceMentV;
Sigma(:,i) = Sigma(:,i)+SigmaE;
end
Sigma = vpa(Sigma);
end
% Element number [Coulumn number)
% Axial stress at local node 1
% Bending stress at local node 1
% Axial stress at local node 2
% Bending stress at local node 2
