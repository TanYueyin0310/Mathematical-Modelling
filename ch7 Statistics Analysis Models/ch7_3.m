% Date: 2020/05/18
% Author: TAN Yueyin
% 主成分分析
%% 输入数据
clear;
A = [1.4356 4.4501 2.3703 8.3952
    1.4376 4.6533 2.7542 11.2640
    1.4388 4.7852 2.8765 5.3336
    1.3402 5.0254 2.9134 9.5459
    1.3414 5.3565 2.7232 10.2169
    1.3427 5.4527 3.2881 10.4679
    1.4447 5.5126 3.3226 11.0545
    1.3474 5.7548 3.4627 11.3757];%输入湖泊各指标统计数据表A(i,:)即第i行表示第i个湖泊的数据
[sample_num,index_num] = size(A);
%% 极差标准化A矩阵
Max_column = max(A);%返回每列最大的数组成的行向量
Min_column = min(A);
Range = Max_column - Min_column;
X = zeros(size(A));
for i = 1:index_num
    X(:,i) = (A(:,i)- Min_column(i))/Range(i);
end %极差标准化A矩阵
%% 求主成分
R = corrcoef(X);%计算相关系数矩阵,因为本题中是9个湖泊的4个指标求主成分,因此是四个指标之间求相关系数,R为4*4矩阵
[V,lambda] = eig(R);%lambda为对角阵,对角元为特征值越往右下特征值越大,V是每lambda每个对角元(特征值)对应的特征向量
%% 计算四个指标的信息贡献度
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
%% 求得主成分的个数
for i = 1 : index_num
    factor_num = i;
    contribution_sum = contribution_sum + contribution(index_num+1-i);%从后往前累加贡献率
    if contribution_sum >= 0.85
        break
    end
end 
%% 用主成分进行打分
eig = zeros(index_num,1);
for i = 1:index_num
    eig(i) = lambda(i,i);
end
grade = X * V(:,2:index_num) * eig(index_num+1-factor_num:index_num);