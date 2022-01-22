function  [Fg] = forceVector(CORD,NEUDL,UDL,NL,PLOAD,NDOF,NE,NEN,NN,lm,ELECON)
Fg = zeros(NN*NDOF,1);

%% Point Load Calculations
for n = 1:NL
    ee = PLOAD(n,1);
  ll = PLOAD(n,2);
    gg = (ee-1)*NDOF + ll ;
    Fg(gg,1) = Fg(gg,1)+PLOAD(n,3);
  
end
%%  Unifomaly Distributed Tranction Vector Calculation
nee = NDOF*NEN;
for i = 1:NEUDL
     N1 = UDL(i,2);
    N2 = UDL(i,3);
    t = ELECON(UDL(i,1),NEN+2);
    DeltaY = CORD(N2,2)-CORD(N1,2);
    DeltaX = CORD(N2,1)-CORD(N1,1);
    a = sqrt(DeltaY^2 + DeltaX^2);
    
    
     t = [UDL(i,4) ; UDL(i,5)];

     
    % shape function
    syms xi  ita
  N_Q = [(1-xi)*(1-ita)*(1/4);(1+xi)*(1-ita)*(1/4);(1+xi)*(1+ita)*(1/4); (1-xi)*(1+ita)*(1/4) ];
  Nn = [N_Q(1) 0 N_Q(2) 0 N_Q(3) 0 N_Q(4) 0 ; 0 N_Q(1) 0 N_Q(2) 0 N_Q(3) 0 N_Q(4)];
   if N1 == 1 && N2 ==2
       N = subs(Nn,ita, -1);
   elseif  N1 == 2 && N2 == 3
       N = subs(Nn,xi,1);
   elseif  N1 == 3 && N2 == 4
       N = subs(Nn,ita, 1);
   else  N1 == 4 && N2 == 1
       N = subs(Nn,xi, -1);
   end
   
    if N1 == 1 && N2 ==2
      Fe = int((N'*t),xi, -1, 1);
   elseif  N1 == 2 && N2 == 3
      Fe = int((N'*t),ita, -1, 1);
   elseif  N1 == 3 && N2 == 4
      Fe = int((N'*t),xi, -1, 1);
   else  N1 == 4 && N2 == 1
   Fe = int((N'*t),ita, -1, 1);
   end
       
    
    
     
         
     for m = 1:nee;
      mg = lm(UDL(i,1),m);
      
      Fg(mg,1) = Fg(mg,1)+ Fe(m,1);
     end
end 


end

 