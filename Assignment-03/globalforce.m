function  [Fg] = globalforce(NDOF,NL,NN,PLOAD)
  Fg = zeros(NN*NDOF,1);
 for n = 1:NL;
    ee = PLOAD(n,1);
  ll = PLOAD(n,2)
    gg = (ee-1)*NDOF + ll ;
    Fg(gg,1) = Fg(gg,1)+PLOAD(n,3)
  
end
 end
 
 