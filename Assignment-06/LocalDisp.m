% Displacment matrix in term of Local cordinates.
% number of element = number of Column of LED matrix
% LED = LOCAL ELEMENTAL DISPLACMENT MATRIX

function [LED] = LocalDisp(u,NDOF,NEN,NE,O,IBC,NIBC,lm)
nee = NDOF*NEN;
LED = zeros(nee,NE);
for i = 1:NE
    LE = zeros(nee,1);
    for z = 1:nee;
        LE(z) = u(lm(i,z));
    end
    
  l = cos(O(i));
 m = sin(O(i));
% syms l m 
cc = 1:NIBC
if i == IBC(cc,1)
   for c = 1:NIBC
    if IBC(c,2) == 1
     L = [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 l m 0; 0 0 0 -m l 0; 0 0 0 0 0 1];
    elseif IBC(c,2)==2
     L =  [l m 0 0 0 0; -m l 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1];
    end
   end

else
 L = [l m 0 0 0 0; -m l 0 0 0 0; 0 0 1 0 0 0; 0 0 0 l m 0; 0 0 0 -m l 0; 0 0 0 0 0 1];
end


LE = L*LE;

  LED(:,i) = LED(:,i)+ LE;
   
end
end
