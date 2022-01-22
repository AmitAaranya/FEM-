function [Ke] = elementmat(NN,NDOF,NGPk,E,I,WiK,XiK,a)
syms xi x
Ne = [1-(3*x^2)/a^2+(2*x^3)/a^3 x-(2*x^2)/a+x^3/a^2 ...
   (3*x^2)/a^2-(2*x^3)/a^3 (-x^2)/a+(x^3)/a^2];
x = a*(1+xi)*0.5;
%H = [(1-xi)^2*(2+xi)/4 (1-xi)^2*(1+xi)/8 (1+xi)^2*(2-xi)/4 (1+xi)^2*(-1+xi)/8]
H = subs(Ne,x);
Be = 4*diff(diff(H));
Ke = zeros(NN*NDOF);
for i = 1:NGPk;
    xi = XiK(i);
    Wk = WiK(i);
 
    Ke0 = vpa(Ke + (Be'*Be)*E*I*Wk*0.5);
      Ke = subs(Ke0,xi);
end

end
