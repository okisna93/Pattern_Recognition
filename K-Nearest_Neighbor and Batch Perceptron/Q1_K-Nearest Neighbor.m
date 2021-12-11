disp('Ismet Okan Celik , CWID:10472265')

load hw3.mat
d1=hw3_2_1;
d2=hw3_2_2;
n=100;
x1=[-4:0.1:8;-4:0.1:8];
b=0;
k=10
for i=-4:0.1:8
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
        if i==1 & j==-2
            disp('If p1x>p2x, x=[1,-2] belongs to class-1 other wise class-2')
            p1x=p1(b,c)
            p2x=p2(b,c)
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


for z=1:1:n
    a=[1;-2];
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
    
    plot_matrix= [z p1x p2x sqrt(distance1) sqrt(distance2) ];
    Generaltable(z,:)=plot_matrix;

end
disp('General Comparison of Two Classes for Given x=[1,-2]')
T = array2table(Generaltable,...
    'VariableNames',{'Iteration','p1x','p2x','dis1','dis2'})


disp('If we compare all p1x and p2x for x=[1,-2]')
disp('We can see that p1x>p2x for every step')
disp('For that reason x=[1,-2] belongs to hw3_2_1')
disp('For Comparison of the distance, distance1<distance2 for 99 steps')
disp('Based on distances we can say that x=[1,-2] belongs to hw3_2_1 ')
            
        
        



