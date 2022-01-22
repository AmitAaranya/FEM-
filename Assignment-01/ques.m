function [a1 a2 a3 a4 A B AA BB] = ques(lab01)
a1 = fscanf(lab01,'%d',1);
a2 = fscanf(lab01,'%d',1);
a3 = fscanf(lab01,'%d',1);
a4 = fscanf(lab01,'%d',1);
A = fscanf(lab01,'%f',[a1,a2]);
B = fscanf(lab01,'%f',[a3,a4]);
AA = fscanf(lab01,'%f',[3,3]);
BB = fscanf(lab01,'%f',[3,1]);
end