soil=cell(100,100);
old=cell(100,100);
i=1;
a=100;
b=200;
l=b/a;
condition=0;
pLS=0;
N2=0;
highlevel=0;
lowlevel=0;
third=0;

while(i<=100)
j=1;
    while(j<=100)
        soil{i,j}=0;
        old{i,j}=0;
        j=j+1;
    end
    i=i+1;
end

soil{50,49}=1;
soil{50,50}=1;
soil{50,51}=1;
soil{49,49}=1;
soil{49,50}=1;
soil{49,51}=0;
soil{30,39}=1;
soil{30,40}=1;
soil{29,39}=1;
soil{29,40}=1;
soil{51,49}=2;
soil{51,50}=2;

soil{20,20}=3;
soil{20,21}=3;
soil{21,20}=3;
soil{21,21}=3;
soil{20,22}=3;



f=1;
m=99;
n=1;
all=0;

while(f<=200)
    m=99;
    while(m>=2)
       n=2;
       while(n<=99)
           
          if(soil{m-1,n-1}==1)
             condition=condition+1;
           end
           if(soil{m-1,n}==1)
             condition=condition+1;
           end
           if(soil{m-1,n+1}==1)
             condition=condition+1;
           end
           if(soil{m,n-1}==1)
             condition=condition+1;
           end
           if(soil{m,n}==1)
             condition=condition+1;
           end
           if(soil{m,n+1}==1)
             condition=condition+1;
           end
           if(soil{m+1,n-1}==1)
             condition=condition+1;
           end
           if(soil{m+1,n}==1)
             condition=condition+1;
           end
           if(soil{m+1,n+1}==1)
             condition=condition+1;
           end
           
           
           if(condition>=2)
               old{m,n}=1;
           end
           if(condition<=1)
               old{m,n}=0;
           end
           if(condition>7)
               old{m,n}=0;
           end
           
           
          
           if(soil{m-1,n-1}==3)
               pLS=pLS+1;
           end
           if(soil{m-1,n}==3)
               pLS=pLS+1;
           end
           if(soil{m-1,n+1}==3)
               pLS=pLS+1;
           end
           if(soil{m,n-1}==3)
               pLS=pLS+1;
           end
           if(soil{m,n}==3)
               pLS=pLS+1;
           end
           if(soil{m,n+1}==3)
               pLS=pLS+1;
           end
           if(soil{m+1,n-1}==3)
               pLS=pLS+1;
           end
           if(soil{m+1,n}==3)
               pLS=pLS+1;
           end
           if(soil{m+1,n+1}==3)
               pLS=pLS+1;
           end
           
           if(soil{m-1,n-1}==2)
               N2=N2+1;
           end
           if(soil{m-1,n}==2)
               N2=N2+1;
           end
           if(soil{m-1,n+1}==2)
               N2=N2+1;
           end
           if(soil{m,n-1}==2)
               N2=N2+1;
           end
           if(soil{m,n}==2)
               N2=N2+1;
           end
           if(soil{m,n+1}==2)
               N2=N2+1;
           end
           if(soil{m+1,n-1}==2)
               N2=N2+1;
           end
           if(soil{m+1,n}==2)
               N2=N2+1;
           end
           if(soil{m+1,n+1}==2)
               N2=N2+1;
           end
           
           
           
           
           if(condition>=3&&N2>=2)
               old{m,n}=2;
           end
           if(condition<=6&&N2>=3)
               if(soil{m,n}==2)
                   old{m,n}=0;
               end
           end
         
           
           if(m>=45&&m<=55)
               if(condition>=2&&N2>=2)
                    old{m,n}=2;
               end
               if(condition<=6&&N2>=3)
                    if(soil{m,n}==2)
                       old{m,n}=0;
                    end
                end
           end
           
           
           all=N2+condition;
           if(soil{m,n}==3)
               if(pLS>=2)
                   soil{m,n}=3;
               end
               if(all>=7)
                   if(N2>=4)
                       soil{m,n}=3;
                   end
               end
           else
               if(pLS>=4)
                    soil{m,n}=3;
                end
                if(pLS>=6);
                    soil{m,n}=3;
                end
           end
           
           
           all=0;
           condition=0;
           pLS=0;
           N2=0;
         n=n+1;
       end
       m=m-1;
    end
    k=1;
    while(k<=100)
        r=1;
        while(r<=100)
           soil{k,r}=old{k,r};
           r=r+1;   
        end
        k=k+1;
    end
    for p=1:100
        for q=1:100
           if(soil{p,q}==1)
                lowlevel=lowlevel+1;
           end    
           if(soil{p,q}==2)
                highlevel=highlevel+1;
           end    
           if(soil{p,q}==3)
                third=third+1;
           end   
        end
    end 
    f=f+1;
    lowlevel
    highlevel
    third
    lowlevel=0;
    highlevel=0;
    third=0;
end
m=100;
n=100;
x=zeros(m,1);
y=zeros(n,1);
for i=1:m
    x(i)=-4.0+i*8.0/m;
end
for j=1:n
    y(j)=-4.0+8.0*j/n;
end

z=zeros(m,n);

for i=1:m
    for j=1:n
        tempx=x(i);
        tempy=y(j);
        z(i,j)=soil{i,j};
    end
end
surf(z,'EdgeColor','None');
shading interp;
disp(soil)
