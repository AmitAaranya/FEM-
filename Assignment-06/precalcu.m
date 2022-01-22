function [a A E O I WiF WiK XiF XiK ] = precalcu( NE, ELECON, CORD, MAT,NGPk, NGPf)
a = zeros(NE,1);
O = zeros(NE,1);
for i= 1:NE;
    x1 = CORD(i,1)
    y1 = CORD(i,2)
     x2 = CORD(i+1,1)
    y2= CORD(i+1,2)
    
    a(i) = a(i) + sqrt((x2-x1)^2 +(y2-y1)^2);
    
    % Calculating Angle with respect to positive X-axis
    DeltaY = y2-y1
   DeltaX = x2-x1
   OO = atan((abs(y2-y1))/(abs(x2-x1)))
    if (DeltaY)>=0 && (DeltaX)>=0
            O(i) = OO
        elseif (DeltaY)>=0 && (DeltaX)<=0
            O(i) = pi-OO
        elseif (DeltaY)<=0 && (DeltaX)<=0
            O(i) = OO-pi
        else (DeltaY)<=0 && (DeltaX)>=0
            O(i) = -(OO)
    end
    
end
E = MAT';

A = zeros(NE,1);
for ii = 1:NE
    A(ii) = ELECON(ii,4);
end

I = zeros(NE,1);
for iii = 1:NE
    I(iii) = ELECON(iii,5);
end


% %% For Stress calculation
% % AA = Crossection area at point A
% % Z = Sectional modulus at oint A
% b_A = ELECON(1,4);
% h_A = ELECON(1,5);
% AA = b_A*h_A;
% Z = (b_A*h_A^2)/6;

 
        %% Gaussian weight function for Force Vector
           if NGPf ==2
        WiF = [1 1];
        XiF = [-0.5773502691896258 0.5773502691896258];
    elseif NGPf ==3
        WiF = [0.5555555555 0.8888888888 0.555555555555];
        XiF = [-0.7745966692414834 0 0.7745966692414834];
    elseif NGPf==4
        WiF = [0.3478548 0.65214515 0.65214515 0.34785484];
        XiF = [-0.861136 -0.339981 +0.339981 0.861136];
    end
  %% Gaussian weight function for Stiffness Vector
    
        if NGPk ==2
        WiK = [1 1];
        XiK = [-0.57735 0.57735];
    elseif NGPk ==3
        WiK = [0.5555555555 0.8888888888 0.555555555555];
        XiK = [-0.7745966692414834 0 0.7745966692414834];
    elseif NGPk==4
        WiK = [0.3478548 0.65214515 0.65214515 0.34785484];
        XiK = [-0.861136 -0.339981 +0.339981 0.861136];
        end
        
end
