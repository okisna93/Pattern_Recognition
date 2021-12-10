load hw3.mat
d1=hw3_2_1;
d2=hw3_2_2;
n=100;
x1=[-4:0.1:8;-4:0.1:8];
b=0;
k=10
for i=-4:0.1:8
    tic
    b=b+1;
    c=0;
    for j=-4:0.1:8
        c=c+1;
        p1(b,c)=0;
        p2(b,c)=0;
        for z=1:1:n
            a=[i;j];
            data1=hw3_2_1(:,z);
            data2=hw3_2_2(:,z);

            distance1=a-data1;
            distance1=distance1(1)^2+distance1(2)^2;

            distance2=a-data2;
            distance2=distance2(1)^2+distance2(2)^2;

            V1=pi*distance1;
            V2=pi*distance2;

            p1x=(k/n)/V1;
            p2x=(k/n)/V2;
            
            p1(b,c)=p1(b,c)+p1x;
            p2(b,c)=p2(b,c)+p2x;
        end       
    end    
end

[X,Y]=meshgrid(-4:0.1:8);
figure(1)
mesh(X,Y,p1)
colorbar
figure(2)
mesh(X,Y,p2)
colorbar

p1_Test=0;
p2_Test=0;
for z=1:1:n
    a=[i;j];
    data1=hw3_2_1(:,z);
    data2=hw3_2_2(:,z);

    distance1=a-data1;
    distance1=distance1(1)^2+distance1(2)^2;

    distance2=a-data2;
    distance2=distance2(1)^2+distance2(2)^2;

    V1=pi*distance1;
    V2=pi*distance2;

    p1x=(10/n)/V1;
    p2x=(10/n)/V2;
    
    plot_matrix= [z double(p1x) double(p2x)];
    Generaltable(z,:)=plot_matrix;

end

T = array2table(Generaltable,...
    'VariableNames',{'Iteration','p1x','p2x'})
            
        
        



