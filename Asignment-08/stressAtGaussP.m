 function [Sigma_GP] = stressAtGaussP(LED,NEN,E,Mu,NGP,CORD,ELECON,NDOF,NE,XiK)
 % Coulumn of Sigma matrix reprentes [ Sigma_xx ,Sigma_yy , Sigma_xy] at a
 % perticular Gauss point
 Q = 0;
 Sigma_GP = zeros(3,2*NE*NGP);  % Initiate matrix for stress at gauss point.
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
  
 Bj = [diff(N(1),xi) diff(N(2),xi) diff(N(3),xi) diff(N(4),xi) ; ...
      diff(N(1),ita) diff(N(2),ita) diff(N(3),ita) diff(N(4),ita)];
  Xn = [x1 y1; x2 y2; x3 y3 ; x4 y4 ];
  Ji = Bj* Xn ;% Jacobian Matrix
  A = inv(Ji)* Bj ;
 
  
 
  for ni = 1: NGP  
      xii = XiK(ni);
      for nj = 1: NGP  
         itaa = XiK(nj);
         
        AA = subs(A,xi,xii);
        AA = subs(AA,ita,itaa);
        
          
   B = zeros(3,NDOF*NEN);  % initiate B matrix
  for ii = 1: 3
      if ii == 1
          for j = 1:NEN
              p = 2*j-1;
              B(ii,p) =B(ii,p)+ AA(1,j);
          end
      elseif ii == 2
          for j = 1:NEN
              q = 2*j;
              B(ii,q) = B(ii,q)+ AA(2,j);
          end
      else ii == 3
          for j = 1:NEN
              p = 2*j-1;
              q = 2*j;
              B(ii,p) = B(ii,p) + AA(2,j);
              B(ii,q) = B(ii,q) + AA(1,j);
          end
          
      end
  end  
  % complete B matrix
  
  B = B;
  
%     D = [(1-Mu) Mu 0; Mu (1-Mu) 0; 0 0 0.5*(1-2*Mu)]*E/((1+Mu)*(1-2*Mu)); % Plain Strain Condition
   D =(E/(1-Mu^2))*[1 Mu 0; Mu 1 0 ; 0 0 0.5*(1-Mu)]; % Plain stress conditions
   
  Q = Q+1; % intiate for making S matrix
  
   Sigma_GP(:,Q) = Sigma_GP(:,Q) + D*B*LED(:,i);
      end
  end
 end
 
end
