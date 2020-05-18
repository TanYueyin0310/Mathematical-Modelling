% Date: 2020/05/18
% Author: TAN Yueyin
% ���ɷַ���
A = [1.4356 4.4501 2.3703 8.3952
    1.4376 4.6533 2.7542 11.2640
    1.4388 4.7852 2.8765 5.3336
    1.3402 5.0254 2.9134 9.5459
    1.3414 5.3565 2.7232 10.2169
    1.3427 5.4527 3.2881 10.4679
    1.4447 5.5126 3.3226 11.0545
    1.3474 5.7548 3.4627 11.3757];%���������ָ��ͳ�����ݱ�A(i,:)��ʾ��i������������
Max_column = max(A);%����ÿ����������ɵ�������
Min_column = min(A);
Range = Max_column - Min_column;
X = zeros(size(A));
for i = 1:4
    X(:,i) = (A(:,i)- Min_column(i))/Range(i);
end %�����׼��A����
R = corrcoef(X);%�������ϵ������,��Ϊ��������9��������4��ָ�������ɷ�,������ĸ�ָ��֮�������ϵ��,RΪ4*4����
[V,lambda] = eig(R);%lambdaΪ�Խ���,�Խ�ԪΪ����ֵ,V��ÿlambdaÿ���Խ�Ԫ(����ֵ)��Ӧ����������
sum_eig = 0;
for i =1:4
    sum_eig = sum_eig + lambda(i,i);
end
contribution = zeros(4,1);% �����ĸ�ָ�����Ϣ���׶�
for i = 1:4
    contribution(i) = lambda(i,i)/sum_eig;
end
disp(contribution);