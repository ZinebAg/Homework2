
% Simulation
tic 

N = 150;
L = 1000;
Vmin = 1;
Vmax = 2;
Ts = 86400;

X=cell(1,N);
T=cell(1,N);
V=cell(1,N);


for n = [1:N]

    Mn = [unifrnd(0,L), unifrnd(0,L)];
    Tn=[0];
    Vn=[unifrnd(Vmin,Vmax)];
    Xn = [Mn, Tn];


    while Tn<Ts
        M = [unifrnd(0,L), unifrnd(0,L)];
        Xn=[Xn; M, Tn(end)+norm(M-Mn)/Vn(end)];
        Tn=[Tn; Tn(end)+norm(M-Mn)/Vn(end)];
        Vn=[Vn; unifrnd(Vmin,Vmax)];
        Mn=M;
    end
    
    X{1,n} = Xn;
    T{1,n} = Tn;
    V{1,n} = Vn;
end 

toc

% 1. computes and displays the mean, the minimum and the maximum number of waypoints reached by the 
% different mobiles for only one simulation run

sizesX = [];

for n = [1:N]
    sizesX = [sizesX, length(X{1,n}(:,1))];
end

figure(1)
boxplot(sizesX);
hold on
ylim([210 275]);
scatter(1,min(sizesX),'d', 'filled','b');
scatter(1,max(sizesX),'d','filled','r');


% 2. displays the trajectory and waypoints of one user; of 5 users.
figure(2)
subplot(2,1,1)
plot(X{1,1}(:,1),X{1,1}(:,2),'-')
title("Course of one user")

subplot(2,1,2)
plot(X{1,1}(:,1),X{1,1}(:,2),'.')
title("Waypoints of one user")


figure(3)
subplot(2,1,1)
hold on
plot(X{1,30}(:,1),X{1,30}(:,2),'-')
plot(X{1,60}(:,1),X{1,60}(:,2),'-')
plot(X{1,90}(:,1),X{1,90}(:,2),'-')
plot(X{1,120}(:,1),X{1,120}(:,2),'-')
plot(X{1,150}(:,1),X{1,150}(:,2),'-')
title("Course of 5 users")
hold off
subplot(2,1,2)
hold on
plot(X{1,30}(:,1),X{1,30}(:,2),'.')
plot(X{1,60}(:,1),X{1,60}(:,2),'.')
plot(X{1,90}(:,1),X{1,90}(:,2),'.')
plot(X{1,120}(:,1),X{1,120}(:,2),'.')
plot(X{1,150}(:,1),X{1,150}(:,2),'.')
title("Waypoints of 5 users")
hold off