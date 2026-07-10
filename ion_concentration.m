function y1=ion_concentration(x);
A=1;
n=1.25;
z=x/10;
y1 =  A*(exp(-z*z/n));