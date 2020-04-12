% ����������֮������Floyd�㷨 ���õ��Ӻ���
function [k,d,r,c_min,k_opt] = ch5_3_Floyd_sub(w)
[n,~] = size(w);
d = w;
for i = 1 : n
    for j = 1 : n
        r(i,j) = j;
    end
end
% ���� d Ϊ�������, r ������¼���·��
for k = 1 : n
    for i = 1 : n
        for j = 1:n
            if d(i,k) + d(k,j) < d(i,j)%��k�����i��j��֮����̽�Ƿ�·������
                d(i,j) = d(i,k) + d(k,j);
                r(i,j) = r(i,k);
            end
        end
    end
    sprintf('%s','��������='),disp(k);
    sprintf('%s','�����������Ϊ'),disp(d);
end
sprintf('%s','����·����Ϊ'),disp(r);
C = zeros(1,n);%��Ȩ������ʼ��
for i = 1 : n
    for j = 1 : n
        C(i) = C(i) + d(i,j);
    end
end
c_min = min(C,[],'all');
c_min = c_min(1);
k_opt = find(C == c_min);
sprintf('%s','��С��ȨΪ'),disp(c_min);
sprintf('%s','���Ŷ�����Ϊ'),disp(k_opt);  
end

