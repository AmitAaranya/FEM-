function [a E I WiF WiK XiF XiK ] = precalcu( NE, ELECON, CORD, MAT,NGPk, NGPf)
for i= 1:NE;
    a(i) = CORD(i+1)-CORD(i);
 I(i) = ELECON(i,4);
end
E = MAT';

% %% I calculation
% syms x xi   AA Z
% I = zeros(NE,1);
% for i=1:NE
%     b = ELECON(i,4);
%     h1 = ELECON(i,5);
%     h2 = ELECON(i,6);
%    dh = (h1-h2)*x;
%     hx = h1-dh*(1/a(i));
%     Ix(i) = b*(hx^3)*(1/12); 
%     aa = 0;
% bb = a(i);
% x = 0.5*(bb+aa)+0.5*(bb-aa)*xi;
% 
% I = subs(Ix,x);
% 
% end

 
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
