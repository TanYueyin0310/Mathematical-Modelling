function [h] = m2(x)
n = length(x);
dt = 0.01;
h = zeros(n,1);
for t = zeros(n,1):0.01*ones(n,1):sin(x)
    dy = ((1 - t.^2).^1.5).*dt;
    h = h +dy;
end

end
