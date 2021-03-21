% CONFIDENCE INTERVALS--------------------------------


%CONFIDENCE INTERVALS FOR MEDIANS AND MEANS



% compute data sequences
Xi=[];
Yi=[];
for n=[1:N]
    Xi=[Xi, mean(V{1,n})];
    Yi=[Yi, mean(V10{1,n})];
end

Xi=sort(Xi);
Yi=sort(Yi);


% median, confidence interval for the median at level 0.95, mean and
% confidence interval for the mean at level 0.95 for N= 150

j=floor(N*0.5-0.98*sqrt(N));
%floor(N*0.95-1.96*sqrt(N*0.95*(1-0.95)))
if j<1
    j=1;
end

k=ceil(N*0.5+0.98*sqrt(N))+1;
%ceil(N*0.95+1.96*sqrt(N*0.95*(1-0.95)))+1
if k>N
    k=N;
end


medianXi = median(Xi);
CImedianXi = [Xi(j),Xi(k)];
medianYi = median(Yi);
CImedianYi = [Yi(j),Yi(k)];

meanXi = mean(Xi);
CImeanXi = [mean(Xi)-1.96*std(Xi)/sqrt(N), mean(Xi)+1.96*std(Xi)/sqrt(N)];
meanYi = mean(Yi);
CImeanYi = [mean(Yi)-1.96*std(Yi)/sqrt(N), mean(Yi)+1.96*std(Yi)/sqrt(N)];

% median, confidence interval for the median at level 0.95, mean and
% confidence interval for the mean at level 0.95 for N = 30

Xi30=[];
Yi30=[];
for n=[1:30]
    Xi30=[Xi30, mean(V{1,n})];
    Yi30=[Yi30, mean(V10{1,n})];
end

Xi30=sort(Xi30);
Yi30=sort(Yi30);

j30=10;
% floor(30*0.95-1.96*sqrt(30*0.95*(1-0.95)))
if j30<1
    j30=1;
end

k30=21;
% ceil(30*0.95+1.96*sqrt(30*0.95*(1-0.95)))+1
if k30>30
    k30=30;
end

medianXi30 = median(Xi30);
CImedianXi30 = [Xi30(j30),Xi30(k30)];
medianYi30 = median(Yi30);
CImedianYi30 = [Yi30(j30),Yi30(k30)];

meanXi30 = mean(Xi30);
CImeanXi30 = [mean(Xi30)-1.96*std(Xi30)/sqrt(30), mean(Xi30)+1.96*std(Xi30)/sqrt(30)];
meanYi30 = mean(Yi30);
CImeanYi30 = [mean(Yi30)-1.96*std(Yi30)/sqrt(30), mean(Yi30)+1.96*std(Yi30)/sqrt(30)];

figure(24)
%"X on abscissa 1, Y on abscissa 2"
subplot(2,2,1)
hold on
xlim([0 3])
ylim([1.41 1.51])
plot([1,2], [medianXi,medianYi],'rx')
line([1,1], [CImedianXi])
line([2,2], [CImedianYi])
xlabel("X on abscissa 1, Y on abscissa 2")
hold off
title("Median and its confidence interval at level 0.95 for N=150")

subplot(2,2,2)
hold on
xlim([0 3])
ylim([1.41 1.51])
plot([1, 2], [medianXi30,medianYi30], 'rx')
line([1,1], [CImedianXi30])
line([2,2], [CImedianYi30])
xlabel("X on abscissa 1, Y on abscissa 2")
hold off
title("Median and its confidence interval at level 0.95 for N=30")

subplot(2,2,3)
hold on
xlim([0 3])
ylim([1.41 1.51])
plot([1, 2], [meanXi,meanYi], 'gx')
line([1,1], [CImeanXi])
line([2,2], [CImeanYi])
xlabel("X on abscissa 1, Y on abscissa 2")
hold off
title("Mean and its confidence interval at level 0.95 for N=150")

subplot(2,2,4)
hold on
xlim([0 3])
ylim([1.41 1.51])
plot([1, 2], [meanXi30,meanYi30], 'gx')
line([1,1], [CImeanXi30])
line([2,2], [CImeanYi30])
xlabel("X on abscissa 1, Y on abscissa 2")
hold off
title("Mean and its confidence interval at level 0.95 for N=30")



% PREDICTION INTERVALS FOR SAMPLES

% a) prediction interval for a sample at level 0.95, computed assuming the data are normal and using the estimates of the mean and variance

% N = 150
PInormal = [mean(Yi)-1.96*std(Yi), mean(Yi)+1.96*std(Yi)];

%N = 60

Yi60=[];
for n=[1:60]
    Yi60=[Yi60, mean(V10{1,n})];
end

Yi60=sort(Yi60);

PInormal60 = [mean(Yi60)-1.96*std(Yi60), mean(Yi60)+1.96*std(Yi60)];

% N = 30 

PInormal30 = [mean(Yi30)-1.96*std(Yi30), mean(Yi30)+1.96*std(Yi30)];

% b) prediction interval for a sample at level 0.95, computed using order statistic

% N = 150
for k = [1:N]
    for j = [1:N]
        if (k-j)/(N+1)>=0.95
            break
        end
    end
end

PIoderstat = [Yi(j), Yi(k)];

% N = 60 

for k = [1:60]
    for j = [1:60]
        if (k-j)/(60+1)>=0.95
            break
        end
    end
end

PIoderstat60 = [Yi60(j), Yi60(k)];

% N = 30 

for k = [1:30]
    for j = [1:30]
        if (k-j)/(30+1)>=0.95
            break
        end
    end
end

PIoderstat30 = [Yi30(j), Yi30(k)];


figure(25)
subplot(1,3,1)
hold on
xlim([1 1.3])
ylim([1.3 1.7])
line([1.1,1.1], [PInormal],'Color','blue','LineStyle','--')
line([1.2,1.2], [PIoderstat],'Color','red','LineStyle','--')
legend("PI assuming normal", "PI using oder stat")
hold off
title("Prediction interval at level 0.95 for N=150")

subplot(1,3,2)
hold on
xlim([1 1.3])
ylim([1.3 1.7])
line([1.1,1.1], [PInormal60],'Color','blue','LineStyle','--')
line([1.2,1.2], [PIoderstat60],'Color','red','LineStyle','--')
legend("PI assuming normal", "PI using oder stat")
hold off
title("Prediction interval at level 0.95 for N=60")

subplot(1,3,3)
hold on
xlim([1 1.3])
ylim([1.3 1.7])
line([1.1,1.1], [PInormal30],'Color','blue','LineStyle','--')
legend("PI assuming normal")
hold off
title("Prediction interval at level 0.95 for N=30")

figure (23)
subplot(1,2,1)
qqplot(Xi)
title('X_n')
subplot(1,2,2)
qqplot(Yi)
title('Y_n')



