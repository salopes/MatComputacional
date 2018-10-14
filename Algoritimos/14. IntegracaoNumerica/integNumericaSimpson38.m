function raiz = integNumericaSimpson38 (LeM, xl, xu, npontos, funcao)
  % LeM = Informa se o algoritimo vai l� uma arquivo (MATRIX com as dimens�es x)
    % 0 = Faz Leitura do arquivo
      % xs = mat(:,1);
    % 1 = N�o Faz Leitura do arquivo e os par�mtros s�o obrigatorios
      % x1 = Ponto Inicial
      % xu = Ponto Final
      % npontos = Quantidade de pontos para o metodo (quantos ponto internos)
        % Simpson Simples tem 01 pontos (x1, x2, x3)
        % Simpson Composto de 03 pontos ou mais (x1, x2, X3, x4, X5, x6, X7, x8, X9)
     % funca a ser utilzida
       % passar "" como arguemnto (vai ser solicitado na linha de comando)
       % passr a funcao com argumento nao ser� perguntado

  %objetivo: Encontrar uma aproxima��o numerica da Itegral usando o m�todo de Simpson Composto

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
  iIntg = 0;
  for iIntg = 2: nvet-1
      yi = yi + 3*f(xs(iIntg,1));
  endfor
  
  raiz = ((3/8)*distH)*yi;
  %fprintf("O Valor aproximada da Integral (Simpson 3/8) com [%d] Pontos para a funcao [%s] eh : [%d], no intervalo de [%d,%d]\n", npontos, funcao, raiz, xl, xu);
 
endfunction
