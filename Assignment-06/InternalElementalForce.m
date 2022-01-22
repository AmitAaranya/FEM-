% Internal forces in each element in local co-ordinate

function [IFV] = InternalElementalForce(Fo,LED,NDOF,NEN,NE,I,a,A,E)
nee = NDOF*NEN;
IFV = zeros(nee,NE); 
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
  
    ED = LED(:,i);
    EFo = Fo(:,i);
    
    R =Ke*ED - EFo;
    IFV(:,i) = IFV(:,i) + R;
    
end
 end
 
