% Date: 2020/2/29
% Author: TAN Yueyin
% Question:同ch1_1_4a 但除了三种股票之外额外考虑存在年收益率为0.05的无风险投资
% TO (在收益率定为0.15时 最小化风险值，即方差)
% min_x D(R) = X' * V * X 其中V是协方差阵
% s.t.
%     x1 * E(R1) + x2 * E(R2) + x3 * E(R3) + x4 * ER4 = 0.15
%     x1 + x2 + x3 = 1
%     X = (x1, x2, x3, x4)' ge 0 (xi代表购入i种股票的比例)
% i.e.
%     A * X ge 0.15
%     Aeq * X = 1
%% 求协方差阵V
% V是一个4 * 4矩阵，左上 3 * 3 同ch1_1_4a
% 由于无风险投资的方差 协方差均为零，故矩阵

%% 非线性规划问题
ER1 = 0.08908; ER2 = 0.21367; ER3 = 0.23458; ER4 = 0.05;
ER = 0.15;
x0 = [1/4 1/4 1/4 1/4]';
Aeq = [ER1 ER2 ER3 ER4; 1 1 1 1];
beq = [ER, 1]';
lb = zeros(4,1);
ub = ones(4,1);
options = optimset('largescale','on');
[x,fval,exitflag, output] = fmincon('ch1_1_4_investment_b',x0,[],[],Aeq,beq,lb,ub,[],options)