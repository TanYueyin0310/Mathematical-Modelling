%Date:2020/6/2
%Author: TAN Yueyin
%Euler����΢�ַ���
%eg. y'=2x+y x in (1,2)
%    y(0)=1
x_min = 0;
x_max = 2;
N = 20;%�ֵ�С��������
h = (x_max - x_min)/N;%����
x = x_min : h : x_max;
y(1) =1;%ע������y��1����ʾ��һ��x��Ӧy��ֵ����һ��x = x_min = 0
Ef = @(x,y)(2*x+y);%�˴�Ϊy'=f(x,y)�е�f
for n = 1 :N
    y(n+1)=y(n)+h * Ef(x(n),y(n));
end
plot(x,y);
hold on
y1=3*exp(x)-2*x-2;%��ȷ��
plot(x,y1);
legend('��ֵ��','��ȷ��');