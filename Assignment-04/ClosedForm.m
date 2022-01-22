function [CKe CFe] = ClosedForm(E,I,a)
syms x
Ne = [1-(3*x^2)/a^2+(2*x^3)/a^3 x-(2*x^2)/a+x^3/a^2 ...
    (3*x^2)/a^2-(2*x^3)/a^3 (-x^2)/a+(x^3)/a^2];
%x = a*(1+xi)/2
%N = subs(Ne,x)

dd = diff(diff(Ne));
ddd = E*I*(dd'*dd);
CKe = int(ddd,x,0,a); %Stiffness matrix
CKe = vpa(CKe);

%%  force matrix calculation
q1 = -1000;
q2 = -4000;
qx = q1+(q2-q1)*x;
zz = Ne'.*qx;
CFe = vpa(int(zz,x,0,a));

 