function [a E I] = precalcu( NE, ELECON, CORD, MAT)
for i= 1:NE;
    a(i) = CORD(i+1)-CORD(i);
end
E = MAT';
for i=1:NE;
    I(i) = ((ELECON(i,4))*(ELECON(i,5))^3)/12 ;
end
end
