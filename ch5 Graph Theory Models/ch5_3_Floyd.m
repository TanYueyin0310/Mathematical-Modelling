% Date:2020/04/10
% Author: TAN Yueyin
% ����������֮������Floyd�㷨
w = [0  9 inf 3 inf
     9  0  2 inf 7
    inf 2  0  2  4
     3 inf 2  0 inf
    inf 7  4 inf 0];%����֮���Ȩֵ����
[Itr_num,D,r,c_min,k_opt] = ch5_3_Floyd_sub(w);%Itr_numΪ����ʱ�ܵĵ������� DΪ��СȨ�� rΪ��СȨ��Ӧ��·���� c_minΪ��СȨ�͵�ֵ k_opt�����������֮����С�ĵ�

