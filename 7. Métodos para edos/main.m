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

% ni puta idea de por que no tira, preguntarle a didac

for i = 1: size(npassos,2)
    [x,Y3]=Euler(f,[a,b],y0,npassos(i)); 
    error = (abs(Y3'-fa(2)));
    figure(3)
    plot(x,log(error),'o-');
    hold on
end
