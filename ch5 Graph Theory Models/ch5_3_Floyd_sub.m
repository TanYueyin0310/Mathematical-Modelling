% 求任意两点之间距离的Floyd算法 调用的子函数
function [k,d,r,c_min,k_opt] = ch5_3_Floyd_sub(w)
[n,~] = size(w);
d = w;
for i = 1 : n
    for j = 1 : n
        r(i,j) = j;
    end
end
% 以下 d 为距离矩阵, r 用来记录最短路径
for k = 1 : n
    for i = 1 : n
        for j = 1:n
            if d(i,k) + d(k,j) < d(i,j)%将k点插入i，j点之中试探是否路径更短
                d(i,j) = d(i,k) + d(k,j);
                r(i,j) = r(i,k);
            end
        end
    end
    sprintf('%s','迭代次数='),disp(k);
    sprintf('%s','迭代后距离阵为'),disp(d);
end
sprintf('%s','最优路径阵为'),disp(r);
C = zeros(1,n);%总权向量初始化
for i = 1 : n
    for j = 1 : n
        C(i) = C(i) + d(i,j);
    end
end
c_min = min(C,[],'all');
c_min = c_min(1);
k_opt = find(C == c_min);
sprintf('%s','最小总权为'),disp(c_min);
sprintf('%s','最优顶点编号为'),disp(k_opt);  
end

