% Date: 2020/2/29
% Author: TAN Yueyin
% Question:ͬch1_1_4a ���������ֹ�Ʊ֮����⿼�Ǵ�����������Ϊ0.05���޷���Ͷ��
% TO (�������ʶ�Ϊ0.15ʱ ��С������ֵ��������)
% min_x D(R) = X' * V * X ����V��Э������
% s.t.
%     x1 * E(R1) + x2 * E(R2) + x3 * E(R3) + x4 * ER4 = 0.15
%     x1 + x2 + x3 = 1
%     X = (x1, x2, x3, x4)' ge 0 (xi������i�ֹ�Ʊ�ı���)
% i.e.
%     A * X ge 0.15
%     Aeq * X = 1
%% ��Э������V
% V��һ��4 * 4�������� 3 * 3 ͬch1_1_4a
% �����޷���Ͷ�ʵķ��� Э�����Ϊ�㣬�ʾ���

%% �����Թ滮����
ER1 = 0.08908; ER2 = 0.21367; ER3 = 0.23458; ER4 = 0.05;
ER = 0.15;
x0 = [1/4 1/4 1/4 1/4]';
Aeq = [ER1 ER2 ER3 ER4; 1 1 1 1];
beq = [ER, 1]';
lb = zeros(4,1);
ub = ones(4,1);
options = optimset('largescale','on');
[x,fval,exitflag, output] = fmincon('ch1_1_4_investment_b',x0,[],[],Aeq,beq,lb,ub,[],options)