% Problema 7
A = 5*10; C = 0.65; b = 0.2; g = 9.81;
f = @(t,y) -2/(3*A)*C*b*sqrt(2*g)*y^(3/2); 

% 4 pasos de euler
npassos = 4;
y0 = 0.75;

Y = y0;
h = 120/4;
t = 0;

disp('Euler')
Y = Y + h*f(t,Y) 
t = t+h;
Y = Y + h*f(t,Y) 
t = t+h;
Y = Y + h*f(t,Y) 
t = t+h;
Y = Y + h*f(t,Y) 

% Runge-Kutta de 4o orden

Y = Y+h/6 * (k1 + 2*k2+ 2*k3 + k4);

k1 = f(t,Y);
k2 = f(t + h/2,Y + h/2*k1);


