function  [Fg,Fo] = forceVector(CORD,NEUDL,UDL,NL,PLOAD,NDOF,NE,NEN,NN,NGPf,WiF,XiF,a,UVL,lm,O,NIBC,IBC)
Fg = zeros(NN*NDOF,1);
nee = NDOF*NEN;
Fo = zeros(nee,NE); % Equivalent nodal force for each element
%% Uniformaly varrying load calculation
for ii =1:NE;
syms x xi
an = a(ii);
H = [0 1-(3*x^2)/an^2+(2*x^3)/an^3 x-(2*x^2)/an+x^3/an^2 0 (3*x^2)/an^2-(2*x^3)/an^3 (-x^2)/an+(x^3)/an^2]';

aa = 0;
bb = a(ii);
x = 0.5*(bb+aa)+0.5*(bb-aa)*xi;

Mx = subs(H,x);
Fe = zeros(NEN*NDOF,1);
q1 = UVL(ii,1);
q2 = UVL(ii,2);

 b = q1 + x*(q2-q1)/an;
 
for ii = 1:NGPf;
 xii =  XiF(ii);
 W = WiF(ii);
M = subs(Mx,xii);

% b = -1500*xii-2500;
 Fe = Fe + (b*M*W*0.5*an);
Fe = (subs(Fe,xii))
end

Fo(:,ii) = Fo(:,ii) + Fe;

%Making Local Force vector direction to GLOBAL

l = cos(O(ii))
 m = sin(O(ii))
% syms l m 
cc = 1:NIBC
if ii == IBC(cc,1)
    for c = 1:NIBC
    if IBC(c,2) == 1
     L = [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 l m 0; 0 0 0 -m l 0; 0 0 0 0 0 1]
    elseif IBC(c,2)==2
     L =  [l m 0 0 0 0; -m l 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1]
    end
    end
    
else
 L = [l m 0 0 0 0; -m l 0 0 0 0; 0 0 1 0 0 0; 0 0 0 l m 0; 0 0 0 -m l 0; 0 0 0 0 0 1]
end

 Fe = L'*Fe

% Assembling the Force Vector
  for j = 1:nee
      jg = lm(ii,j);
      
      
      Fg(jg,1) = Fg(jg,1)+ Fe(j,1);
        
        
    end
  
end
%% Uniformally distributed Load(Shear Load)
for ii = 1:NEUDL
    Q = UDL(ii,2);
    an = a(UDL(ii,1));
Fb = Q*an*0.5*[0 1 an/6 0 1 -an/6]'

Fo(:,UDL(ii,1)) = Fo(:,UDL(ii,1)) + Fb;
%Making Local Force vector direction to GLOBAL
l = cos(O(UDL(ii,1)))
 m = sin(O(UDL(ii,1)))
% syms l m 
cc = 1:NIBC
if ii == IBC(cc,1)
    for c = 1:NIBC
    if IBC(c,2) == 1
     L = [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 l m 0; 0 0 0 -m l 0; 0 0 0 0 0 1]
    elseif IBC(c,2)==2
     L =  [l m 0 0 0 0; -m l 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1]
    end
    end
    
else
 L = [l m 0 0 0 0; -m l 0 0 0 0; 0 0 1 0 0 0; 0 0 0 l m 0; 0 0 0 -m l 0; 0 0 0 0 0 1]
end
 Fb = L'*Fb
 
 % Assembling the force vector
    for s = 1:nee
        sg = lm(UDL(ii,1),s)
        Fg(sg,1) = Fg(sg,1)+ Fb(s,1);
    end
end

        
%% Point Load Calculations
for n = 1:NL;
    ee = PLOAD(n,1);
  ll = PLOAD(n,2)
    gg = (ee-1)*NDOF + ll ;
    Fg(gg,1) = Fg(gg,1)+PLOAD(n,3)
  
end
end

 