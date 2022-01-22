 function [Natural_Fre ,EigenVector ] = Frequencies(Kg1,Mg1,NN,NDOF,ND,BC)
 
[V,D] = eig(Kg1,Mg1); % Solving for eigen value and eigen vectors 
Eig = sqrt(D)/2/pi;
Natural_Fre = diag(Eig);


%---------------- Calculating Eigen Vector ---------------------%

p = NN*NDOF-ND; % p = Number of Natural Frequency
EigenVector = zeros(NN*NDOF,p);
zz = zeros(ND,1);
for i = 1:ND
    z= BC(i,1);
    q = BC(i,2);
   zz(i) = NDOF*(z-1)+q;
end
 DispNumber= 1:(NN*NDOF);
 ObtainedFre = setdiff(DispNumber,zz);
 
 for i = 1:p
     p = ObtainedFre(i);
     EigenVector(p,:) = EigenVector(p,:)+ V(i,:);
 end
 
   


end

