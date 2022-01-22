function [Kg] = elementmat(NN,NE,lm,E,A,a,NDOF,NEN)

    Kg = zeros(NN);
    nee = NEN*NDOF;
for i = 1:NE ;
    
        
        Ke = ((A(i)* E(i))/a(i))*[1 -1; -1 1];
        
        for j = 1:nee
      jg = lm(i,j);
      
         for m = 1:nee
             mg = lm(i,m);
      
                 Kg(jg,mg) = Kg(jg,mg)+ Ke(j,m);
        
        
    end
    end
    end
    
    
end
