 function [Kg] = elementmat(lm,NEN,NE,NN,NDOF,E,A,Mu,CORD,ELECON)
Kg = zeros(NN*NDOF);
     nee = NDOF*NEN;
    for i = 1:NE
        LN = zeros(NEN,1);
        An = A(i); % A = Area of an element
           
    for r = 1:NEN
        LN(r) = ELECON(i,r+1);
    end
    x1 = CORD(LN(1),1);
    y1 = CORD(LN(1),2);
    x2 = CORD(LN(2),1);
    y2 = CORD(LN(2),2);
    x3 = CORD(LN(3),1);
    y3 = CORD(LN(3),2);
    t = ELECON(i,5);
    B = (0.5/An)*[(y2-y3) 0 (y3-y1) 0 (y1-y2) 0;...
        0 -(x2-x3) 0 -(x3-x1) 0 -(x1-x2);...
        -(x2-x3) (y2-y3) -(x3-x1) (y3-y1) -(x1-x2) (y1-y2)];
%     D = [(1-Mu) Mu 0; Mu (1-Mu) 0; 0 0 0.5*(1-2*Mu)]*E/((1+Mu)*(1-2*Mu)); % Plain Strain Condition
   D =(E/(1-Mu^2))*[1 Mu 0; Mu 1 0 ; 0 0 0.5*(1-Mu)];  % Plain stress conditions
    Ke = B'*D*B*An*t;

   
  for j = 1:nee;
      jg = lm(i,j);
      
  for m = 1:nee;
      mg = lm(i,m);
      
      Kg(jg,mg) = Kg(jg,mg)+ Ke(j,m);
        
        
    end
    end
    end
 end
 
    
 
    