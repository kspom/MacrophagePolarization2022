The program performs simulations of the model represented in the paper:
Zlobina, Xue, Gomez, 2022.

To begin calculations run:
sol.m

It sets the parameters and runs ODE solver 
[T,Y] = ode15s(@f,[0:0.1:Tmax],A1,options);
This line calls f.m file.
Then is runs some analysis of the solution.

The solution is stored in variables T (time) and Y (all 5 variables in all space cells).
Size of T is number of timesteps. Size of Y is the (size of T)x500. This is because of 5 variables of the model and 100 spatial cells.
Note that calculations and physical time are different, so variable T is not real time, to obtain real time I divide it by Tc. In the same manner: program space is 100 cells, that corresponds to 3 mm length

Analysis/plotting the solution is made by small programs:
nls4.m – makes some plots about the solution
nls6.m – calculates wound healing time T_healing

In fact, you will need nls6.m to get healing time as an output, and if you don’t want to plot everything just comment nls4 line in sol.m

Main equations are in the file f.m.
This function describes ODE equations of the model. Actuator is the variable tetta. If tetta=0 everywhere, the model runs wound healing without actuator.
I used tetta as function of time and space:
tetta(i)=actuator(t,2,2)*ion_concentration(i-X_pump);
The file ion_concentration.m describes space-dependence. Now it is set as gaussian shape, I suggest not to change it. 
The file actuator.m describes time-dependence, and the hope is that you will find more optimal function instead of it.

Added on May 11, 2023:
sol1.m
solves the model with several sets of initial data, plots M1 M2 projections of the phase portrait.
nls10.m
plot of one trajectory in M1 M2 projection. Used in sol1.m.