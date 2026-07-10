function y=actuator(t,t1,dt)
y=0;
if t>t1 && t<t1+dt
   y=1;
end
if t>t1 && t<t1+1
    y=t-t1;
end
if t>t1+dt-1 && t<t1+dt
    y=-t+t1+dt;
end
