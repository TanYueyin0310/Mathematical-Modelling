clc,clear
x0=[598.75 620.12 634.65 663.53 782.12 862.73 952.21 1073.84 1304.66 1524.67 ...
1642.75 1947.18 2429.96 3327.04 4255.19 5349.53 5126.22 5649.93 5763.67 6213.24 ...
7022.98 7806.18 8730.00 11708.49 14595.29 16876.78 19631.23 23108.63 25968.38 24888.08]; %初始数据
n=length(x0) ;sigma=x0(1:n-1)./x0(2:n);
range=minmax(sigma);x1=cumsum(x0);%1-AGO

%光滑性检验
rho=x0(2:n)./x1(1:n-1);%光滑比
m1=ones(1,n-3);
for k=2:n-2
m1(k-1)=rho(k+1)/rho(k);
end
figure(1)
plot(1:n-3,m1,'*r',[1,n-3],[1,1],'-b'); grid on;
text(n-3+0.2,1,'临界线') %指标1

%指标二
figure(2)
plot(1:n-1,rho,'*r',[1,n-1],[0.5,0.5],'-b');grid on;
text(n-1+0.2,0.5,'临界线');

%建立GM（1,1）
for i=2:n
z(i)=0.5*(x1(i)+x1(i-1));
end
B = [-z(2:n)',ones(n-1,1)];Y = x0(2:n)';u = B\Y;
a = u(1); b = u(2);
x0_hat=zeros(1,n);x0_hat(1)=x0(1);
for k=1:n
x0_hat(k+1)=(1-exp(a))*(x0(1)-b/a)*exp(-a*k);
end

figure(3)
plot(1980:2009,x0,'-ob',1980:2010,x0_hat,'-*r')


%建立残差GM（1,1）
x1_hat=zeros(1,n);x1_hat(1)=x0(1);
for k=1:n-1
 x1_hat(k+1) = (1 - exp(a)) * (x0(1) - b/a) * exp(-a * k);
end
e=abs(x0(19:n)-x1_hat(19:n));%残差尾端
e1=cumsum(e);
m=length(e);
sigma_e=e(1:m-1)./e(2:m); range_e=minmax(sigma_e);

for i=2:m
z_e(i)=0.5*(e1(i)+e1(i-1));
end
B_e=[-z_e(2:m)',ones(m-1,1)];Y_e = e(2:m)';u_e = B_e\Y_e;
c = u_e(1); d = u_e(2);
e_hat=zeros(1,m);e_hat(1)=e(1);
for k=1:m-1
 e_hat(k+1) = (1 - exp(c)) * (e(1) - d/c) * exp(-c * k);
end
x0_e=zeros(1,n);x0_e(1:18)=x0_hat(1:18);
x0_e(19:n)=x0_hat(19:n)-e_hat(1:m);

figure(4)
plot(1980:2009,x0,'-ob',1980:2009,x0_e,'-*r',1980:2009,x0_e,'-O');