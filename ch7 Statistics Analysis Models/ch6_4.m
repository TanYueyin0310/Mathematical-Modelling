% Date:2020/06/05
% Author: TAN Yueyin
% 聚类分析：20个土地样本，有若干个指标，根据这些进行聚类
sample=[77.3 13.0 9.7 1.5 6.4
82.5 10.0 7.5 1.5 6.5
66.9 20.6 12.5 2.3 7.0
47.2 33.3 19.0 2.8 5.8
65.3 20.5 14.2 1.9 6.9
83.3 10.0 6.7 2.2 7.0
81.6 12.7 5.7 2.9 6.7
47.8 36.5 15.7 2.3 7.2
48.6 37.1 14.3 2.1 7.2
61.6 25.5 12.9 1.9 7.3
58.6 26.5 14.9 2.4 6.7
69.3 22.3 8.4 4.0 7.0
61.8 30.8 7.4 2.7 6.4
67.7 25.3 7.0 7.8 4.8
57.2 31.2 11.6 2.4 6.5
67.2 22.7 10.1 3.3 6.2
59.2 31.2 9.6 2.4 6.0
80.2 13.2 6.6  2.0 5.8
82.2 11.1 6.7 2.2 7.2
69.7 20.7 9.6 3.1 5.9];%每一行是一个土地样本的几个指标(未标准化）
Distance_Euclid = pdist(sample,'Euclidean');
ClassDistance_Euclid = linkage(Distance_Euclid,'single');
[H,T] = dendrogram(ClassDistance_Euclid,'colorthreshold','default','orientation','left');
class_num = 3;%将样本分成三类
SampleClass = cluster(ClassDistance_Euclid,class_num);
disp("Type 1");find(SampleClass == 1)
disp("Type 2");find(SampleClass == 2)
disp("Type 3");find(SampleClass == 3)