function [Kg] = elementmat(CORD,lm,NEN,NE,NN,NDOF,NGPk,E,I,WiK,XiK,a)
Kg = zeros(NN*NDOF);
     nee = NDOF*NEN
    for i = 1:NE;
        an = a(i)
       syms xi x
Ne = [1-(3*x^2)/an^2+(2*x^3)/an^3 x-(2*x^2)/an+x^3/an^2 ...
   (3*x^2)/an^2-(2*x^3)/an^3 (-x^2)/an+(x^3)/an^2];

aa = 0;
bb = a(i);
x = 0.5*(bb+aa)+0.5*(bb-aa)*xi;

%H = [(1-xi)^2*(2+xi)/4 an*(1-xi)^2*(1+xi)/8 (1+xi)^2*(2-xi)/4 an*(1+xi)^2*(-1+xi)/8]
H = subs(Ne,x);
Be = (4/an^2)*(diff(diff(H)));
Ke = zeros(NEN*NDOF);
In = I(i);
 z = lm(i,:); 
for k = 1:NGPk;
    xii = XiK(k);
    Wk = WiK(k);
    Ke0 = (Ke + (Be'*Be)*E(i)*In*Wk*0.5*an);
      Ke = subs(Ke0,xi,xii);
end
K = vpa(Ke)
    
  for j = 1:nee;
      jg = z(j);
      
  for m = 1:nee;
      mg = z(m);
      
      Kg(jg,mg) = Kg(jg,mg)+ Ke(j,m);
        
        
    end
    end
    end
    
    
    end
    