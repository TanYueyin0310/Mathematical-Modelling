% Date:2020/04/12
% Author: TAN Yueyin
% ��һ��ͼ����С��������Prim�㷨
w = [inf 45  60  inf inf inf inf
     45  inf inf 60  42  inf inf
     60  inf inf 52  inf inf 50
     inf 60  52  inf inf inf 50
     inf 42  inf 50  inf 72  inf
     inf inf inf 30  72  inf inf
     inf inf 50  40  inf inf inf];%Ȩ�ؾ���
 result = [];
 U = 1;
 V = 2 : length(w);%U+V�������ж���ļ��ϣ�UΪ�Ѱ����ģ���ĳ����������СȨ�ģ���VΪδ������
 while length(result) ~= length(w) - 1 %���ö���n�������������ͨͼ�����ĳ�Ҫ��������n-1����
     temp = w(U,V);
     temp = temp(:);%a(:)��ʾ��a������Ԫ���г�һ��
     d_min = min(temp);
     [j,k] = find(w(U,V) == d_min);%��U���ϵ�V���ϵ���СȨ������¼��·�����������꼴����U��V������ȷ��·�����˵㣩
     Path_j = U(j(1));%�洢�ҵ�������·���յ�(��U�����У�
     Path_k = V(k(1));%�洢�ҵ�������·���յ�(��V�����У�
     result = [result,[Path_j;Path_k;d_min]];%����һ��·�����浽֮ǰ·������֮��
     U = [U,Path_k];%�����ҵ����㡰U��VȨΪ��ʱV�е���С���ĵ����U
     V(k(1)) = [];%����V��ȥ��
 end
 disp(result);