% Date:2020/04/12
% Author: TAN Yueyin
% 求六城市航空交通网络的最优航线
% 注：1 London 2 Mexico City 3 New York 4 Paris 5 Beijing 6 Tokyo
w = [0 56 35 21 51 60
     56 0 21 57 78 70
     35 21 0 36 68 68
     21 57 36 0 51 61
     51 78 68 51 0 13
     60 70 68 61 13 0];%输入权重（此题目中为距离）矩阵
 [Itr_num,D,r,c_min,k_opt] = ch5_3_Floyd_sub(w)；