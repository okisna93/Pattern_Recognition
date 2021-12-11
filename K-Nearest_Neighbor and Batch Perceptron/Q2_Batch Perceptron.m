
load hw4.mat
d1=hw4_2_1;
d2=hw4_2_2;

% QUESTION 2-1

figure(1);  
scatter(d1(1,:),d1(2,:),'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
hold();
scatter(d2(1,:),d2(2,:),'MarkerEdgeColor',[.1 .1 .1],...
              'MarkerFaceColor',[.8 .4 .3],...
              'LineWidth',1.5)
xlabel('x')
ylabel('y')
legend('hw421','hw422','Location','northeastoutside')
title('Data Set Distribution')
hold();


% QUESTION 2-2
x1x2_d1=[d1(1,:).*d1(2,:)];
d1_3D=[d1(1,:);d1(2,:);x1x2_d1];

x1x2_d2=[d2(1,:).*d2(2,:)];
d2_3D=[d2(1,:);d2(2,:);x1x2_d2];

figure(2);
scatter3(d1(1,:),d1(2,:),x1x2_d1,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
hold();
scatter3(d2(1,:),d2(2,:),x1x2_d2,'MarkerEdgeColor',[.1 .1 .1],...
              'MarkerFaceColor',[.8 .4 .3],...
              'LineWidth',1.5)
xlabel('x')
ylabel('y')
zlabel('x*y')
legend('hw421','hw422','Location','northeastoutside')
title('Data Set Distribution 3D')
hold();

% QUESTION 2-3
one = ones(1,100);

Y1=[one(1,:);d1(1,:);d1(2,:);x1x2_d1]
Y2=-1*[one(1,:);d2(1,:);d2(2,:);x1x2_d2]

Y=cat(2,Y1,Y2);
a=sum(Y,2)
ak=a;

theta=1;
iteration=0
n=1;
true=1;

while(true)
    iteration=iteration+1
    g=a'*Y;
    l=find(g<0);
    if(sqrt(ak'*ak)>theta)
        ak=n*sum(Y(:,l),2);
        a=a+ak 
    else
        true=0;
    end
end




