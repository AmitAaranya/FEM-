function [Kg] = elementmat(lm,NEN,NE,NN,NDOF,E,CORD,ELECON,NGPk,WiK, XiK)
Kg = zeros(NN*NDOF);

nee = NDOF*NEN;
     
    for i = 1:NE
        Ke0= zeros(NEN*NDOF);
        LN = zeros(NEN,1);
        
         for r = 1:NEN
            LN(r) = ELECON(i,r+1);
         end
        x1 = CORD(LN(1),1);
        y1 = CORD(LN(1),2);
        x2 = CORD(LN(2),1);
        y2 = CORD(LN(2),2);
        x3 = CORD(LN(3),1);
        y3 = CORD(LN(3),2);
        x4 = CORD(LN(4),1);
        y4 = CORD(LN(4),2);
        
 % Shape Function'
syms xi  ita
  N = [(1-xi)*(1-ita)*(1/4);(1+xi)*(1-ita)*(1/4);(1+xi)*(1+ita)*(1/4); (1-xi)*(1+ita)*(1/4) ];
  
 BB = [diff(N(1),xi) diff(N(2),xi) diff(N(3),xi) diff(N(4),xi) ; ...
      diff(N(1),ita) diff(N(2),ita) diff(N(3),ita) diff(N(4),ita)];
  Xn = [x1 y1; x2 y2; x3 y3 ; x4 y4 ];
  Ji = BB* Xn; % Jacobian Matrix
  Det_J = det(Ji);
  inV_J = inv(Ji);
  Bi = inV_J* BB ;
  
  
  for ni = 1: NGPk  
      Wi = WiK(ni);
      xii = XiK(ni);
      for nj = 1: NGPk  
          Wj = WiK(nj);
          itaa = XiK(nj);
          
          B = subs(Bi,xi,xii);
          B = subs(B,ita,itaa);
          DetJ = subs(Det_J,xi,xii);
          DetJ = subs(DetJ,ita,itaa) ; 
 
   D =E*[1 0 ; 0 1];  % E = conductivity 
   
    Ke0 = Ke0 + vpa((Wi*Wj)*DetJ*B'*D*B);

      end
  end
 
  Ke = Ke0;
  
   for j = 1:nee;
      jg = lm(i,j);
      
         for m = 1:nee;
             mg = lm(i,m);
      
                 Kg(jg,mg) = Kg(jg,mg)+ Ke(j,m);
        
        
    end
    end
    end
end
 
    
 
    