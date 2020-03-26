%Date:2020/3/17
%Author: TAN Yueyin
%第三章习题一-工业总产值预测(Grey)
%% 输入数据
xv = [598.750000000000,620.120000000000,634.650000000000,663.530000000000,728.120000000000,862.730000000000,952.210000000000,1073.84000000000,1304.66000000000,1524.67000000000,1642.75000000000,1947.18000000000,2429.96000000000,3327.04000000000,4255.19000000000,5349.53000000000,5126.22000000000,5649.93000000000,5763.67000000000,6213.24000000000,7022.98000000000,7806.18000000000,8730,11708.4900000000,14595.2900000000,16876.7800000000,19631.2300000000,23108.6300000000,25968.3800000000,24888.0800000000];
p =18;
x0 = xv(1:p);
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
%% 同归灰色预测模型预测后面几年的数据
year = 2010;
np = year - 1979;
xv_p = zeros(1,np);
xv_p(1) = x0(1);
for k = 1 : np - 1
    xv_p(k+1) = (1 - exp(a)) * (x0(1) - b/a) * exp(-a * k);
end
figure(3);
t1 = 1980 : (1979 + nv);%不包括预测年份
t2 = 1980 : year;%包括预测年份
plot(t1,xv,'O','color',[0.2,0.4,0.4]);hold on;plot(t2,xv_p,'-','color',[0.8,0.6,0.1],'linewidth',1.5);;xlabel("Year");ylabel("Prodcution/10^4 Yuan");hold on;%title("Prediction from 1980 to 2010 via GM(1,1)");
%% 计算用于建模的残差以及所需参数
r0 = abs(xv(p+1:nv-6) - xv_p(p+1:nv-6)); %残差数据
n_r = length(r0);
% sigma_r = r0(1:n_r-1)./r0(2:n_r);%计算级比
% Range = minmax(sigma_r);%以矩阵形式输出sigma中的最小值和最大值
r1 = cumsum(r0); %x0_p经过1-AGO得到的x1_p
alpha = 0.5; %生成系数 
for i = 2 : n_r %由x1_p计算紧邻均值生成数列z(1)
    z_r(i) = alpha * (r1(i) + r1(i-1));
end
B_r = [-z_r(2:n_r)',ones(n_r-1,1)]; % 灰方程x0(k) + a * z1(k) = b → Y = B * u （其中u = [a b]')
Y_r = r0(2:n_r)';
u_r = B_r\Y_r; a_r = u_r(1); b_r = u_r(2);%求出a,b的最小二乘值，a_r为发展系数，b_r为灰作用量
%% 通过灰色预测模型计算x0的还原值
r_p = zeros(1,np - p );
r_p(1) = r0(1);
for k = 1 : np - p - 1
%     r_p(k+1) = - a_r * (r0(k) - b_r / a_r) * exp(-a_r * (k - p + 1));
    r_p(k+1) = (1 - exp(a_r)) * (r0(1) - b_r/a_r) * exp(-a_r * k);
end
%% 将建模的残差项与原预测项相结合
xv_p(p+1:np) =  xv_p(p+1:np) - r_p;
plot(t2,xv_p,'-','color',[0.4,0.5,0.6],'linewidth',1.5);legend("Data","GM(1,1) Curve","GM(1,1) Curve with Correction");