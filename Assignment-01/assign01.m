clear all
clc
lab01 = fopen('assign01_prob.txt','r');
[ a1 a2 a3 a4 A B AA BB] = ques(lab01);
sum = A+B
substract = A-B
multi = A*B
tranAB = A'*B
A_inverse = inv(A)
eigen_A = eig(A)
eigen_B = eig(B)

X = inv(AA)*BB

