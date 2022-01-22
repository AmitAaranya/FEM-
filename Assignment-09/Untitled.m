Fg = zeros(NN*NDOF,1);

%%  Unifomaly Distributed Tranction Vector Calculation
nee = NDOF*NEN;
for ii = 1:NEUDL
 
     Element_No = UDL(ii,1);
     N1 = UDL(ii,2);
     N2 = UDL(ii,3);
     Flux = UDL(ii,4);
    
    DeltaY = CORD(N2,2)-CORD(N1,2);
    DeltaX = CORD(N2,1)-CORD(N1,1);
    a = sqrt(DeltaY^2 + DeltaX^2);
   
       
            LN = zeros(NEN,1);
         for r = 1:NEN
            LN(r) = ELECON(Element_No,r+1);
         end
        x1 = CORD(LN(1),1);
        y1 = CORD(LN(1),2);
        x2 = CORD(LN(2),1);
        y2 = CORD(LN(2),2);
        x3 = CORD(LN(3),1);
        y3 = CORD(LN(3),2);
        x4 = CORD(LN(4),1);
        y4 = CORD(LN(4),2);
     
    % shape function
    syms xi  ita
    syms xi ita
    Nn = [(1-xi)*(1-ita)*(1/4);(1+xi)*(1-ita)*(1/4);(1+xi)*(1+ita)*(1/4); (1-xi)*(1+ita)*(1/4) ];
    BB = [diff(Nn(1),xi) diff(Nn(2),xi) diff(Nn(3),xi) diff(Nn(4),xi) ; ...
          diff(Nn(1),ita) diff(Nn(2),ita) diff(Nn(3),ita) diff(Nn(4),ita)];
    Xn = [x1 y1; x2 y2; x3 y3 ; x4 y4 ];
    Ji = BB* Xn; % Jacobian Matrix
    Det_J = det(Ji);

   
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
      Fe = int((0.5*a*N*Flux),xi, -1, 1);
   elseif  N1 == 2 && N2 == 3
      Fe = int((0.5*a*N*Flux),ita, -1, 1);
   elseif  N1 == 3 && N2 == 4
      Fe = int((0.5*a*N*Flux),xi, -1, 1);
   else  N1 == 4 && N2 == 1
   Fe = int((0.5*a*N*Flux),ita, -1, 1);
   end
       % Assembly     
     for m = 1:nee;
      mg = lm(UDL(ii,1),m);
      
      Fg(mg,1) = Fg(mg,1)+ Fe(m,1)
     end
end 
