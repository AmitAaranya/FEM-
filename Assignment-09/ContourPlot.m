function [Contour_Plot] = ContourPlot(T,CORD,NN)
p = 5; % Number of row 
q = 5; % Number of column of partition in geometry
X = zeros(p,q);
Y = zeros(p,q);
TT = zeros(p,q);
GG = [21 22 23 24 25; 20 19 18 17 16; 11 12 13 14 15; 10 9 8 7 6;1 2 3 4 5]
for i = 1:NN;
    x = GG(i);
    X(i) = CORD(x,1);
end
for i = 1:NN;
    y = GG(i);
    Y(i) = CORD(y,2);
end
for i = 1:NN;
    z = GG(i);
    TT(i) = T(z);
end
Contour_Plot = contourf(X,Y,TT,'--','ShowText','on');
end





    
  
