function  [Fg] = forceVector(CORD,NL,PLOAD,NDOF,NE,NEN,NN,NGPf,WiF,XiF,a,UVL,lm,NEUVL,NEUDL,UDL)
Fg = zeros(NN*NDOF,1);
nee = NDOF*NEN;

%% for UVL LOADING CONDITIONS
for zz =1:NEUVL;
    ii = UVL(zz,1);
syms x xi
an = a(ii);
K = [1-(3*x^2)/an^2+(2*x^3)/an^3 x-(2*x^2)/an+x^3/an^2 (3*x^2)/an^2-(2*x^3)/an^3 (-x^2)/an+(x^3)/an^2]';

aa = 0;
bb = a(ii);
x = 0.5*(bb+aa)+0.5*(bb-aa)*xi;

Mx = subs(K,x);
Fe = zeros(NEN*NDOF,1);
q1 = UVL(zz,2);
q2 = UVL(zz,3);
z = lm(ii,:); 
 b = q1 + x*(q2-q1)/an;
 
for i = 1:NGPf;
 xii =  XiF(i);
 W = WiF(i);
M = subs(Mx,xii);

% b = -1500*xii-2500;
 Fe = Fe + (b*M*W*0.5*an);
Fe = (subs(Fe,xii))
end


  for j = 1:nee;
      jg = z(j);
      
      
      Fg(jg,1) = Fg(jg,1)+ Fe(j,1);
        
        
    end
  
end
%% For Point Load
for n = 1:NL;
    ee = PLOAD(n,1);
  ll = PLOAD(n,2)
    gg = (ee-1)*NDOF + ll ;
    Fg(gg,1) = Fg(gg,1)+PLOAD(n,3)
  
end

%% FOR UDL LOADING CONDITIONS
for y = 1:NEUDL
    ElementNumber = UDL(y,1);
    Q = UDL(y,2);
    L = a(ElementNumber);
    Fb = Q*L*0.5*[1 ; L/6 ; 1 ; -L/6]
    
    for s = 1:nee
        sg = lm(ElementNumber,s)
        Fg(sg,1) = Fg(sg,1)+ Fb(s,1);
    end
    
    
end

end

 