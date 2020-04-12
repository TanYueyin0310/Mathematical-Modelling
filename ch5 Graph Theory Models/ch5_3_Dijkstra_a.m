% Date: 2020/04/07
% Author: TAN Yueyin
% 求两点间最短路径的Dijkstra算法--代码a
W = [ 0  inf  5  30  inf inf
      2   0  inf inf  8  inf
     inf 15   0  inf inf  7
     inf inf inf  0  inf inf
     inf inf inf  5   0  inf
     inf inf inf  10  18  0];
 [S,D] = ch5_3_Dijkstra_sub(1,6,W)%输出的是1到所有其他节点的最短路径
 
 
 