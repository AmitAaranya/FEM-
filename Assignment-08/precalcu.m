function [E Mu WiF WiK XiF XiK ] = precalcu( NE,NEN, ELECON, CORD, MAT ,NGP)
%%  
E = MAT(1)';
Mu = MAT(2);

        %% Gaussian weight function for Force Vector
           if NGP ==2
        WiF = [1 1];
        XiF = [(-1/sqrt(3)) (1/sqrt(3))];
    elseif NGP ==3
        WiF = [0.5555555555 0.8888888888 0.555555555555];
        XiF = [-0.7745966692414834 0 0.7745966692414834];
    elseif NGP==4
        WiF = [0.3478548 0.65214515 0.65214515 0.34785484];
        XiF = [-0.861136 -0.339981 +0.339981 0.861136];
    end
  %% Gaussian weight function for Stiffness Vector
    
        if NGP ==2
        WiK = [1 1];
        XiK = [(-1/sqrt(3)) (1/sqrt(3))];
    elseif NGP ==3
        WiK = [0.5555555555 0.8888888888 0.555555555555];
        XiK = [-0.7745966692414834 0 0.7745966692414834];
    elseif NGP==4
        WiK = [0.3478548 0.65214515 0.65214515 0.34785484];
        XiK = [-0.861136 -0.339981 +0.339981 0.861136];
        end
        
end
