% number of element = number of Column of LED matrix
% LED = LOCAL ELEMENTAL DISPLACMENT MATRIX

function [LED] = LocalDisp(u,NDOF,NEN,NE,lm)
nee = NDOF*NEN;
LED = zeros(nee,NE);
for i = 1:NE
    for j = 1:nee
        p = lm(i,j);
        LED(j,i) = LED(j,i)+ u(p,1);
    end
end
          
end