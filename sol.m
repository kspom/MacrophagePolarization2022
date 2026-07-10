Tmax=60;
Tc=3;
global N;
global X_pump
X_pump=80; %position of ion pump that creates EF, attracting macrophages
N=100;
options = odeset('RelTol',1e-4);
A=zeros(N,5);
% for i=1:N
%     A(i,1)=(1-(i-1)/(N-1));
% %    A(i,5)=1-A(i,1);
% end
A(:,1)=1;
A1=reshape(A,N*5,1);
[T,Y] = ode15s(@f,[0:0.1:Tmax],A1,options); %solve ordinary differential equations
sz=size(T);
sz1=sz(1);
YY=reshape(Y,sz1,N,5);
nls4; %plots different plots about the solution
nls6;