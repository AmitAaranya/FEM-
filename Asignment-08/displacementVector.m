function [u] = displacementVector(u11,BC,NN,NDOF,ND)
u = zeros(NN*NDOF,1);
zz = zeros(ND,1);
for i = 1:ND
    z= BC(i,1);
    q = BC(i,2);
   zz(i) = NDOF*(z-1)+q;
end
 DispNumber= 1:(NN*NDOF);
 ObtainedDisp = setdiff(DispNumber,zz);
 for i = 1:(NN*NDOF-ND)
     p = ObtainedDisp(i);
     u(p) = u(p)+ u11(i);
 end
end

 
