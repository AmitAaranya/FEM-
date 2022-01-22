function [Force_Member] = ForceInMember(LED,NE,NEN,NDOF,A,E,a)
nee = NDOF*NEN;
Force_Member = zeros(nee,NE);
for i = 1:NE
    ELED = LED(:,i);
    Ke = ((A(i)* E(i))/a(i))*[1 0 -1 0 ;0 0 0 0;-1 0 1 0 ; 0 0 0 0]
    
    FM = Ke*ELED;
    Force_Member(:,i) = Force_Member(:,i)+FM;
    
    
end
end
