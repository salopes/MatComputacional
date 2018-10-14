function raiz = diffNumerica3Pontos (LeM, x1, distH, temDerivada, es)
  % LeM = Informa se o algoritimo vai lê uma arquivo (MATRIX com as dimensões x)
    % 0 = Faz Leitura do arquivo
      % xs = mat(:,1);
    % 1 = Não Faz Leitura do arquivo e os parâmtros são obrigatorios
      % x1 = Ponto 1
      % distH = o H, a distancia entre os pontos
  % temDerivada = Informa se a derivada é conhecida ou não (0 = Não, 1 = sim)
  % es = Tolerancia
  
  % pkg load symbolic
  % syms x
  % ff=(x)^3 - 9*(x) + 3
  % fd=diff(ff)
  % ans fd - Exibe a Funcao derivada
  % fd=diff(ff,2)
  % ans fd - Exibe a Funcao derivada segunda

  
  %ex: diffNumerica3Pontos (1, 0, pi/30, 0, 0.00001) com f(x) = sin(x), 0<= x <= pi/2 e h = pi/30
  %    diffNumerica3Pontos (0, 2.0, 0.1, 0, 0.00001) com f(x) = x*e^x
  %    diffNumerica3Pontos (1, 2.0, 0.1, 1, 0.00001) com f(x) = x*e^x -> f'(x) = x*e^x + e^x -> f''(x)=(x +2)*e^x

  %objetivo: Montar as Matrizes de xs e ys

  funcao = input("entre com a funcao: ", "s");
  f = inline (funcao);

  if temDerivada == 1
    funcaoD = input("entre com a funcao derivada: ", "s");
    fD = inline (funcaoD);
    
    funcaoD2 = input("entre com a funcao derivada2: ", "s");
    fD2 = inline (funcaoD2);

  endif
    
  % Definindo as opções de processamento
  if LeM == 0
     mat = xlsread('DiferenciacaoNumerica.xlsx');
     xs = mat(:,1);
  elseif LeM == 1
     xs(:,1)=[x1, x1+distH, x1+(2*distH)];
  else
    error('Eh necessário entrar com o valor de LeM = 0 ou 1');   
  endif
  
  %Montar a Matriz ddFinitas com as Diferenças Finitas Retroativa, Centrada e Progressiva

  %PontoDD = input("entre com o Ponto a ser calculado: ", "s");
  %pdd = str2num(PontoDD);
  
  id=0;
  dx=0;
  dR=0;
  dC=0;
  dP=0;

  errodR = 0;
  errodC = 0; 
  errodP = 0; 
  erroderiv2 =0;
  ea=1;
  
  while(ea > es)
    for id=1:length(xs)
      iCol=1;
      ddFinitas(id,iCol+0) = id; %num da linha
      ddFinitas(id,iCol+1) = xs(id); %Valor de x
      ddFinitas(id,iCol+2) = f(xs(id)); %Valor de f(x)
      ddFinitas(id,iCol+3) = 0; %Valor de f'(x) se nao for conhecida
      ddFinitas(id,iCol+10) = 0; %f''(x) Calculada se nao for conhecida
      dx= xs(id);
 
      dR = ((-3*f(dx)) + 4*(f(dx+distH)) - f(dx +(2*distH)))/(2*distH);
      dC = (f(dx+distH) - f(dx-distH))/(2*distH);
      dP = (f(dx-(2*distH)) - 4*f(dx-distH) + 3*f(dx))/(2*distH);
      
      deriv2 = (f(dx+distH) + f(dx-distH) - 2*f(dx))/(distH^2);
      
      if temDerivada == 1
        ddFinitas(id,iCol+3) = fD(xs(id)); %Valor de f'(x) conhecida
        ddFinitas(id,iCol+10) = fD2(xs(id)); %f''(x) Calculada

        errodR = abs(fD(xs(id)) - dR);
        errodC = abs(fD(xs(id)) - dC); 
        errodP = abs(fD(xs(id)) - dP); 
        erroderiv2 = abs(fD2(xs(id)) - deriv2); 
      endif
    
      ddFinitas(id,iCol+4) = dR;     %Diferenças Finitas Retroativa
      ddFinitas(id,iCol+5) = errodR; %Erro Diferenças Finitas Retroativa
      ddFinitas(id,iCol+6) = dC;     %Diferenças Finitas Centrada
      ddFinitas(id,iCol+7) = errodC; %Erro Diferenças Finitas Retroativa
      ddFinitas(id,iCol+8) = dP;     %Diferenças Finitas Progressiva
      ddFinitas(id,iCol+9) = errodP; %Erro Diferenças Finitas Retroativa
      ddFinitas(id,iCol+11) = deriv2; %%f''(x) Aproximada
      ddFinitas(id,iCol+12) = erroderiv2; %Erro f''(x) Calculada e f''(x) Aproximada
    
    endfor
  
    if temDerivada == 1
       ea = erroderiv2;
       distH = distH/10;
    else
       ea = es;
    endif
  endwhile
  
  fprintf("It - Val x - Val f(x) - Val f'(x) - Dif Retroativa - Erro DR - Dif Centrada - Erro DC - Dif Progressiva - Erro DP - Val f''(x) Calculada - Val f''(x) Aproximada - Erro f''(x)\n");
  disp(ddFinitas);
  
  raiz = dC;
  
endfunction
