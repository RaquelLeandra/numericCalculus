% Objectius:
% - Entendre els conceptes basics dels metodes per a la resolucio numerica
% d'EDOs.
% - Implementar un metode per resoldre EDOs (metode d'Euler)
% - Comprovar experimentalment la convergencia d'un metode
%
% Tasques a fer:
% 1) Executar i mirar aquest script per veure com es pot resoldre el 
%    problema de valor inicial (PVI) amb la funcio de Matlab ode45
% 2) Implementar el metode d'Euler per a la resolucio del mateix PVI
%    Cal crear la funcio Euler amb els arguments d'entrada i sortida
%    especificats a aquest script. 
% 3) Dibuixar una grafica de log10(abs(error)) en funcio de log10(h), on l'error
%    s'evalua com la diferencia entre la solucio analitica i la solucio
%    numerica per x=2. Comprovar si l'ordre de convergencia coincideix amb
%    el teoric.
% Es proposa ara resoldre el PVI y''= -y, y(0)=1, y'(0)=0 per x en (0,T)
% 4) Reduir la EDO de segon ordre a un sistema d'EDOs de 1er ordre
%    Resoldre numericament el PVI amb el metode d'Euler per T=2*pi. Comprovar
%    la converg?ncia.
% 5) Amb h=0.01 resoldre el problema per T=10*pi,50*pi. ?s el m?tode
%    (absolutament) estable? 

clear all; close all;
% Resolucio de la EDO dy/dx = -y/(10x+1) per x en (0,1) 
% amb condicio inicial y(0)=1
f=@(x,y) -y/(10*x+1); a=0; b=1;  y0=1;

%Solucio amb funcions intrinseques de Matlab
[x,Y1]=ode45(f,[a,b],y0);
figure(1), plot(x,Y1,'-*'), title('ode45')

%Solucio amb el metode d'Euler
%h=0.0244;
h = 0.1;
npassos=ceil((b-a)/h); 
[x,Y]=Euler(f,[a,b],y0,npassos);
figure(2), plot(x,Y,'-*'), title('Euler')

% Solucio anal�tica
fa = @(x) (10*x+1).^(-0.1);

npassos = 10*2.^[0:4];
figure(3)

error = []; 
for i = 1: size(npassos,2)
    [x,Y3]=Euler(f,[a,b],y0,npassos(i)); 
    error = [error (abs(Y3(end)-fa(1)))]
end
plot(log(npassos),log(error),'o-');

%% Sistemas de edos

f = @(x,y) [0 1; -1 0]*y; a = 0; b = 2*pi; y0 = [1;0];


% solución con matlab
[x,Y]= ode45(f,[a,b],y0);
figure(4), plot(x,Y,'-*'),title('ode45')

% solución con euler
h = 0.1;
npassos=ceil((b-a)/h); 

[x4,Y4] = Euler(f,[a,b],y0,npassos); 
figure(5), plot(x4,Y4,'-*'),title('Euler')

% 5) Amb h=0.01 resoldre el problema per T=10*pi,50*pi. ?s el m?tode
%    (absolutament) estable? 

h = 0.01;
T = 10*pi;
[x5,Y5] = Euler(f,[a,T],y0,npassos); 
figure(6), plot(x5,Y5,'-*'),title('Euler')

% Rebienta todo -> no es abs. estable