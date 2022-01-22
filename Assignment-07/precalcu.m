function [ A E Mu  ] = precalcu( NE,NEN, ELECON, CORD, MAT)

%% Calculation of  Area of Element 
A = zeros(NE,1);
for i= 1:NE
 
    for r = 1:NEN
        LN(r) = ELECON(i,r+1);
    end
    
    A(i) =  A(i) + 0.5 *det([1 CORD(LN(1),1) CORD(LN(1),2); 1 CORD(LN(2),1) CORD(LN(2),2) ; 1 CORD(LN(3),1) CORD(LN(3),2)]);
end
%%  
E = MAT(1)';
Mu = MAT(2);

%         %% Gaussian weight function for Force Vector
%            if NGPf ==2
%         WiF = [1 1];
%         XiF = [-0.5773502691896258 0.5773502691896258];
%     elseif NGPf ==3
%         WiF = [0.5555555555 0.8888888888 0.555555555555];
%         XiF = [-0.7745966692414834 0 0.7745966692414834];
%     elseif NGPf==4
%         WiF = [0.3478548 0.65214515 0.65214515 0.34785484];
%         XiF = [-0.861136 -0.339981 +0.339981 0.861136];
%     end
%   %% Gaussian weight function for Stiffness Vector
%     
%         if NGPk ==2
%         WiK = [1 1];
%         XiK = [-0.57735 0.57735];
%     elseif NGPk ==3
%         WiK = [0.5555555555 0.8888888888 0.555555555555];
%         XiK = [-0.7745966692414834 0 0.7745966692414834];
%     elseif NGPk==4
%         WiK = [0.3478548 0.65214515 0.65214515 0.34785484];
%         XiK = [-0.861136 -0.339981 +0.339981 0.861136];
%         end
%         
end
