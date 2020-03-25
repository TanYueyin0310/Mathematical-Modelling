%Date:2020/3/17
%Author: TAN Yueyin
%�˿�Ԥ��ģ��--Malthusģ��
%% ��������
xdata = 1982 : 1999;
ydata = [10.1654 10.3008 10.4357 10.5851 10.7507 10.9300 11.1026 11.2704 11.4333 11.5823 11.7171 11.8517 11.9850 12.1121 12.2389 12.3626 12.4761 12.5786 ]
r0 = 0.2;%��rһ����ʼֵ
n0 = 10.1654
%% ����С���˷���ϻ�ù��Ƶ�������r
[r, Resnorm] = lsqcurvefit(@ch3_3_1_malthus, r0, xdata, ydata)
yfit = n0 * exp( r * (xdata - 1982));
%% ��ͼ
plot(xdata, ydata, '*b', xdata, yfit, '-r');
xlabel('Year');
ylabel('Population/10^8');
err = norm((yfit-ydata)/ydata,2)

