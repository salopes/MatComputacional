function raiz = pviRungeKuttaCompare (funcao, xi, yi, distH, npontos, a, b, funcaoOriginal)
     % funcao deriva a ser utilzida
       % passar "" como arguemnto (vai ser solicitado na linha de comando)
       % passr a funcao com argumento nao será perguntado
     % xi - Ponto em X do valor inicial
     % yl - Condição inicial 
     % distH - distancia entre os pontos
     % npontos - quntidade de pontos
     % a - limite inferior
     % b - limite superior
     % condição a <= x <= b
     % grau = 2: [k1 e K2], 3: [k1, K2 e K3], 4: [k1, K2, K3 e K4], 
     % ex:  pviRungeKutta ("-x + y + 2", 0, 2, 0.1, 0, 0, 2, 4)

  %objetivo: Encontrar uma solucao numerica com aproximações da função conhecendo o Valor Inicial)
  % y(i+1) = y(i) + h*f´(xi) - onde f´(x) = f(x,y) - derivada
  % condicao inicial = f(x) = VALOR, ex: f(1) = 3, ou f(0) = -4, ou f(9) = 33
  

  iTam = length(funcao);
  if (iTam == 0)
      funcao = input("entre com a y'(x): ", "s");
  endif
  f = inline (funcao);

  iTamOrig = length(funcaoOriginal);
  if (iTamOrig == 0)
      funcaoOriginal = input("entre com a y(x): ", "s");
  endif
  fOrgi = inline (funcaoOriginal);
  
  if npontos == 0
    npontos = (abs(b-a)/distH)+1;
  endif

  %Condicao inicial
  xRK       = xi;
  yRK2      = yi;
  yRK3      = yi;
  yRK4      = yi;
  ivet      = 0;
  yOriginal = 0;
  errorRK2  = 0;
  errorRK4  = 0;
 
  for iCont=1: npontos
    ivet = ivet + 1;
    yOriginal = fOrgi(xRK);
    
    vetRK(ivet,1) = ivet; %Garda a Iteracao
    vetRK(ivet,2) = xRK; %Garda o valor de X
    vetRK(ivet,3) = yRK2; %Garda o valor de y 2a Ordem
    vetRK(ivet,4) = yRK4; %Garda o valor de y 2a Ordem
    vetRK(ivet,5) = yOriginal; %Garda o valor de y 2a Ordem

    errorRK2 = abs(yOriginal - yRK2);
    errorRK4 = abs(yOriginal - yRK4);
    vetRK(ivet,6) = errorRK2; %Erro yOriginal - errorRK2
    vetRK(ivet,7) = errorRK4; %Erro yOriginal - errorRK4

    % Calculando com K1 e K2
    K1 = distH*feval(f,xRK,yRK2);
    K2 = distH*feval(f,(xRK+(distH/2)),(yRK4+(K1/2)));
    yRK2 = yRK2 + (1/2)*[K1 + K2];

    % Calculando com K1, K2, K3 e K4
    K1 = distH*feval(f,xRK,yRK4);
    K2 = distH*feval(f,(xRK+(distH/2)),(yRK4+(K1/2)));
    K3 = distH*feval(f,(xRK+(distH/2)),(yRK4+(K2/2)));
    K4 = distH*feval(f,(xRK+distH),(yRK4+K3));
    yRK4 = yRK4 + (1/6)*[K1 + 2*K2 + 2*K3 + K4];

    xRK = xRK + distH;
    
  endfor  

  fprintf("O Valor aproximada eh:\n");
  fprintf("   IT        xRK       yRK2      yRK4      y(x)      erroRK2   erroRK4\n");
  disp(vetRK);
  %raiz = size(vetEuler);
 
endfunction
