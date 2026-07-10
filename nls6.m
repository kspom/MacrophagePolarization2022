WS=zeros(sz1,1);
for j=1:sz1
    for i=1:N
        if YY(j,i,5)<0.95
            WS(j)=WS(j)+1; %wound diameter
        end;
    end;
end;
fl_closure=0;
t_closure=0;
for i=1:sz1
    if WS(i)==0 && fl_closure==0
        t_closure=T(i);
        fl_closure=1;
    end;
end;
        
T_healing=t_closure/Tc;