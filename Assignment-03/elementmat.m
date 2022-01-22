function [Kg] = elementmat(lm,NDOF,NEN,NN,NE,O,E,A,a)
     
    Kg = zeros(NN*NDOF)
     nee = NDOF*NEN
    for i = 1:NE;
    thetha = O(i);
    l = cos(thetha)
    m = sin(thetha)
   Ke = ((A(i)* E(i))/a(i))*[l^2 l*m -l^2 -l*m; l*m m^2 -l*m -m^2; -l^2 -l*m l^2 l*m; -l*m -m^2 l*m m^2]        
   
  for j = 1:nee
      jg = lm(i,j);
      
         for m = 1:nee
             mg = lm(i,m);
      
                 Kg(jg,mg) = Kg(jg,mg)+ Ke(j,m);
        
        
    end
    end
    
    
    end
    
end
