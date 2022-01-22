% Displacment matrix in term of Local cordinates.
% number of element = number of Column of LED matrix
% LED = LOCAL ELEMENTAL DISPLACMENT MATRIX

function [LED] = LocalDisp(u,NDOF,NEN,NE,O,lm)
nee = NDOF*NEN;
LED = zeros(nee,NE);
for i = 1:NE
    LE = zeros(nee,1);
    for z = 1:nee;
        LE(z) = u(lm(i,z));
    end
    
    
  l = cos(O(i));
 m = sin(O(i));

 L = [l m 0 0; -m l 0 0;0 0 l m;0 0 -m l];



LE0 = L*LE;

  LED(:,i) = LED(:,i)+ LE0;
   
end
end
