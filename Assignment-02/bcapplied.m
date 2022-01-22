function [Fg1, Kg1] = bcapplied(ND, BC,NDOF,NN,Fg,Kg)
for i = 1: ND 
   P = BC(i,2);
  Kg(P,:) =[];  
   Kg(:,P) =[]; 
   Kg1 = Kg
  Fg(P,:) = [];
  Fg1 = Fg
  
end
end

  