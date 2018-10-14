function raiz = integNumericaNewtonCotes (LeM, xl, xu, npontos, funcao)
  % LeM = Informa se o algoritimo vai l� uma arquivo (MATRIX com as dimens�es x)
    % 0 = Faz Leitura do arquivo
      % xs = mat(:,1);
    % 1 = N�o Faz Leitura do arquivo e os par�mtros s�o obrigatorios
      % x1 = Ponto Inicial
      % xu = Ponto Final
      % npontos = Quantidade de pontos para o metodo (quantos ponto internos
 

  %objetivo: Encontrar uma aproxima��o numerica da Itegral usando o m�todo
           % dos trapezios compostos
           % � menos preciso que o metodo de Simpson
           
  iTam = length(funcao);
  if (iTam == 0)
      funcao = input("entre com a funcao: ", "s");
  endif
  f = inline (funcao);
  
  % Definindo as op��es de processamento
  if LeM == 0
     mat = xlsread('IntegracaoNumerica.xlsx');
     xs = mat(:,1);
     nvet = size(mat)(1);
  elseif LeM == 1
     distH = abs((xu-xl))/(npontos+1);
     ixs=1;
     nvet=0;
     valxs=xl;
     nvet = npontos + 2;
     while (ixs <= nvet)
         xs(ixs,1)=valxs; 
         valxs = valxs + distH;
         ixs = ixs+1;
     endwhile
  else
    error('Eh necess�rio entrar com o valor de LeM = 0 ou 1');   
  endif

  %disp(xs);
  
  yi = f(xs(1,1)) + f(xs(nvet,1));
  
  %calculando a integra��o aproximada
  iIntg=0;
  for iIntg = 2: nvet-1
      yi = yi + 2*f(xs(iIntg,1));
  endfor
  
  raiz = (distH/2)*yi;
  %fprintf("O Valor aproximada da Integral (Newton-Cotes) com [%d] Pontos para a funcao [%s] eh : [%d], no intervalo de [%d,%d]\n", npontos, funcao, raiz, xl, xu);
  
endfunction
