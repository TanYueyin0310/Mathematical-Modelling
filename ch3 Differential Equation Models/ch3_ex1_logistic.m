function y = ch3_ex1_logistic(a,tdata)
y = a(1) ./ ( 1 + (a(1) / a(3) - 1 ) * exp( - a(2) * (tdata - 1980))); 
end

