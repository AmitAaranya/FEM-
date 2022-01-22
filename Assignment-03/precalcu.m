function [a E A O] = precalcu( NE, ELECON, CORD, MAT,O)
E = MAT';
for i=1:NE;
    A(i) = ELECON(i,4);
end
a = zeros(NE,1);
O = zeros(NE,1);
for i= 1:NE;
    x1 = CORD(ELECON(i,1),1);
    y1 = CORD(ELECON(i,1),2);
     x2 = CORD(ELECON(i,2),1);
    y2= CORD(ELECON(i,2),2);
    
    a(i) = a(i) + sqrt((x2-x1)^2 +(y2-y1)^2);
    
    % Calculating Angle with respect to positive X-axis
    DeltaY = y2-y1;
   DeltaX = x2-x1;
   OO = atan((abs(y2-y1))/(abs(x2-x1)));
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
