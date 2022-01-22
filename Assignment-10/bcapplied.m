function [Mg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Mg,Kg)
 zz = zeros(ND,1);
for i = 1:ND
    z= BC(i,1);
    q = BC(i,2);
   zz(i) = NDOF*(z-1)+q;
 end

Kg(:,zz) = [];
Kg(zz,:) = [];
Kg1=Kg;

Mg(:,zz) = [];
Mg(zz,:) = [];
Mg1 = Mg;
  
end

  