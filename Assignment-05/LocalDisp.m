% Displacment matrix in term of Local cordinates.
% number of element = number of Column of LED matrix
% LED = LOCAL ELEMENTAL DISPLACMENT MATRIX

function [LED] = LocalDisp(u,NDOF,NEN,NE,lm)
nee = NDOF*NEN;
LED = zeros(nee,NE);
for i = 1:NE
    LE = zeros(nee,1);
    for z = 1:nee;
        LE(z) = u(lm(i,z));
    end
    


  LED(:,i) = LED(:,i)+ LE;
   
end
end
