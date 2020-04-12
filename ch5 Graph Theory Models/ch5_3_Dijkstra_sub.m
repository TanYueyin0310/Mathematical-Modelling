% Date: 2020/04/07
% Author: TAN Yueyin
% 求两点间最短路径的Dijkstra算法引用的子函数
% 30行之后不太懂
function [S,D] = ch5_3_Dijkstra_sub(i,n,W)
% i是最短路径的起始点，n为图的定点数，W为图的带权邻接矩阵
% S每一列由上至下记录了路径所经顶点的序号
% D是行向量，记录S中所示路径的大小
d = []; t = []; s = [];
s(1,1) = i; 
V = 1 : n; V(i) = [];%将集合V中的第i个元素（即i）删掉，此时V长度减1
d =[0;i];%列向量d=(0,i)^T 其中d 第二个分量为该路径终点顶点的序号 第一个分量为该路径起点到终点的距离
k = 2;
[~,n_d] = size(d);
while ~isempty(V)
    [tmp_d,j] = min(W(i,V));%返回i行j列（j∈V）中的最小值，即起点i到V中顶点的最短距离，以及第一个最短距离顶点对应的V中的坐标
    tmp_VertexNum = V(j);%返回将第一个最短距离顶点的序号
    for u = 2:n_d
        [tmp_d_loop,j_loop] = min(d(1,u) + W(d(2,u),V));
        tmp_VertexNum_loop = V(j_loop);
        t(u-1,:) = [tmp_d_loop,tmp_VertexNum_loop,j_loop];
    end
    tmp = [tmp_d,tmp_VertexNum,j;t];%将所有可能的从起点i到V中顶点的路径路径 按照（路径大小，终点顶点序号，顶点在V中的坐标）储存起来
    [tmp_d_min,tmp_PathNum] = min(tmp(:,1));
    if tmp_d_min == tmp_d %若起点i直接到V中顶点的最短距离 是 起点i从任意路径到V中所有顶点的最短距离中的最小值
        s(1:2,k) = [i;tmp(tmp_PathNum,2)];
    else
        tmp_PathVertex = find(s(:,tmp_PathNum) ~= 0);%返回路径中的有效的顶点个数（非0的，因为路径顶点个数不同，放在同一个矩阵用0补足）
        tmp_PathVertexNum = length(tmp_PathVertex);%返回路径中顶点个数
        if d(2,tmp_PathNum) == s(tmp_PathVertexNum,tmp_PathNum)%若终点顶点相同
            s(1:tmp_PathVertexNum+1,k) = [s(tmp_PathVertex,tmp_PathNum);tmp(tmp_PathNum,2)];
        else
            s(1:3,k) = [i;d(2,tmp_PathNum);tmp(tmp_PathNum,2)];
        end
    end
    d = [d,[tmp_d_min;tmp(tmp_PathNum,2)]];
    V(tmp(tmp_PathNum,3)) = [];%将目前的最短路径中新经过的点从V中删除
    [~,n_d] = size(d);
    k = k+1;
end
S = s;
D = d(1,:);
end