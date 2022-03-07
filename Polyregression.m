clc;
clear;
n=input(' No of Coeff.= ');

for i=1:n
    x(i)=input(' ');
end
for i=1:n
    y(i)=input(' ');
end

a11=n;
a12=sum(x);
a13=sum(x.^2);
a21=sum(x);
a22=sum(x.^2);
a23=sum(x.^3);
a31=sum(x.^2);
a32=sum(x.^3);
a33=sum(x.^4);

b1=sum(y);
b2=sum(x.*y);
b3=sum(x.^2.*y);

x2=0;
x3=0;

for k=1:1000
    a0=(b1-a12*x2-a13*x3)/a11;
    x1=a0;
    a1=(b2-a21*x1-a23*x3)/a22;
    x2=a1;
    a2=(b3-a31*x1-a32*x2)/a33;
    x3=a2;
end

a0
a1
a2

for i=1:n
    y1(i)=a0+a1*x(i)+a2*x(i).^2;
end

plot(x,y,x,y1)

sr=0;
st=0;

for i=1:n
    sr=sr+(y(i)-a0-a1*x(i)-a2*x(i).^2).^2;
    st=st+(y(i)-mean(y)).^2;
end

sr
st

syx=sqrt(sr/(n-3))
r2=(st-sr)/st


legend({'Unfitted Curve','Fitted Curve'})