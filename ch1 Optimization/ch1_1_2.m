% Date: 2020/2/28
% Author: TAN Yueyin
% Question:
% 假设某金融市场上有多种金融资产可供投资者选某公司拥有一笔数额为M的的资金可用作一个时期的投资
% 公司专业人员对某4种资产Si (i = 1, 2, 3, 4)进行了风险收益分析评估，估计结果为购买资产Si，的平均收益率为ri，风险损失率为qi
% 考虑到投资4种资产的风险比投资一种资产的风险要小，因此，公司决定总体风险用所投资的4种资产中最大的一个风险来度量．
% 另外，购买金融资产时要付手续费，假设费率为pi，井且当购买额不超过定值时，手续费按ui计算，不买卖资产时无需付费
% To
% min f = lambda Q - (1 - lambda)[r_0 * x_0 + sum(r_i - p_i) * x_i]
% i.e. f = c' * x
% s.t.
%     x_0 + sum(1 + p_i) * x_i = 1
%     q_i * x_i le Q (i = 1, 2, 3, 4)
% i.e. 
%     Aeq * x = beq
%     a * x le b 其中x=（Q, x0, x1, x2, x3, x4)
lambda = input('input lambda(lambda bt [0,1]) \n');
r0 = 0.05; r1 = 0.28; r2 = 0.21; r3 = 0.23; r4 = 0.25;
q0 = 0;    q1 = 0.025;q2 = 0.015;q3 = 0.055;q4 = 0.65;
p0 = 0;    p1 = 0.01; p2 = 0.02; p3 = 0.045;p4 = 0.065;
d = lambda - 1;
c = [lambda, d * r0, d * (r1 - p1), d * (r2 - p2), d * (r3 - p3), d * (r4 - p4)];%目标函数系数矩阵c
a = [-1 0 q1 0 0 0; -1 0 0 q2 0 0; -1 0 0 0 q3 0; -1 0 0 0 0 q4];%不等式约束系数阵
b = zeros(1,4);%不等式约束右端
Aeq = [0 1 1+p1 1+p2 1+p3 1+p4];%等式约束系数阵
beq = 1;%等式约束右端
lb = zeros(6,1);%下边界限制
ub = ones(6,1);%上边界限制
x0 = zeros(6,1);%初值
options = optimset('Diagnostic','on','largescale','off');
[x, favl, exitflag] = linprog(c ,a, b,Aeq, beq, lb, ub, options)%其中fval是c' * x 的值
RR = r0 * x(2,:) + (r1 - p1) * x(3,:) + (r2 - p2) * x(4,:) + (r3 - p3) * x(5,:) + (r4 - p4) * x(6,:)


