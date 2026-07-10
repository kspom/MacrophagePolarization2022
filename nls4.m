figure
timepoint=10;
subplot(2,2,3), plot(T/Tc,YY(:,timepoint,1),T/Tc,YY(:,timepoint,2),T/Tc,YY(:,timepoint,3),...
    T/Tc,YY(:,timepoint,4)/5,T/Tc,YY(:,timepoint,5)),...
    title ('radius=10'), legend('Debris','M1','M2','N','Nt')
timepoint=80;
subplot(2,2,4), plot(T/Tc,YY(:,timepoint,1),T/Tc,YY(:,timepoint,2),T/Tc,YY(:,timepoint,3),...
    T/Tc,YY(:,timepoint,4)/5,T/Tc,YY(:,timepoint,5)),...
    title ('radius=80'), legend('Debris','M1','M2','N','Nt')

WS=zeros(sz1,1);
for j=1:sz1
    for i=1:N
        if YY(j,i,5)<0.9
            WS(j)=WS(j)+1; %wound diameter
        end;
    end;
    WSS(j)=WS(j)*WS(j)/100;
end;
subplot(2,2,2), plot(T/Tc,WS), title('wound radius')
%hold on
%plot(T/Tc,WSS')%plot wound surface
X=zeros(N,1);
for i=1:N X(i)=i; end;
subplot(2,2,1), mesh(X,T/Tc,YY(:,:,5)), xlabel('radius'),ylabel('time'),title('Nt')