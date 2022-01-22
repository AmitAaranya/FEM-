function [E Mu Density Wim WiK Xim XiK ] = precalcu( NE,NEN, ELECON, CORD, MAT ,NGPk,NGPm);

%%  
E = MAT(1)';
Mu = MAT(2);
Density = MAT(3);

        %% Gaussian weight function for Force Vector
           if NGPm ==2
        Wim = [1 1];
        Xim = [(-1/sqrt(3)) (1/sqrt(3))];
    elseif NGPm ==3
        Wim = [0.5555555555 0.8888888888 0.555555555555];
        Xim = [-0.7745966692414834 0 0.7745966692414834];
    elseif NGPm==4
        Wim = [0.3478548 0.65214515 0.65214515 0.34785484];
        Xim = [-0.861136 -0.339981 +0.339981 0.861136];
    end
  %% Gaussian weight function for Stiffness Vector
    
        if NGPk ==2
        WiK = [1 1];
        XiK = [(-1/sqrt(3)) (1/sqrt(3))];
    elseif NGPk ==3
        WiK = [0.5555555555 0.8888888888 0.555555555555];
        XiK = [-0.7745966692414834 0 0.7745966692414834];
    elseif NGPk ==4
        WiK = [0.3478548 0.65214515 0.65214515 0.34785484];
        XiK = [-0.861136 -0.339981 +0.339981 0.861136];
        end
        
end
