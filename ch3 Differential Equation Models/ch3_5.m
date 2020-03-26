%Date:2020/3/25
%Author: TAN Yueyin
%人口预测模型--GM(1,1)灰色预测模型
%% 输入数据
x0 = [11.4333 11.5823 11.7171 11.8517 11.9850 12.1121 12.2389 12.3626...
      12.4761 12.5786 12.6743 12.7627 12.8453 12.9227 12.9988 13.0756 ];
xv = [11.4333 11.5823 11.7171 11.8517 11.9850 12.1121 12.2389 12.3626...
      12.4761 12.5786 12.6743 12.7627 12.8453 12.9227 12.9988 13.0756... 
      13.1448 13.2129 13.2802 13.3450 13.4091 ];
n = length(x0); nv = length(xv);
%% 计算模型所需参数
sigma = x0(1:n-1)./x0(2:n);%计算级比
Range = minmax(sigma);%以矩阵形式输出sigma中的最小值和最大值
x1 = cumsum(x0); %x0_p经过1-AGO得到的x1_p
alpha = 0.5; %生成系数 
for i = 2 : n %由x1_p计算紧邻均值生成数列z(1)
    z(i) = alpha * (x1(i) + x1(i-1));
end
B = [-z(2:n)',ones(n-1,1)]; % 灰方程x0(k) + a * z1(k) = b → Y = B * u （其中u = [a b]')
Y = x0(2:n)';
u = B\Y; a = u(1); b = u(2);%求出a,b的最小二乘值，a为发展系数，b为灰作用量
%% 通过灰色预测模型计算x0的还原值（用于检验模型）
xv_p = zeros(1,n);
xv_p(1) = x0(1);
for k = 1 : n - 1
    xv_p(k+1) = (1 - exp(a)) * (x0(1) - b/a) * exp(-a * k);
end
%% 计算残差
residual_a = x0 - xv_p; %绝对误差
residual_r = abs(residual_a ./ x0); %相对误差
rho = 1 - (1 - alpha * a)./((1 + alpha * a) * sigma);
%% 数据可视化
t = 1990 : (1989 + n);
figure(1);%绝对残差与相对残差可视化
subplot(2,1,1);plot(t,residual_a);legend("Absolute Residuals");xlabel("Year");ylabel("Population/10^8");
subplot(2,1,2);plot(t,residual_r);legend("Relative Residuals");xlabel("Year");ylabel("Percentage");
figure(2);%x0还原值 vs x0
plot(t,x0,'r.',t,xv_p,'bo');legend("Date","Prediction");xlabel("Year");ylabel("Population/10^8");title("Prediction from 1990 to 2005 via GM(1,1)");
%% 同归灰色预测模型预测后面几年的数据
xv_p = zeros(1,nv);
xv_p(1) = x0(1);
for k = 1 : nv - 1
    xv_p(k+1) = (1 - exp(a)) * (x0(1) - b/a) * exp(-a * k);
end
figure(3);
t1 = 1990 : (1989 + nv);
plot(t1,xv,'r.',t1,xv_p,'bo');legend("Data","Prediction");xlabel("Year");ylabel("Population/10^8");title("Prediction from 1990 to 2010 via GM(1,1)");
