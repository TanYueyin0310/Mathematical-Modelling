clear
clc

x=zeros(401);
y=zeros(401);
z=zeros(401);
for n=1:401
for m=1:401
x(n,m)=(2-0.3*cos(m*pi/200))*cos(n*pi/200);
y(n,m)=(2-0.3*cos(m*pi/200))*sin(n*pi/200);
z(n,m)=0;
end
end

p=surf(x,y,z,'FaceAlpha','flat','AlphaDataMapping','scaled','AlphaData',gradient(z),'Facecolor','green');
set(p,'facecolor','green','edgecolor','none');
%plot3(x,y,z,'r')
alpha(.1);
axis('equal');
axis off;

speed=0.12;
direct=[1 9 0];
direct=direct/sqrt(direct(1)^2+direct(2)^2+direct(3)^2);
position=[1,0,0];

h=line('Color',[1 0 0],'Marker','.','MarkerSize',40,'EraseMode','xor');
while 1 % 无穷循环
set(h,'xdata',position(1),'ydata',position(2),'zdata',position(3)); % 小球位置
pause(0.1*(1.1-speed)) % 控制球速 
Collision=0 
for n=1:401
for m=1:401
distance=sqrt((position(1)-x(n,m))^2+(position(2)-y(n,m))^2+(position(3)-z(n,m))^2);
position1=position+speed*direct;
distance1=sqrt((position1(1)-x(n,m))^2+(position1(2)-y(n,m))^2+(position1(3)-z(n,m))^2);
if distance<0.09&&distance>distance1
f=[cos(n*pi/200) sin(n*pi/200) 0]-[x(n,m) y(n,m) z(n,m)];
f=f/sqrt(f(1)^2+f(2)^2+f(3)^2);
direct=-2*dot(f,direct)/dot(f,f)*f+direct;
direct=direct/sqrt(direct(1)^2+direct(2)^2+direct(3)^2);
Collision=1;
break;
end
end
if Collision==1
break;
end
end
position1=position+speed*direct;
a=[position(1),position1(1)];
b=[position(2),position1(2)];
c=[position(3),position1(3)];
line(a,b,c,'color','red');
position=position1;
drawnow; % 刷新屏幕 
end 