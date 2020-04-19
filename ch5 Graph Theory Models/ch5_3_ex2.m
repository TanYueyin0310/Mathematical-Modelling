% Date: 2020/04/14
% Author: TAN Yueyin
% 指派问题：n个工人做n件事情，并且每人只做一件事。已知每个人做每件事对应的效率，求如何安排效率最大
c = [13 24 31 19 40 29
     18 25 30 15 43 22
     20 20 27 25 34 33
     23 26 28 18 37 30
     28 33 34 17 38 20
     19 36 25 27 45 24];%效率矩阵
n=size(c,1);%计算C的行列数n
c=c(:);%计算目标函数系数，将矩阵C按列排成一个列向量即可 则有 f = c^T * x
A=[];b=[];%没有不等式约束
Ae=zeros(2 * n , n  ^2);%计算等约束的系数矩阵a
for i = 1 : n
    for j = (i-1) * n + 1 : n * i %sum_i(x_ij)=1,j=1,...,n
            Ae(i,j) = 1;
    end
    for k = i : n : n ^ 2 %sum_j(x_ij)=1,i=1,...,n
            Ae(n+i,k) = 1;
    end
end
be = ones(2 * n,1);%等式约束右端项be
x_l = zeros(n ^ 2, 1);%决策变量下界xl
x_u = ones(n ^ 2, 1);%决策变量上界xu
[x,favl] = linprog(-c,A,b,Ae,be,x_l,x_u);%使用linprog求解,解出的x为（x11,x21,...,xn1, x12,x22,...,xn2, x13,x23,...,xn3, ..., xnn)^T
x = reshape(x,n,n);%将列向量x按列排成一个n阶方阵
disp('最优解矩阵为:');%输出指派方案和最优值
Assignment = round(x);%使用round进行四舍五入取整
disp(Assignment);
disp('最优解为:');
disp(-favl);
