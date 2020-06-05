%Date:2020/6/2
%Author: TAN Yueyin
%Euler法解微分方程
%eg. y'=2x+y x in (1,2)
%    y(0)=1
x_min = 0;
x_max = 2;
N = 20;%分的小区间数量
h = (x_max - x_min)/N;%步长
x = x_min : h : x_max;
y(1) =1;%注意这里y（1）表示第一个x对应y的值，第一个x = x_min = 0
Ef = @(x,y)(2*x+y);%此处为y'=f(x,y)中的f
for n = 1 :N
    y(n+1)=y(n)+h * Ef(x(n),y(n));
end
plot(x,y);
hold on
y1=3*exp(x)-2*x-2;%精确解
plot(x,y1);
legend('数值解','精确解');