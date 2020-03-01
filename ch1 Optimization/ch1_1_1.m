% Date: 2020/2/28
% Author: TAN Yueyin
% To
% max f = 72x_1+64x_2 = c' * x
% s.t. 
%     x_1 + x_2 le 50
%     12 * x_1 + 8 * x_2 le 480
%     3 * x_1 le 100
%     x_1 ge 0 x_2 ge 0
% i.e.
%     a * x le b

c = [72;64]; %目标函数系数矩阵c
a = [1, 1; 12, 8; 0, 3];%不等式约束系数阵
b = [50; 480; 100];%不等式约束右端
x = linprog(-c ,a, b, [], [], zeros(2,1))
f = c' * x

