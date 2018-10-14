%%%%%%%%%%%%%%%%%%%%F2NUM - Calculo Numerico%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------- ZEROS DE FUNCOES REAIS ------------------------------
%                       Método do Newton-Raphson                          %
% Profa. Dra. Mariana PMA Baroni

% Objetivo: Garantir e acelerar a convergência do MPF fazendo |P'(x)|=0

% A funcao foi definida usando syms
% f(x) = x*x + log(x)
% funcao de iteracao = e^(-x^2)

clear all
clc

% ---Parametros
epsilon1 = 0.001; %tolerancia
epsilon2 = epsilon1;

%intervalo inicial
x0=0.5; %x0
xb=x0; %raiz aproximada

%Funcao algebrica
syms x; 
ff=x^3 - 9*x + 3; %funcao
fd=diff(ff); %derivada

k=0; %contador de iteracoes
kf=1000;%n° max de iteracoes

tic
for i=1:kf %kf tb e criterio de parada
    if (abs(subs(ff,x,x0))<epsilon1)
        xb=x0;
        break
    else
        x1=x0-(subs(ff,x,x0)./subs(fd,x,x0));
        if (abs(subs(ff,x,x1))<epsilon1 & abs(x1-x0)<epsilon2)
            xb=x1
            break
        else
            x0=x1;
            k=k+1;
        end
    end
end    
toc
sprintf('x = %f',xb) %mostre x
sprintf('f(x) = %f',subs(ff,x,xb)) %mostre y
sprintf('|x1-x0| = %f',abs(x1-x0)) %mostre o intervalo
sprintf('Número de iteracoes ate atingir o resultado: %d',k) %mostre iteracoes