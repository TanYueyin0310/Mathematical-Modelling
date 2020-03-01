% Date: 2020/2/29
% Author: TAN Yueyin
% Question:同ch1_1_4a 但额外考虑每次股票买卖收取0.01交易费
% TO (在收益率定为0.15时 最小化风险值，即方差)
% min_x D(R) = X' * V * X 其中V是协方差阵
% s.t.
%     x1 * E(R1) + x2 * E(R2) + x3 * E(R3) = 0.15
%     x1 + x2 + x3 + 0.1 * (y1 + y2 + y3 + z1 +z2 +z3) = 1 (其中yi, zi为卖出/买入i 股票的比例份额）
%     xi - yi + zi = xi_0(xi的初值）
%     X = (x1, x2, x3)' ge 0 (xi代表购入i种股票的比例)
% i.e.
%     A * X ge 0.15
%     Aeq * X = 1
%% 求协方差阵V
% V是一个4 * 4矩阵，左上 3 * 3 同ch1_1_4a
% 由于无风险投资的方差 协方差均为零，故矩阵

%% 非线性规划问题
ER1 = 0.08908; ER2 = 0.21367; ER3 = 0.23458;
x0 = 1/9 * ones(9,1);
A0 = 0.5; B0 = 0.35; C0 = 0.15; %设置三种股票的初值
Aeq = [ER1 ER2 ER3 0 0 0 0 0 0;
       1 1 1 0.01 0.01 0.01 0.01 0.01 0.01;
       1 0 0 -1 0 0 1 0 0;
       0 1 0 0 -1 0 0 1 0;
       0 0 1 0 0 -1 0 0 1];
beq = [0.15, 1 A0 B0 C0]';
lb = zeros(9,1);
ub = ones(9,1);
options = optimset('largescale','on');
[x,fval,exitflag, output] = fmincon('ch1_1_4_investment_c',x0,[],[],Aeq,beq,lb,ub,[],options)