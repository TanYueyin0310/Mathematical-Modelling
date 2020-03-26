% plot(t2,xv_p,'-o','color',[0.3,0.5,0.1],'linewidth',1.5);;xlabel("Year");ylabel("Prodcution/10^4 Yuan");
% hold on
% plot( xdata_pred, yfit_malthus_pred, '-o','color',[0.4,0.5,0.6],'linewidth',1.5);
% hold on
% plot(xdata_pred,yfit_logistic_pred,'-o','color',[0.8,0.6,0.1],'linewidth',1.5);legend("Data","GM(1,1) Curve","Malthus Model Curve","Logistic Model Curve");
% hold on
% plot(t1,xv,'*','color',[0.6,0.4,0.4]);
% legend("GM(1,1) Curve","Malthus Model Curve","Logistic Model Curve","Data");
% hold on
%Date:2020/3/17
%Author: TAN Yueyin
%������ϰ��һ-��ҵ�ܲ�ֵԤ��(Grey)
%% ��������
xv = [[1282.10445107108,2105.43844351749,2798.56786918037,3789.74875257393,4960.87290779475,4455.80394978669,4489.27828536850,5655.64534256807,6971.94929264599,8300.73395957487,11115.4637576427,14601.4555363619]];
p =12;
x0 = xv(1:p);
n = length(x0); nv = length(xv);
%% ����ģ���������
sigma = x0(1:n-1)./x0(2:n);%���㼶��
Range = minmax(sigma);%�Ծ�����ʽ���sigma�е���Сֵ�����ֵ
x1 = cumsum(x0); %x0_p����1-AGO�õ���x1_p
alpha = 0.5; %����ϵ�� 
for i = 2 : n %��x1_p������ھ�ֵ��������z(1)
    z(i) = alpha * (x1(i) + x1(i-1));
end
B = [-z(2:n)',ones(n-1,1)]; % �ҷ���x0(k) + a * z1(k) = b �� Y = B * u ������u = [a b]')
Y = x0(2:n)';
u = B\Y; a = u(1); b = u(2);%���a,b����С����ֵ��aΪ��չϵ����bΪ��������
%% ͨ����ɫԤ��ģ�ͼ���x0�Ļ�ԭֵ�����ڼ���ģ�ͣ�
xv_p = zeros(1,n);
xv_p(1) = x0(1);
for k = 1 : n - 1
    xv_p(k+1) = (1 - exp(a)) * (x0(1) - b/a) * exp(-a * k);
end
%% ����в�
% residual_a = x0 - xv_p; %�������
% residual_r = abs(residual_a ./ x0); %������
% rho = 1 - (1 - alpha * a)./((1 + alpha * a) * sigma);
%% ���ݿ��ӻ�
% t = 1980 : (1979 + n);
% figure(1);%���Բв�����Բв���ӻ�
% subplot(2,1,1);plot(t,residual_a);legend("Absolute Residuals");xlabel("Year");ylabel("Production/10^4 Yuan");
% subplot(2,1,2);plot(t,residual_r);legend("Relative Residuals");xlabel("Year");ylabel("Percentage");
% figure(2);%x0��ԭֵ vs x0
% plot(t,x0,'O','color',[0.2,0.4,0.4]);hold on;plot(t,xv_p,'bo');legend("Date","Prediction");xlabel("Year");ylabel("Prodcution/10^4 Yuan");title("Prediction from 1980 to 2005 via GM(1,1)");
%% ͬ���ɫԤ��ģ��Ԥ����漸�������
xv_p = zeros(1,nv+1);
xv_p(1) = x0(1);
for k = 1 : nv
    xv_p(k+1) = (1 - exp(a)) * (x0(1) - b/a) * exp(-a * k);
end
figure(3);
t1 = 1980 : (1979 + nv);%������Ԥ��2010
t2 = 1980 : (1980 + nv);%����Ԥ��2010
plot(t1,xv,'O','color',[0.2,0.4,0.4]);hold on;plot(t2,xv_p,'-','color',[0.1,0.6,0.1],'linewidth',1.5);;xlabel("Year");ylabel("Prodcution/10^4 Yuan");hold on;%title("Prediction from 1980 to 2010 via GM(1,1)");
