function [Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg)
 zz = zeros(ND,1)
for i = 1:ND
    z= BC(i,1)
    q = BC(i,2)
   zz(i) = 2*(z-1)+q
 end

Kg(:,zz) = [];
Kg(zz,:) = [];
Kg1=Kg

Fg(zz,:) = [];
Fg1 = Fg
  
end

  