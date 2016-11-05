clear all;
close all;
%% bisection
fprintf('bisection');
f = @(x)f1(x);
x = -1;
y =  0;
[solBisection, resBisection] = bisection(f, x, y, 800,0.0001);
%biseccion tiene convergencia lineal
plot(log(resBisection));
%title('Bisection')
hold on

%% newton
fprintf('Newton');
ini = -1;
df = @(x)df1(x);
[ solNewton, resNewton ] = newton( ini, 800, 0.0001,f,df);
%Newton tiene convergencia cuadrática
plot(log(resNewton));

%% whittaker

fprintf('Whittaker');
initialPoint = -1;
numberIterations = 800;
tol = 0.0001;
m = df(initialPoint);
[ result, residue] = whittakerRaquel( initialPoint, numberIterations, tol, f, m);
%tiene convergencia lineal
plot(log(residue));

%% Secante

fprintf('Secante');
ini1 = -1;
ini2 = 2;

[ solSecante, resSecante ] = secante( f, ini1, ini2, 800, 0.0001);
%Secante tiene convergencia super cuadrática (exponente entre 1 y 20)
% un poco mejor que lineal, sin calcular derivadas

plot(log(resSecante));


legend('bis','newt','wit','sec');