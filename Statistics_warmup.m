%1 STATISTICS WARMUP

%PROBLEM 1.
%Write a program in Matlab that generates a sample of n iid standard normal variables, 
% and display the corresponding histogram. Repeat the operation 9 times, for n = 10, 20, 40, 80, 160, 320... and
%display the results on a 3 × 3 panel.

    %for n=10
    obs1=normrnd(0,1,[1,10]);
    %for n=20
    obs2=normrnd(0,1,[1,20]);
    %for n=40
    obs3=normrnd(0,1,[1,40]);
    %for n=80
    obs4=normrnd(0,1,[1,80]);
    %for n=160
    obs5=normrnd(0,1,[1,160]);
    %for n=320
    obs6=normrnd(0,1,[1,320]);
    %for n=640
    obs7=normrnd(0,1,[1,640]);
    %for n=1280
    obs8=normrnd(0,1,[1,1280]);
    %for n=2560
    obs9=normrnd(0,1,[1,2560]);
    
    
    
    subplot(3,3,1);
    histogram(obs1);
    title('n=10');
    
    subplot(3,3,2);
    histogram(obs2);
    title('n=20');
    
    
    subplot(3,3,3);
    histogram(obs3);
    title('n=40');
    
    subplot(3,3,4);
    histogram(obs4);
    title('n=80');
    
    subplot(3,3,5);
    histogram(obs5);
    title('n=160');
    
    
    subplot(3,3,6);
    histogram(obs6);
    title('n=320');
    
    subplot(3,3,7);
    histogram(obs7);
    title('n=640');
    
    
    subplot(3,3,8);
    histogram(obs8);
    title('n=1280');
    
    subplot(3,3,9);
    histogram(obs9);
    title('n=2560');
   
    
    %PROBLEM 2. Plots and Distributions
    
    %1. Plot the densities of the following distributions: Normal(0, 0.5),
    %Normal(0, 1), Normal(1, 1), Normal(0, 2),
    %Student(1), Student(6), Exponential(0.25), 
    % Exponential(4), Beta(1, 1), Beta(4, 2), Beta(2, 4), Beta(2, 2)
    
    subplot(3,4,1); 
    x = [-4:.1:4];
    y1 = normpdf(x,0,0.5);
    plot(x,y1);
    title('Normal(0, 0.5)');
    
    subplot(3,4,2); 
    y2 = normpdf(x,0,1);
    plot(x,y2);
    title('Normal(0, 1)');
    
    subplot(3,4,3); 
    y3 = normpdf(x,1,1);
    plot(x,y3);
    title('Normal(1, 1)');
    
    subplot(3,4,4); 
    y4 = normpdf(x,0,2);
    plot(x,y4);
    title('Normal(0, 2)');
    
    subplot(3,4,5); 
    y5 = tpdf(x,1);
    plot(x,y5);
    title('Student(1)');
    
    
    subplot(3,4,6); 
    y6 = tpdf(x,6);
    plot(x,y6);
    title('Student(6)');
    
     x = [0:.1:2];
    subplot(3,4,7); 
    y7 = exppdf(x,0.25);
    plot(x,y7);
    title('Exponential(0.25)');
    
    
     subplot(3,4,8); 
     y8 = exppdf(x,4);
     plot(x,y8);
     title('Exponential(4)');
     
     x = [0:.1:1.25];
    
    subplot(3,4,9); 
    y9= betapdf(x,1,1);
    plot(x,y9);
    title('Beta(1, 1)');
    
    
    subplot(3,4,10); 
    y10= betapdf(x,4,2);
    plot(x,y10);
    title('Beta(4, 2)');
    
    
    subplot(3,4,11); 
    y11= betapdf(x,2,4);
    plot(x,y11);
    title('Beta(2, 4)');
    
     subplot(3,4,12); 
     y12= betapdf(x,2,2);
     plot(x,y12);
     title('Beta(2, 2)');
    
     
     % 2. Write a program which generates a sample 
     % of n = 1500 RVs having a distribution in one of the above.
     % Do it for all the distributions given above. Display
     % the corresponding standard normal QQ-plots.
     
    x = [-10:.1:10];     
    subplot(3,4,1); 
    sample1= generatenormal(1500,0,0.5);
    qqplot(sample1);
    xlabel('');
    ylabel('');
    title('');
    title('Normal(0, 0.5)');
    
    subplot(3,4,2); 
    sample2= generatenormal(1500,0,1);
    qqplot(sample2);
     xlabel('');
    ylabel('');
    title('');
    title('Normal(0, 1)');
    
    subplot(3,4,3); 
    sample3= generatenormal(1500,1,1);
    qqplot(sample3);
    xlabel('');
    ylabel('');
    title('');
    title('Normal(1, 1)');
     
    
    subplot(3,4,4); 
    sample4= generatenormal(1500,0,2);
    qqplot(sample4);
    xlabel('');
    ylabel('');
    title('');
    title('Normal(0, 2)');
     
    
    subplot(3,4,5); 
    sample5= generatestu(1500,1);
    qqplot(sample5);
    xlabel('');
    ylabel('');
    title('');
    title('Student(1)');
     
    
    
    subplot(3,4,6); 
    sample6= generatestu(1500,6);
    qqplot(sample6);
    xlabel('');
    ylabel('');
    title('');
    title('Student(6)');
    
    
    
    subplot(3,4,7); 
    sample7= generateexp(1500,0.25);
    qqplot(sample7);
    xlabel('');
    ylabel('');
    title('');
    title('Exponential(0.25)');
     
    
    
     subplot(3,4,8); 
     sample8= generateexp(1500,4);
     qqplot(sample8);
     xlabel('');
    ylabel('');
    title('');
     title('Exponential(4)');
    
     
     x = [0:.1:1.25];
    
    subplot(3,4,9); 
    sample9= generatebeta(1500,1,1);
    qqplot(sample9);
    xlabel('');
    ylabel('');
    title('');
    title('Beta(1, 1)');
     
    
    subplot(3,4,10); 
    sample10= generatebeta(1500,4,2);
    qqplot(sample10);
    xlabel('');
    ylabel('');
    title('');
    title('Beta(4, 2)');
    
    
    subplot(3,4,11); 
    sample11= generatebeta(1500,2,4);
    qqplot(sample11);
    xlabel('');
    ylabel('');
    title('');
    title('Beta(2, 4)');
     
    
   
    subplot(3,4,12); 
    sample12= generatebeta(1500,2,2);
    qqplot(sample12);
    xlabel('');
    ylabel('');
    title('');
    title('Beta(2, 2)');
    
     
     
   
    


