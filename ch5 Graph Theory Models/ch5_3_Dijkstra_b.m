% Date: 2020/04/07
% Author: TAN Yueyin
% ����������·����Dijkstra�㷨--����b
W = [ 0  inf  5  30  inf inf
      2   0  inf inf  8  inf
     inf 15   0  inf inf  7
     inf inf inf  0  inf inf
     inf inf inf  5   0  inf
     inf inf inf  10  18  0];
 n = length(W);
 S(1:n) = 0;%��S������ĳ��Ԫ��Ϊ1ʱ��˵������S������
 S(1) = 1;%��˳���1�ĵ�Ϊ���
 destination = 1;
 index2 = ones(1,n);
 d(1:n) = inf; d(1) = 0; temp = 1;
 while sum(S) < n
     S_bar = find(S==0);%�ҵ����л�δ��S���еĵ㣨��������ʽ��
     d(S_bar) = min(d(S_bar),d(temp) + W(temp,S_bar));%����еĵ㵽S_bar�еĵ�ľ���Ϊmin{���ֱ�ӵ�S_bar,��㾭��temp�ٵ�S_bar�еĵ�}
     temp_shortest = find(d(S_bar) == min(d(S_bar)));
     temp = S_bar(temp_shortest(1));%����һ�γ����е�һ�����·���ĵ�temp_shortest��������ͬ���ҳ���������·��������㵽temp_shortest������·����������һ�δ�����㿪ʼ����㵽����������·��
     S(temp) = 1;%�������Ž�S��
     destination = [destination,temp];%��¼�ҵ��𵽵�ĳ�������·����˳��
     index = destination(find(d(destination) == d(temp) - W(temp,destination)));
     if length(index) >= 2
         index = index(1);
     end
     index2(temp) = index;%��ʦ˵�ǵ���˳��anyway idk
 end
 d, destination, index2