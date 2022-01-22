function [Kg] = elementmat(lm,NEN,NE,NN,NDOF,E,I,a,O,A,NIBC,IBC)
Kg = zeros(NN*NDOF);
     nee = NDOF*NEN
    for i = 1:NE
        an = a(i);
        An = A(i);
        In = I(i);
Ke = E*[ An/an 0 0 -An/an 0 0 ;...
        0 (12*In/an^3) (6*In/an^2) 0 -(12*In/an^3) (6*In/an^2);...
        0 (6*In/an^2) (4*In/an) 0 -(6*In/an^2) (2*In/an);...
        -An/an 0 0 An/an 0 0 ;...
        0 -(12*In/an^3) -(6*In/an^2) 0 (12*In/an^3) -(6*In/an^2);...
        0 (6*In/an^2) (2*In/an) 0 -(6*In/an^2) (4*In/an)];
  

l = cos(O(i))
 m = sin(O(i))
% syms l m 
cc = 1:NIBC
if i == IBC(cc,1)
   for c = 1:NIBC
    if IBC(c,2) == 1
     L = [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 l m 0; 0 0 0 -m l 0; 0 0 0 0 0 1]
    elseif IBC(c,2)==2
     L =  [l m 0 0 0 0; -m l 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1]
    end
   end

else
 L = [l m 0 0 0 0; -m l 0 0 0 0; 0 0 1 0 0 0; 0 0 0 l m 0; 0 0 0 -m l 0; 0 0 0 0 0 1]
end





Ke = L'*Ke*L
   
  for j = 1:nee;
      jg = lm(i,j);
      
  for m = 1:nee;
      mg = lm(i,m);
      
      Kg(jg,mg) = Kg(jg,mg)+ Ke(j,m);
        
        
    end
    end
    end
    
    
    end
    