% Date: 2020/04/07
% Author: TAN Yueyin
% 求两点间最短路径的Dijkstra算法--代码b
W = [ 0  inf  5  30  inf inf
      2   0  inf inf  8  inf
     inf 15   0  inf inf  7
     inf inf inf  0  inf inf
     inf inf inf  5   0  inf
     inf inf inf  10  18  0];
 n = length(W);
 S(1:n) = 0;%当S向量中某个元素为1时，说明他在S集合中
 S(1) = 1;%以顺序第1的点为起点
 destination = 1;
 index2 = ones(1,n);
 d(1:n) = inf; d(1) = 0; temp = 1;
 while sum(S) < n
     S_bar = find(S==0);%找到所有还未在S集中的点（以坐标形式）
     d(S_bar) = min(d(S_bar),d(temp) + W(temp,S_bar));%起点中的点到S_bar中的点的距离为min{起点直接到S_bar,起点经过temp再到S_bar中的点}
     temp_shortest = find(d(S_bar) == min(d(S_bar)));
     temp = S_bar(temp_shortest(1));%将这一次尝试中第一个最短路径的点temp_shortest（若有相同）找出来，则条路径就是起点到temp_shortest点的最短路径，并且下一次从这个点开始找起点到其他点的最短路径
     S(temp) = 1;%将这个点放进S中
     destination = [destination,temp];%记录找到起到到某个点最短路径的顺序
     index = destination(find(d(destination) == d(temp) - W(temp,destination)));
     if length(index) >= 2
         index = index(1);
     end
     index2(temp) = index;%老师说是迭代顺序，anyway idk
 end
 d, destination, index2