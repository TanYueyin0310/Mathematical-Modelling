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

c = [72;64]; %Ŀ�꺯��ϵ������c
a = [1, 1; 12, 8; 0, 3];%����ʽԼ��ϵ����
b = [50; 480; 100];%����ʽԼ���Ҷ�
x = linprog(-c ,a, b, [], [], zeros(2,1))
f = c' * x

