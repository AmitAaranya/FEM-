function [lm] = dofmat(NE,ELECON,NEN,NDOF)
for i =1:NE;
    for L = 1:NEN;
        noden = ELECON(i,L+1);
        for k = 1:NDOF;
            j = (L-1)*(NDOF) +k
            lm(i,j) = NDOF*(noden-1)+k ;
        end
    end
end
end
