%Date:2020/6/2
%Author: TAN Yueyin
%�����������΢�ַ���
%eg. y'=2x+y x in (1,2)
%    y(0)=1
x_min = 0;
x_max = 2;
N = 20;%�ֵ�С��������
h = (x_max - x_min)/N;%����
x = x_min : h : x_max;
y(1) =1;%ע������y��1����ʾ��һ��x��Ӧy��ֵ����һ��x = x_min = 0
Ef = @(x,y)(2*x+y);%�˴�Ϊy'=f(x,y)�е�f
for i = 1 :N
    k1 = h * Ef(x(i),y(i));
    k2 = h * Ef(x(i)+h/2,y(i)+k1/2);
    k3 = h * Ef(x(i)+h/2,y(i)+k2/2);
    k4 = h *Ef(x(i)+h,y(i)+k3);
    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
end
plot(x,y);
hold on
y1=3*exp(x)-2*x-2;%��ȷ��
plot(x,y1);
legend('��ֵ��','��ȷ��');
