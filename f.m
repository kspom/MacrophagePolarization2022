function dy = f(t,y)
global N;
y=reshape(y,N,5);
dy=zeros(N,5);
global alfa
global D1
b=1;
g1=0.1;
g2=0.1;
kr=0.2;
alfa=1.8;
k=0.05;
k4=0.1;
n=5;
D=0.32; %D=400 mkm^2/hour D~=DT/L^2 for T=8h, L=1mm
h=0.03;
D1=0.0003;
global X_pump

tetta=zeros(1,N);
% for i=1:N
%     tetta(i)=actuator(t,2,2)*ion_concentration(i-X_pump);
% end

% for i=1:N
%     tetta1=actuator(t,9,3)*ion_concentration(i-80);
%     tetta2=actuator(t,5,3)*ion_concentration(i-40);
%     tetta(i)=tetta1+tetta2;
% end

for i=1:N
    dy(i,1) = -y(i,1)*y(i,2);                          %dA
    dy(i,2) = b*y(i,1)-y(i,1)*y(i,2)-g1*y(i,2)-tetta(i)*y(i,2)-k4*(y(i,2)^n)/((k^n)+(y(i,2)^n)); %dM1
    dy(i,3) = k4*(y(i,2)^n)/((k^n)+(y(i,2)^n))-g2*y(i,3)+tetta(i)*y(i,2);        %dM2
    dy(i,4) = y(i,3)-kr*y(i,4);                        %dN
    dy(i,5) = alfa*y(i,4)*y(i,5)*(1-y(i,5));                   %dNt
end

%diffusion:
dy(1,2)=dy(1,2)+D*(y(2,2)-y(1,2))/(h*h);
dy(1,3)=dy(1,3)+D*(y(2,3)-y(1,3))/(h*h);
dy(1,5)=dy(1,5)+D1*y(1,4)*(y(2,5)-y(1,5))/(h*h);
for i=2:N-1
    dy(i,2)=dy(i,2)+D*(y(i-1,2)-2*y(i,2)+y(i+1,2))/(h*h);
    dy(i,3)=dy(i,3)+D*(y(i-1,3)-2*y(i,3)+y(i+1,3))/(h*h);
    dy(i,5)=dy(i,5)+D1*y(i,4)*(y(i-1,5)-2*y(i,5)+y(i+1,5))/(h*h);
end
dy(N,2)=dy(N,2)+D*(y(N-1,2)-y(N,2))/(h*h);
dy(N,3)=dy(N,3)+D*(y(N-1,3)-y(N,3))/(h*h);
dy(N,5)=dy(N,5)+D1*y(N,4)*(y(N-1,5)-2*y(N,5)+1)/(h*h);

y=reshape(y,N*5,1);
dy=reshape(dy,N*5,1);