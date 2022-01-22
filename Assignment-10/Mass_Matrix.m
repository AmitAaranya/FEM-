function [Mg] = Mass_Matrix(lm,NEN,NE,NN,NDOF,Density,CORD,ELECON,NGPm,Wim, Xim)
Mg = zeros(NN*NDOF);

nee = NDOF*NEN;
     
    for i = 1:NE
        Me0= zeros(NEN*NDOF);
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
        t = ELECON(i,NEN+2);

 % Shape Function'
syms xi  ita
  Nn = [(1-xi)*(1-ita)*(1/4),(1+xi)*(1-ita)*(1/4),(1+xi)*(1+ita)*(1/4), (1-xi)*(1+ita)*(1/4) ];
  
 Bj = [diff(Nn(1),xi) diff(Nn(2),xi) diff(Nn(3),xi) diff(Nn(4),xi) ; ...
      diff(Nn(1),ita) diff(Nn(2),ita) diff(Nn(3),ita) diff(Nn(4),ita)];
  Xn = [x1 y1; x2 y2; x3 y3 ; x4 y4 ];
  Ji = Bj* Xn; % Jacobian Matrix
 Nnn = [Nn(1) 0 Nn(2) 0 Nn(3) 0 Nn(4) 0;0 Nn(1) 0 Nn(2) 0 Nn(3) 0 Nn(4)];
  
  for ni = 1: NGPm  
      Wi = Wim(ni);
      xii = Xim(ni);
      for nj = 1: NGPm  
          Wj = Wim(nj);
          itaa = Xim(nj);
            
  N1 = subs(Nnn,xi,xii);
  N = subs(N1,ita,itaa);
  J1 = subs(Ji,xi,xii);
  J = subs(J1,ita,itaa);
  Det_J = det(J);
  
  
    Me0 = Me0 + vpa((Wi*Wj)*Density*(Det_J)*(N')*N*t);

      end
  end
 
  
   for j = 1:nee;
      jg = lm(i,j);
      
         for m = 1:nee;
             mg = lm(i,m);
      
                 Mg(jg,mg) = Mg(jg,mg)+ Me0(j,m);
        
        
    end
    end
    end
end