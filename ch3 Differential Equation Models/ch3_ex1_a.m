%Date:2020/3/17
%Author: TAN Yueyin
%������ϰ��һ-��ҵ�ܲ�ֵԤ��(Logistic&Malthus)
%% ��������
xdata = 1980 : 2009;
ydata = [598.750000000000,620.120000000000,634.650000000000,663.530000000000,728.120000000000,862.730000000000,952.210000000000,1073.84000000000,1304.66000000000,1524.67000000000,1642.75000000000,1947.18000000000,2429.96000000000,3327.04000000000,4255.19000000000,5349.53000000000,5126.22000000000,5649.93000000000,5763.67000000000,6213.24000000000,7022.98000000000,7806.18000000000,8730,11708.4900000000,14595.2900000000,16876.7800000000,19631.2300000000,23108.6300000000,25968.3800000000,24888.0800000000];
xdata_fit = xdata(1,1:30);
ydata_fit = ydata(1,1:30);
xdata_pred = 1980:2010;%Ԥ�����ݷ�Χ
xdata_ver = 2006:2009;%������֤ģ�͵�����
ydata_ver = ydata(1,27:30);%������֤ģ�͵�����
r0 = 0.15;%ͳ�Ƶ�һ����ֵ
a0 = [25968.38 r0  598.75];
n0 = 598.75;
figure(1);
plot(xdata,ydata,'O','color',[0.2,0.4,0.4]);
xlabel('Year');
ylabel('Industrial Production/10^8 RMB');
hold on;
%% malthusģ�� %%
%% ����С���˷���ϻ�ù��Ƶ�������r
[r, ~] = lsqcurvefit(@ch3_ex1_malthus, r0, xdata_fit, ydata_fit);
yfit_malthus_ver = n0 * exp( r * (xdata_ver - 1980));
yfit_malthus_pred = n0 * exp( r * (xdata_pred - 1980));
%% ��������
err_malthus = norm(((ydata_ver - yfit_malthus_ver)./ydata_ver),2)
%% logisticģ�� %%
%% ����С���˷���ϻ�ù��Ƶ�������r, N_m
[a, ~] = lsqcurvefit(@ch3_ex1_logistic, a0, xdata_fit, ydata_fit);
yfit_logistic_ver = a(1) ./ ( 1 + (a(1) /  a(3) - 1 ) * exp( - a(2) * (xdata_ver - 1980)));
yfit_logistic_pred = a(1) ./ ( 1 + (a(1) /  a(3) - 1 ) * exp( - a(2) * (xdata_pred - 1980)));
%% ��������
err_logistic = norm(((ydata_ver - yfit_logistic_ver)./ydata_ver),2)
%% ��ͼ
plot( xdata_pred, yfit_malthus_pred, '-','color',[0.4,0.5,0.6],'linewidth',1.5);
plot(xdata_pred,yfit_logistic_pred,'-','color',[0.8,0.6,0.1],'linewidth',1.5);
xlabel('Year');
ylabel('Industrial Production/10^8');
legend({'Data from 1980 to 2010','Malthus Model Curve','Logistic Model Curve','location'},'location','northwest');