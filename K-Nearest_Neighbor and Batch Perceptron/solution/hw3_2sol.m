clear
%d1=2.*randn(2,100);
%d2=[4;4]*ones(1,100)+randn([2,100]);

load hw3.mat
d1=hw3_2_1;
d2=hw3_2_2;

h1=2; h100=0.2;
n =0;m=0;
for i=-4:0.1:8,
    n=n+1;m=0;
    for j=-4:0.1:8,
        m=m+1;
        dd=d1-[i;j]*ones(1,100);
        dis=dd(1,:).^2+dd(2,:).^2;
        p1(n,m)=(1/100)*(1/h100)*(1/sqrt(2*pi))*sum(exp((-dis)./(2*h100^2)));
        if i==1 & j==-2
            p1x=p1(n,m)
        end
    end
end

        
h1=2; h100=0.2;
n =0;m=0;
for i=-4:0.1:8,
    n=n+1;m=0;
    for j=-4:0.1:8,
        m=m+1;
        dd=d2-[i;j]*ones(1,100);
        dis=dd(1,:).^2+dd(2,:).^2;
        p2(n,m)=(1/100)*(1/h100)*(1/sqrt(2*pi))*sum(exp((-dis)./(2*h100^2)));
        if i==1 & j==-2
            p2x=p2(n,m),
        end
    end
end

mesh(p1);
%hold;
figure
mesh(p2);


%PNN

% d=[d1,d2];
% l=[ones(1,100),2*ones(1,100)];
% x=[1,-1];
% sig=0.2;
% t=PNN(d,l,x,sig);


d1n=sqrt(d1(1,:).^2+d1(2,:).^2);
d2n=sqrt(d2(1,:).^2+d2(2,:).^2);
d1=[d1(1,:)./d1n; d1(2,:)./d1n];
d2=[d2(1,:)./d2n; d2(2,:)./d2n];
x=[1;-2];
xn=sqrt(x(1)^2+x(2)^2);
x=[x(1)/xn;x(2)/xn];
sig2=0.04;
net1=x'*d1;
net2=x'*d2;
g1=sum(exp((net1-1)/sig2)),
g2=sum(exp((net2-1)/sig2)),