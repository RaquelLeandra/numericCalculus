% Resoluci� del sistema no lineal platenjat al problema 2
% per mitj� dels m�todes de Newton-Raphson, Newton-Raphson
% utilitzant la derivaci� num�rica i Broyden.
clear;

% Opcions gr�fiques
NicePlot();

tol = 1e-8;
maxIter = 100;

global C;

% Par�metre adimensional C = L*Ohm^2/g
C = 2;

F = @(X)(System(X));
JF = @(X)(JacobF(X));
X = [1;1];

% Utilitzem el/s m�tode/s desitjats descomentant-lo/s
% NewtonRaphson(F, JF, X, tol, maxIter);
% NewtonRaphsonDN(F, X, tol, maxIter);
Broyden(F, X, tol, maxIter);

legend('show');