function  [Fg] = globalforce(NDOF,NL,NN,PLOAD)
  Fg = zeros(NN,NDOF);
 for i = 1:NL ; 
     Z = PLOAD(i ,1);
     LoadV = PLOAD(i,3);
     DF = PLOAD(i ,2);
     Fg(Z , DF) = LoadV;
 
 end
 
 