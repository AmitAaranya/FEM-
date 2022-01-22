 function [HeatFlux_GP] = HeatFluxAtGaussP(TLN,NEN,E,NGPk,CORD,ELECON,NE,XiK)
 % Coulumn of Sigma matrix reprentes [ Sigma_xx ,Sigma_yy , Sigma_xy] at a
 % perticular Gauss point
 Q = 0;
 HeatFlux_GP = zeros(2,NE*NGPk*NGPk);  % Initiate matrix for stress at gauss point.
 for i = 1:NE
       
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
      xii = XiK(ni);
      for nj = 1: NGPk  
         itaa = XiK(nj);
         
       
        B = subs(Bi,xi,xii);
        B = subs(B,ita,itaa);
       
  D =E*[1 0 ; 0 1];  % E = conductivity 
%    
  Q = Q+1; % intiate for making S matrix
  
   HeatFlux_GP(:,Q) = HeatFlux_GP(:,Q) - D*B*TLN(:,i);
      end
  end
 end
 
end
