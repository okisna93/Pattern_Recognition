clear
%d1=randn([2,70]); d2=[4;-4]*ones(1,30)+2.*randn([2,30]);
%d0=[d1,d2];
%o=randperm(50);
%d=d0;
%for i=2:2:100
%    d(:,i)=d0(:,2*o(i/2));
%end

load hw3.mat
d=hw3_1;

%initial label
l=[ones(1,50),2*ones(1,50)];

% iteration 1
%maximization
d1_indices=find(l==1);
d2_indices=find(l==2);
sd1=size(d1_indices,2); 
sd2=size(d2_indices,2);

rho1=sd1; rho2=sd2;

mu1=mean(d(:,d1_indices),2), mu2=mean(d(:,d2_indices),2),
dd1=d(:,d1_indices)-mu1*ones(1,sd1);
dd2=d(:,d2_indices)-mu2*ones(1,sd2);
cov1=(dd1*dd1')/sd1,
cov2=(dd2*dd2')/sd2,

%expectation
icov1=inv(cov1);
icov2=inv(cov2);

l=zeros(1,100);
for i=1:100
    likelihood1=(1/(2*pi*sqrt(det(cov1))))*exp(-0.5*(d(:,i)-mu1)'*icov1*(d(:,i)-mu1));
    likelihood2=(1/(2*pi*sqrt(det(cov2))))*exp(-0.5*(d(:,i)-mu2)'*icov2*(d(:,i)-mu2));
    if likelihood1*rho1>likelihood2*rho2
        l(i)=1;
    else
        l(i)=2;
    end
end

% iteration 2
%maximization
d1_indices=find(l==1);
d2_indices=find(l==2);
sd1=size(d1_indices,2); 
sd2=size(d2_indices,2);

rho1=sd1; rho2=sd2;

mu1=mean(d(:,d1_indices),2), mu2=mean(d(:,d2_indices),2),
dd1=d(:,d1_indices)-mu1*ones(1,sd1);
dd2=d(:,d2_indices)-mu2*ones(1,sd2);
cov1=(dd1*dd1')/sd1,
cov2=(dd2*dd2')/sd2,

%expectation
icov1=inv(cov1);
icov2=inv(cov2);

l=zeros(1,100);
for i=1:100
    likelihood1=(1/(2*pi*sqrt(det(cov1))))*exp(-0.5*(d(:,i)-mu1)'*icov1*(d(:,i)-mu1));
    likelihood2=(1/(2*pi*sqrt(det(cov2))))*exp(-0.5*(d(:,i)-mu2)'*icov2*(d(:,i)-mu2));
    if likelihood1*rho1>likelihood2*rho2
        l(i)=1;
    else
        l(i)=2;
    end
end

         
% iteration 3
%maximization
d1_indices=find(l==1);
d2_indices=find(l==2);
sd1=size(d1_indices,2); 
sd2=size(d2_indices,2);

rho1=sd1; rho2=sd2;

mu1=mean(d(:,d1_indices),2), mu2=mean(d(:,d2_indices),2),
dd1=d(:,d1_indices)-mu1*ones(1,sd1);
dd2=d(:,d2_indices)-mu2*ones(1,sd2);
cov1=(dd1*dd1')/sd1,
cov2=(dd2*dd2')/sd2,

%expectation
icov1=inv(cov1);
icov2=inv(cov2);

l=zeros(1,100);
for i=1:100
    likelihood1=(1/(2*pi*sqrt(det(cov1))))*exp(-0.5*(d(:,i)-mu1)'*icov1*(d(:,i)-mu1));
    likelihood2=(1/(2*pi*sqrt(det(cov2))))*exp(-0.5*(d(:,i)-mu2)'*icov2*(d(:,i)-mu2));
    if likelihood1*rho1>likelihood2*rho2
        l(i)=1;
    else
        l(i)=2;
    end
end

% iteration 4
%maximization
d1_indices=find(l==1);
d2_indices=find(l==2);
sd1=size(d1_indices,2); 
sd2=size(d2_indices,2);

rho1=sd1; rho2=sd2;

mu1=mean(d(:,d1_indices),2), mu2=mean(d(:,d2_indices),2),
dd1=d(:,d1_indices)-mu1*ones(1,sd1);
dd2=d(:,d2_indices)-mu2*ones(1,sd2);
cov1=(dd1*dd1')/sd1,
cov2=(dd2*dd2')/sd2,

%expectation
icov1=inv(cov1);
icov2=inv(cov2);

l=zeros(1,100);
for i=1:100
    likelihood1=(1/(2*pi*sqrt(det(cov1))))*exp(-0.5*(d(:,i)-mu1)'*icov1*(d(:,i)-mu1));
    likelihood2=(1/(2*pi*sqrt(det(cov2))))*exp(-0.5*(d(:,i)-mu2)'*icov2*(d(:,i)-mu2));
    if likelihood1*rho1>likelihood2*rho2
        l(i)=1;
    else
        l(i)=2;
    end
end

