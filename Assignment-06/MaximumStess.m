 function [Max_Sigma] = MaximumStess(Sigma,NE,NEN)
Sigma = abs(Sigma);
for i = 1: NE
    for q = 1: NEN
        qq = 2*(q-1)+1;
        Total_Sigma(q) =  Sigma(qq,i)+ Sigma(qq+1,i);
    end
    Max_Sigma(i) = max(Total_Sigma);
end
Max_Sigma = Max_Sigma';
