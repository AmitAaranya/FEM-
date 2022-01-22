function [Sigma_Node] = StressAtNode(Sigma_GP,NE,NEN,NGP)

Sigma_Node = zeros(3,2*NE*NGP);
a = 0.5*sqrt(3);
Q = [1+a -0.5 1-a -0.5 ; -0.5 1+a -0.5 1-a ;...
    1-a -0.5 1+a -0.5 ; -0.5 1-a -0.5 1+a];

for i = 1:3 % Taken 3 for the Sigma_xx , Sigma_yy, Sigma_xy
    for j = 1:NE
        jn = NEN*(j-1)+1;
        SG = Sigma_GP(i,jn:(jn+NEN-1));
        SN = Q*SG';
        Sigma_Node(i,jn:(jn+NEN-1)) = Sigma_Node(i,jn:(jn+NEN-1)) + SN';
           
    end
end

    
end
