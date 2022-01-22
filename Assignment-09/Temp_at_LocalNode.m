% number of element = number of Column of LED matrix
% LED = LOCAL ELEMENTAL DISPLACMENT MATRIX

function [TLN] = Temp_at_LocalNode(T,NDOF,NEN,NE,lm)
nee = NDOF*NEN;
TLN = zeros(nee,NE);
for i = 1:NE
    for j = 1:nee
        p = lm(i,j);
        TLN(j,i) = TLN(j,i)+ T(p,1);
    end
end
          
end