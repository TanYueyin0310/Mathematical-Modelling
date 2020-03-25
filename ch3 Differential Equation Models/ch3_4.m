%Date:2020/3/23
%Author: TAN Yueyin
%湖水污染房室模型
ts = 0 : 0.1 : 50;
x0 = [3, 2, 1];
[t, x] = ode45('ch3_4_Lake', ts, x0);
figure(1);
subplot(3,1,1), plot(t, x(:,1), 'r'), grid, legend('Phosphorus_Lake');
subplot(3,1,2), plot(t, x(:,2), 'k:'), grid, legend('Phosphorus_Plant');
subplot(3,1,3), plot(t, x(:,3)), grid, legend('Phosphorus_Animals');
hold on
figure(2);
subplot(1,3,1),plot(x(:,1),x(:,2),'r'),grid,legend('Phosphorus_Plant&Lake');
subplot(1,3,2),plot(x(:,1),x(:,3),'k:'),grid,legend('Phosphorus_Lake&Animals');
subplot(1,3,3),plot(x(:,2),x(:,3)),grid,legend('Phosphorus_Plant&Animals');
figure(3);
plot3(x(:,1),x(:,2),x(:,3));
hold on 
legend('Phosphorus_Lake&Plant&Animals');
grid on