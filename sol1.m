Tmax=200;
Tc=3;
global N;
global X_pump
X_pump=80; %position of ion pump that creates EF, attracting macrophages
N=100;
options = odeset('RelTol',1e-4);
A=zeros(N,5);
for i=1:10
    A(:,1)=i*.1;
    A1=reshape(A,N*5,1);
    [T,Y] = ode15s(@f,[0:0.1:Tmax],A1,options); %solve ordinary differential equations
    sz=size(T);
    sz1=sz(1);
    YY=reshape(Y,sz1,N,5);
    nls10
end
xlabel('Macropages M1 (inflammation)')
ylabel('Macropages M2 (reparation)')