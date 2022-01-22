function [a E A] = precalcu( NE, ELECON, CORD, MAT)
for i= 1:NE;
    a(i) = CORD(i+1)-CORD(i);
end
E = MAT';
for i=1:NE;
    A(i) = ELECON(i,4)
end
end
