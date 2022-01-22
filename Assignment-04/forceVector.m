function  [Fe] = forceVector(NDOF,NN,NGPf,WiF,XiF,a)
Fe = zeros(NN*NDOF,1);
syms x xi
K = [1-(3*x^2)/a^2+(2*x^3)/a^3 x-(2*x^2)/a+x^3/a^2 (3*x^2)/a^2-(2*x^3)/a^3 (-x^2)/a+(x^3)/a^2]';
x = (1+xi)*0.5;
Mx = subs(K,x);
for i = 1:NGPf;
 xii =  XiF(i);
 W = WiF(i);
M = subs(Mx,xii) ;   
b = -1500*xii-2500;
 Fe = Fe + (b*M*W*0.5);
Fe = vpa(Fe);
end
end

 