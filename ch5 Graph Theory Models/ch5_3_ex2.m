% Date: 2020/04/14
% Author: TAN Yueyin
% ָ�����⣺n��������n�����飬����ÿ��ֻ��һ���¡���֪ÿ������ÿ���¶�Ӧ��Ч�ʣ�����ΰ���Ч�����
c = [13 24 31 19 40 29
     18 25 30 15 43 22
     20 20 27 25 34 33
     23 26 28 18 37 30
     28 33 34 17 38 20
     19 36 25 27 45 24];%Ч�ʾ���
n=size(c,1);%����C��������n
c=c(:);%����Ŀ�꺯��ϵ����������C�����ų�һ������������ ���� f = c^T * x
A=[];b=[];%û�в���ʽԼ��
Ae=zeros(2 * n , n  ^2);%�����Լ����ϵ������a
for i = 1 : n
    for j = (i-1) * n + 1 : n * i %sum_i(x_ij)=1,j=1,...,n
            Ae(i,j) = 1;
    end
    for k = i : n : n ^ 2 %sum_j(x_ij)=1,i=1,...,n
            Ae(n+i,k) = 1;
    end
end
be = ones(2 * n,1);%��ʽԼ���Ҷ���be
x_l = zeros(n ^ 2, 1);%���߱����½�xl
x_u = ones(n ^ 2, 1);%���߱����Ͻ�xu
[x,favl] = linprog(-c,A,b,Ae,be,x_l,x_u);%ʹ��linprog���,�����xΪ��x11,x21,...,xn1, x12,x22,...,xn2, x13,x23,...,xn3, ..., xnn)^T
x = reshape(x,n,n);%��������x�����ų�һ��n�׷���
disp('���Ž����Ϊ:');%���ָ�ɷ���������ֵ
Assignment = round(x);%ʹ��round������������ȡ��
disp(Assignment);
disp('���Ž�Ϊ:');
disp(-favl);