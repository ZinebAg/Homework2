%   EVENT AVERAGE (PALM) VIEWPOINT--------------------------

% a) Display the histogram of speeds sampled at transition epochs Tn, based on the samples for one mobile
% and for all mobiles


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

% histogram of speeds sampled at transition epochs Tn for one user
figure(7)
histogram(V{1,1})
title("Histogram of speeds sampled at transition epochs Tn using samples for one mobile")

% histogram of speeds sampled at transition epochs Tn for all users
Vall=[];
for n=[1:N]
    Vall=[Vall; V{1,n}];
end 

figure(8)
histogram(Vall)
title("Histogram of speeds sampled at transition epochs Tn using samples for all mobiles")


%b) Show a histogram of mobile positions based on the samples for one user and for all users. To this
% end, discretize the area into square bins; display a grey shade diagram where the intensity of the grey
% is proportional to the frequency.

% histogram of mobile positions based on the samples for one user and with transition epochs Tn
square1=zeros(100);
indexxcurrent=[];
indexycurrent=[];
for i=transpose(X{1,1}(:,1))
    indexx=1;
    for s = 0: 10: L
        if i==0
            indexxcurrent=[indexxcurrent, indexx];
        end
        if i>s && i<=s+10
            indexxcurrent=[indexxcurrent, indexx];
        end
        indexx=indexx+1;
    end
end
for j = transpose(X{1,1}(:,2))
    indexy=1;
    for s = 0: 10: L  
        if j==0
            indexycurrent=[indexycurrent, indexy];
        end
        if j>s && j<=s+10
            indexycurrent=[indexycurrent, indexy];
        end
        indexy=indexy+1;
    end
end
for k=[1:length(indexycurrent)]
    square1(indexxcurrent(k), indexycurrent(k))=square1(indexxcurrent(k), indexycurrent(k))+1;
end

figure(9)
surf(square1)
colormap('gray')
title("Histogram of mobile positions based on the samples for one user with transition epochs Tn- move the mouse to get the 2D projection")

figure(10)
surf(square1)
colormap default
title("Colored istogram of mobile positions based on the samples for one user with transition epochs Tn- move the mouse to get the 2D projection")

% histogram of mobile positions based on the samples for all users and with transition epochs Tn
square=zeros(100);

for n=[1:N]
    indexxcurrent=[];
    indexycurrent=[];
    for i=transpose(X{1,n}(:,1))
        indexx=1;
        for s = 0: 10: L
            if i==0
                indexxcurrent=[indexxcurrent, indexx];
            end
            if i>s && i<=s+10
                indexxcurrent=[indexxcurrent, indexx];
            end
            indexx=indexx+1;
        end
    end
    for j = transpose(X{1,n}(:,2))
        indexy=1;
        for s = 0: 10: L  
            if j==0
                indexycurrent=[indexycurrent, indexy];
            end
            if j>s && j<=s+10
                indexycurrent=[indexycurrent, indexy];
            end
            indexy=indexy+1;
        end
    end
    for k=[1:length(indexycurrent)]
        square(indexxcurrent(k), indexycurrent(k))=square(indexxcurrent(k), indexycurrent(k))+1;
    end
end

figure(12)
surf(square)
colormap('gray')
title("Histogram of mobile positions based on the samples for all users with transition epochs Tn")


%   TIME AVERAGE VIEWPOINT---------------------------------------

% a) Now sample the position and speed of mobiles every 10 seconds. Display the histogram of speeds
% sampled every 10 seconds (based on the samples for one mobile and for all mobiles).


% sample the position and speed of mobiles every 10 seconds

X10=cell(1,N);
T10=cell(1,N);
V10=cell(1,N);

