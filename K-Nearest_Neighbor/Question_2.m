load hw4.mat
d1=hw4_2_1;
d2=hw4_2_2;

% QUESTION 2-1

% figure(1);  
% scatter(d1(1,:),d1(2,:),'MarkerEdgeColor',[0 .5 .5],...
%               'MarkerFaceColor',[0 .7 .7],...
%               'LineWidth',1.5)
% hold();
% scatter(d2(1,:),d2(2,:),'MarkerEdgeColor',[.1 .1 .1],...
%               'MarkerFaceColor',[.8 .4 .3],...
%               'LineWidth',1.5)
% xlabel('x')
% ylabel('y')
% legend('hw421','hw422','Location','northeastoutside')
% title('Data Set Distribution')
% hold();


% QUESTION 2-2
x1x2_d1=[d1(1,:).*d1(2,:)];
d1_3D=[d1(1,:);d1(2,:);x1x2_d1];

x1x2_d2=[d2(1,:).*d2(2,:)];
d2_3D=[d2(1,:);d2(2,:);x1x2_d2];

% figure(2);
% scatter3(d1(1,:),d1(2,:),x1x2_d1,'MarkerEdgeColor',[0 .5 .5],...
%               'MarkerFaceColor',[0 .7 .7],...
%               'LineWidth',1.5)
% hold();
% scatter3(d2(1,:),d2(2,:),x1x2_d2,'MarkerEdgeColor',[.1 .1 .1],...
%               'MarkerFaceColor',[.8 .4 .3],...
%               'LineWidth',1.5)
% xlabel('x')
% ylabel('y')
% zlabel('x*y')
% legend('hw421','hw422','Location','northeastoutside')
% title('Data Set Distribution 3D')
% hold();

% QUESTION 2-3
one = ones(1,100);

Y1=[one(1,:);d1(1,:);d1(2,:);x1x2_d1];
Y2=-1*[one(1,:);d2(1,:);d2(2,:);x1x2_d2];

sum_Y1=sum(Y1,2);
sum_Y2=sum(Y2,2);


theta=1;
a1=sum_Y1;
a2=sum_Y2;
iteration=0;
n=1;

% for i=1:1:length(Y1)
%     k=k+1;
%     g1(k,:)=a1'*Y1(:,i);
%     if g1(k,:)<0
%         t=t+1;
%         Y1_revs(:,t)=Y1(:,i);
%     end
% end
% Y1_revs
% ak=a1+n*sum(Y1_revs,2);
% a1=ak
% yll=sqrt(sum(Y1_revs,2)'*sum(Y1_revs,2))


true=1;
while(true)
    iteration=iteration+1
    g1_sum=-1*sum(a1'*Y1)
    g1=a1'*Y1
    l=find(g1<0);
    Y1=Y1(:,l);
    lly1ll=sqrt((n*sum(Y1,2)')*(n*sum(Y1,2)))
    if (lly1ll>theta)
        ak=a1+n*sum(Y1,2);
        a1=ak 
    else
        true=0;
    end  
end





% iteration=0
% true=1;
% while(true)
%     iteration=iteration+1
%     g2_sum=sum(a2'*Y2)
%     g2=a2'*Y2;
%     l=find(g2<0);
%     Y2=Y2(:,l);
%     lly2ll=sqrt(sum(Y2,2)'*sum(Y2,2))
%     if (lly2ll>theta)
%         ak=a2+n*sum(Y2,2);
%         a2=ak
%     else
%         true=0;
%     end  
% end





