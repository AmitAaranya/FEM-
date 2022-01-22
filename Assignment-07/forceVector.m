function  [Fg] = forceVector(CORD,NEUDL,UDL,NL,PLOAD,NDOF,NE,NEN,NN,lm,ELECON)
Fg = zeros(NN*NDOF,1);

%% Point Load Calculations
for n = 1:NL;
    ee = PLOAD(n,1);
  ll = PLOAD(n,2)
    gg = (ee-1)*NDOF + ll ;
    Fg(gg,1) = Fg(gg,1)+PLOAD(n,3)
  
end
%%  Unifomaly Distributed Tranction Vector Calculation
nee = NDOF*NEN
for i = 1:NEUDL
     N1 = UDL(i,2)
    N2 = UDL(i,3)
    t = ELECON(UDL(i,1),5)
    DeltaY = CORD(N2,2)-CORD(N1,2)
    DeltaX = CORD(N2,1)-CORD(N1,1)
    a = sqrt(DeltaY^2 + DeltaX^2)
    thetha =  atan(((CORD(N2,2))-(CORD(N1,2)))/((CORD(N2,1))-(CORD(N1,1))))
     tx = UDL(i,4)*abs(sin(thetha));
     ty = UDL(i,4)*abs(cos(thetha));
    
     Fe = a * 0.5 *t*[ tx ty tx ty 0 0]'
         
     for m = 1:nee;
      mg = lm(UDL(i,1),m);
      
      Fg(mg,1) = Fg(mg,1)+ Fe(m,1);
     end
end


end

 