for n=[1:N]
    Xn=[X{1,n}(1,1), X{1,n}(1,2)];
    Vn=[V{1,n}(1,1)];
    Tn=[0];
    t=10;
        for i=1:length(T{1,n})-1
            while t>=T{1,n}(i) && t<T{1,n}(i+1) && t<=Ts
                Vn=[Vn; V{1,n}(i,1)];
                a=(X{1,n}(i+1,2)-X{1,n}(i,2))/(X{1,n}(i+1,1)-X{1,n}(i,1));
                b=X{1,n}(i,2)-a*X{1,n}(i,1);
                disti=10*Vn(end);
                x=Xn(end,1);
                if X{1,n}(i+1,1)-Xn(end,1)>0
                    while norm([x, a*x+b]-[Xn(end,1), Xn(end,2)])<disti && x<X{1,n}(i+1,1)
                        x=x+1;
                    end
                elseif X{1,n}(i+1,1)-Xn(end,1)<0
                    while norm([x, a*x+b]-[Xn(end,1), Xn(end,2)])<disti && x>X{1,n}(i+1,1)
                        x=x-1;
                    end
                end
                
                if norm([x, a*x+b]-[Xn(end,1), Xn(end,2)])>norm([X{1,n}(i+1,1), X{1,n}(i+1,2)]-[Xn(end,1), Xn(end,2)])
                    Xn=[Xn; X{1,n}(i+1,1), X{1,n}(i+1,2)];
                    Tn=[Tn; t];
                elseif a*x+b>1000
                    Xn=[Xn; x, 1000];
                    Tn=[Tn; t];
                elseif a*x+b<0
                    Xn=[Xn; x, 0];
                    Tn=[Tn; t];
                else
                    Xn=[Xn; x, a*x+b];
                    Tn=[Tn; t];
                end 
                t=t+10;
            end
        end
    X10{1,n} = Xn;
    T10{1,n} = Tn;
    V10{1,n} = Vn;
end



%histogram of speeds sampled every 10 seconds based on the samples for one mobile
figure(15)
histogram(V10{1,1})
title("Histogram of speeds sampled every 10 seconds using samples for one mobile")

%histogram of speeds sampled every 10 seconds based on the samples for all mobiles
Vall=[];
for n=[1:N]
    Vall=[Vall; V10{1,n}];
end 

figure(16)
histogram(Vall)
title("Histogram of speeds sampled every 10 seconds using samples for all mobiles")



%b) Similarly, display a histogram of mobile positions sampled every 10 seconds (based on the samples 
% for one mobile and for all mobiles)


% histogram of mobile positions sampled every 10 seconds (based on the samples for one mobile)
square101=zeros(100);

indexxcurrent=[];
indexycurrent=[];
for i=transpose(X10{1,1}(:,1))
    indexx=1;
    for s = 0: 10: L
        if i==0
            indexxcurrent=[indexxcurrent, indexx];
        end
        if i>s && i<=s+10
            indexxcurrent=[indexxcurrent, indexx];
        end
        indexx=indexx+1;
    end
end
for j = transpose(X10{1,1}(:,2))
    indexy=1;
    for s = 0: 10: L  
        if j==0
            indexycurrent=[indexycurrent, indexy];
        end
        if j>s && j<=s+10
            indexycurrent=[indexycurrent, indexy];
        end
        indexy=indexy+1;
    end
end
for k=[1:min(length(indexycurrent),length(indexxcurrent))]
    square101(indexxcurrent(k), indexycurrent(k))=square101(indexxcurrent(k), indexycurrent(k))+1;
end

figure(19)
surf(square101)
colormap('gray')
title("Histogram of mobile positions sampled every 10 seconds for one user")

% histogram of mobile positions sampled every 10 seconds (based on the samples for all mobiles)
square10=zeros(100);

for n=[1:N]
    indexxcurrent=[];
    indexycurrent=[];
    for i=transpose(X10{1,n}(:,1))
        indexx=1;
        for s = 0: 10: L
            if i==0 && indexx<=100
                indexxcurrent=[indexxcurrent, indexx];
            end
            if i>s && i<=s+10 && indexx<=100
                indexxcurrent=[indexxcurrent, indexx];
            end
            indexx=indexx+1;
        end
    end
    for j = transpose(X10{1,n}(:,2))
        indexy=1;
        for s = 0: 10: L  
            if j==0 && indexy<=100
                indexycurrent=[indexycurrent, indexy];
            end
            if j>s && j<=s+10 && indexy<=100
                indexycurrent=[indexycurrent, indexy];
            end
            indexy=indexy+1;
        end
    end
    for k=[1:min(length(indexycurrent),length(indexxcurrent))]
        square10(indexxcurrent(k), indexycurrent(k))=square10(indexxcurrent(k), indexycurrent(k))+1;
    end
end

figure(21)
surf(square10)
colormap('gray')
title("Histogram of mobile positions sampled every 10 seconds for all users")


