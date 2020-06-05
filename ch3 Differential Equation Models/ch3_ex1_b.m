%Date:2020/3/17
%Author: TAN Yueyin
%������ϰ��һ-��ҵ�ܲ�ֵԤ��(Grey)
%% ��������
xv = [598.750000000000,620.120000000000,634.650000000000,663.530000000000,728.120000000000,862.730000000000,952.210000000000,1073.84000000000,1304.66000000000,1524.67000000000,1642.75000000000,1947.18000000000,2429.96000000000,3327.04000000000,4255.19000000000,5349.53000000000,5126.22000000000,5649.93000000000,5763.67000000000,6213.24000000000,7022.98000000000,7806.18000000000,8730,11708.4900000000,14595.2900000000,16876.7800000000,19631.2300000000,23108.6300000000,25968.3800000000,24888.0800000000];
year_used2predict =18;
x0 = xv(1:year_used2predict);%��ǰp�����������Ԥ��
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
%% ͬ���ɫԤ��ģ��Ԥ����漸�������
year_end = 2010;
year_start = 1979;
np = year_end - year_start;
xv_p = zeros(1,np);
xv_p(1) = x0(1);
for k = 1 : np - 1
    xv_p(k+1) = (1 - exp(a)) * (x0(1) - b/a) * exp(-a * k);
end
t1 = 1980 : (year_start + nv);%������Ԥ�����
t2 = 1980 : year_end;%����Ԥ�����
plot(t1,xv,'O','color',[0.2,0.4,0.4]);%����ʵ���ݵ�
hold on;
plot(t2,xv_p,'-','color',[0.8,0.6,0.1],'linewidth',1.5);;%������GM(1,1)����Ԥ���Ԥ������
hold on;%title("Prediction from 1980 to 2010 via GM(1,1)");
%% �������ڽ�ģ�Ĳв��Լ��������
year_v_rp = 6;%������Ԥ�����ݺ�һ�꿪ʼ���Բв���л�ɫԤ�⣬�������year_v_rp���жԲв�Ԥ������ݽ��м��飨�����year_v_rp������ݲ����ڲвģ��
r0 = abs(xv(year_used2predict+1:nv-year_v_rp) - xv_p(year_used2predict+1:nv-year_v_rp)); %�в�����
n_r = length(r0);
% sigma_r = r0(1:n_r-1)./r0(2:n_r);%���㼶��
% Range = minmax(sigma_r);%�Ծ�����ʽ���sigma�е���Сֵ�����ֵ
r1 = cumsum(r0); %x0_p����1-AGO�õ���x1_p
alpha = 0.5; %����ϵ�� 
for i = 2 : n_r %��x1_p������ھ�ֵ��������z(1)
    z_r(i) = alpha * (r1(i) + r1(i-1));
end
B_r = [-z_r(2:n_r)',ones(n_r-1,1)]; % �ҷ���x0(k) + a * z1(k) = b �� Y = B * u ������u = [a b]')
Y_r = r0(2:n_r)';
u_r = B_r\Y_r; a_r = u_r(1); b_r = u_r(2);%���a,b����С����ֵ��a_rΪ��չϵ����b_rΪ��������
%% ͨ����ɫԤ��ģ�ͼ���r0�Ļ�ԭֵ
r_p = zeros(1,np - year_used2predict );
r_p(1) = r0(1);
for k = 1 : np - year_used2predict - 1
%     r_p(k+1) = - a_r * (r0(k) - b_r / a_r) * exp(-a_r * (k - year_used2predict + 1));
    r_p(k+1) = (1 - exp(a_r)) * (r0(1) - b_r/a_r) * exp(-a_r * k);
end
%% ����ģ�Ĳв�����ԭԤ��������
xv_p(year_used2predict+1:np) =  xv_p(year_used2predict+1:np) - r_p;
plot(t2,xv_p,'-','color',[0.4,0.5,0.6],'linewidth',1.5);
legend("Data","GM(1,1) Curve","GM(1,1) Curve with Correction");
xlabel("Year");ylabel("Prodcution/10^4 Yuan")