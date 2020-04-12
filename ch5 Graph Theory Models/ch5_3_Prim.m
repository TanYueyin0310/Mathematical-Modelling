% Date:2020/04/12
% Author: TAN Yueyin
% 求一个图的最小生成树的Prim算法
w = [inf 45  60  inf inf inf inf
     45  inf inf 60  42  inf inf
     60  inf inf 52  inf inf 50
     inf 60  52  inf inf inf 50
     inf 42  inf 50  inf 72  inf
     inf inf inf 30  72  inf inf
     inf inf 50  40  inf inf inf];%权重矩阵
 result = [];
 U = 1;
 V = 2 : length(w);%U+V等于所有顶点的集合，U为已包括的（对某点已满足最小权的），V为未包括的
 while length(result) ~= length(w) - 1 %利用定理：n个顶点的无向连通图是树的充要条件是有n-1条边
     temp = w(U,V);
     temp = temp(:);%a(:)表示将a的所有元素列成一列
     d_min = min(temp);
     [j,k] = find(w(U,V) == d_min);%找U集合到V集合的最小权，并记录其路径（由其坐标即可在U，V集合中确定路径两端点）
     Path_j = U(j(1));%存储找到的这条路径终点(在U集合中）
     Path_k = V(k(1));%存储找到的这条路径终点(在V集合中）
     result = [result,[Path_j;Path_k;d_min]];%将这一条路径储存到之前路径集合之中
     U = [U,Path_k];%将已找到满足“U到V权为当时V中点最小”的点加入U
     V(k(1)) = [];%并从V中去掉
 end
 disp(result);