function f = ch1_1_4_investment_d(x)
a(1) = 0.440726425059603;
a(2) = 1.23979945933993;
a(3) = 1.523798490077090;
s0 = 0.028736610052265;
s(1) = 0.005225745014121;
s(2) = 0.014220576087342;
s(3) = 0.027501498700834;
f = 0;
for i = 1 : 3
    f = f + (a(i) * s0  * x(i)) ^ 2 + (s(i) * x(i)) ^ 2;
end
end