% Date:2020/04/10
% Author: TAN Yueyin
% 求任意两点之间距离的Floyd算法
w = [0  9 inf 3 inf
     9  0  2 inf 7
    inf 2  0  2  4
     3 inf 2  0 inf
    inf 7  4 inf 0];%各点之间的权值矩阵
[Itr_num,D,r,c_min,k_opt] = ch5_3_Floyd_sub(w);%Itr_num为结束时总的迭代次数 D为最小权阵 r为最小权对应的路径阵 c_min为最小权和的值 k_opt到其他点距离之和最小的点

