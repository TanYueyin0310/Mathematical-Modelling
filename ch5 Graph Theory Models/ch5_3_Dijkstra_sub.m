% Date: 2020/04/07
% Author: TAN Yueyin
% ����������·����Dijkstra�㷨���õ��Ӻ���
% 30��֮��̫��
function [S,D] = ch5_3_Dijkstra_sub(i,n,W)
% i�����·������ʼ�㣬nΪͼ�Ķ�������WΪͼ�Ĵ�Ȩ�ڽӾ���
% Sÿһ���������¼�¼��·��������������
% D������������¼S����ʾ·���Ĵ�С
d = []; t = []; s = [];
s(1,1) = i; 
V = 1 : n; V(i) = [];%������V�еĵ�i��Ԫ�أ���i��ɾ������ʱV���ȼ�1
d =[0;i];%������d=(0,i)^T ����d �ڶ�������Ϊ��·���յ㶥������ ��һ������Ϊ��·����㵽�յ�ľ���
k = 2;
[~,n_d] = size(d);
while ~isempty(V)
    [tmp_d,j] = min(W(i,V));%����i��j�У�j��V���е���Сֵ�������i��V�ж������̾��룬�Լ���һ����̾��붥���Ӧ��V�е�����
    tmp_VertexNum = V(j);%���ؽ���һ����̾��붥������
    for u = 2:n_d
        [tmp_d_loop,j_loop] = min(d(1,u) + W(d(2,u),V));
        tmp_VertexNum_loop = V(j_loop);
        t(u-1,:) = [tmp_d_loop,tmp_VertexNum_loop,j_loop];
    end
    tmp = [tmp_d,tmp_VertexNum,j;t];%�����п��ܵĴ����i��V�ж����·��·�� ���գ�·����С���յ㶥����ţ�������V�е����꣩��������
    [tmp_d_min,tmp_PathNum] = min(tmp(:,1));
    if tmp_d_min == tmp_d %�����iֱ�ӵ�V�ж������̾��� �� ���i������·����V�����ж������̾����е���Сֵ
        s(1:2,k) = [i;tmp(tmp_PathNum,2)];
    else
        tmp_PathVertex = find(s(:,tmp_PathNum) ~= 0);%����·���е���Ч�Ķ����������0�ģ���Ϊ·�����������ͬ������ͬһ��������0���㣩
        tmp_PathVertexNum = length(tmp_PathVertex);%����·���ж������
        if d(2,tmp_PathNum) == s(tmp_PathVertexNum,tmp_PathNum)%���յ㶥����ͬ
            s(1:tmp_PathVertexNum+1,k) = [s(tmp_PathVertex,tmp_PathNum);tmp(tmp_PathNum,2)];
        else
            s(1:3,k) = [i;d(2,tmp_PathNum);tmp(tmp_PathNum,2)];
        end
    end
    d = [d,[tmp_d_min;tmp(tmp_PathNum,2)]];
    V(tmp(tmp_PathNum,3)) = [];%��Ŀǰ�����·�����¾����ĵ��V��ɾ��
    [~,n_d] = size(d);
    k = k+1;
end
S = s;
D = d(1,:);
end