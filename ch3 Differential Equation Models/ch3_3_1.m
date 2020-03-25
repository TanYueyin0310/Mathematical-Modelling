%Date:2020/3/17
%Author: TAN Yueyin
%人口预测模型--Malthus模型
%% 输入数据
xdata = 1982 : 1999;
ydata = [10.1654 10.3008 10.4357 10.5851 10.7507 10.9300 11.1026 11.2704 11.4333 11.5823 11.7171 11.8517 11.9850 12.1121 12.2389 12.3626 12.4761 12.5786 ]
r0 = 0.2;%给r一个初始值
n0 = 10.1654
%% 用最小二乘法拟合获得估计的增长率r
[r, Resnorm] = lsqcurvefit(@ch3_3_1_malthus, r0, xdata, ydata)
yfit = n0 * exp( r * (xdata - 1982));
%% 画图
plot(xdata, ydata, '*b', xdata, yfit, '-r');
xlabel('Year');
ylabel('Population/10^8');
err = norm((yfit-ydata)/ydata,2)

