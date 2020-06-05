% Date: 2020/05/18
% Author: TAN Yueyin
% ���ɷַ���
%% ��������
clear;
A = [1.4356 4.4501 2.3703 8.3952
    1.4376 4.6533 2.7542 11.2640
    1.4388 4.7852 2.8765 5.3336
    1.3402 5.0254 2.9134 9.5459
    1.3414 5.3565 2.7232 10.2169
    1.3427 5.4527 3.2881 10.4679
    1.4447 5.5126 3.3226 11.0545
    1.3474 5.7548 3.4627 11.3757];%���������ָ��ͳ�����ݱ�A(i,:)����i�б�ʾ��i������������
[sample_num,index_num] = size(A);
%% �����׼��A����
Max_column = max(A);%����ÿ����������ɵ�������
Min_column = min(A);
Range = Max_column - Min_column;
X = zeros(size(A));
for i = 1:index_num
    X(:,i) = (A(:,i)- Min_column(i))/Range(i);
end %�����׼��A����
%% �����ɷ�
R = corrcoef(X);%�������ϵ������,��Ϊ��������9��������4��ָ�������ɷ�,������ĸ�ָ��֮�������ϵ��,RΪ4*4����
[V,lambda] = eig(R);%lambdaΪ�Խ���,�Խ�ԪΪ����ֵԽ����������ֵԽ��,V��ÿlambdaÿ���Խ�Ԫ(����ֵ)��Ӧ����������
%% �����ĸ�ָ�����Ϣ���׶�
sum_eig = 0;
contribution_sum=0;
for i =1:index_num
    sum_eig = sum_eig + lambda(i,i);
end
contribution = zeros(index_num,1);
for i = 1:index_num
    contribution(i) = lambda(i,i)/sum_eig;
end
disp(contribution);
%% ������ɷֵĸ���
for i = 1 : index_num
    factor_num = i;
    contribution_sum = contribution_sum + contribution(index_num+1-i);%�Ӻ���ǰ�ۼӹ�����
    if contribution_sum >= 0.85
        break
    end
end 
%% �����ɷֽ��д��
eig = zeros(index_num,1);
for i = 1:index_num
    eig(i) = lambda(i,i);
end
grade = X * V(:,2:index_num) * eig(index_num+1-factor_num:index_num);