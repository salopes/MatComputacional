function raiz = pviEuler (funcao, xi, yi, distH, npontos, a, b)
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

  %objetivo: Encontrar uma solucao numerica com aproximações da função conhecendo o Valor Inicial)
  % y(i+1) = y(i) + h*f´(xi) - onde f´(x) = f(x,y) - derivada
  % condicao inicial = f(x) = VALOR, ex: f(1) = 3, ou f(0) = -4, ou f(9) = 33
  
  iTam = length(funcao);
  if (iTam == 0)
      funcao = input("entre com a y': ", "s");
  endif
  f = inline (funcao);
  
  if npontos == 0
    npontos = (abs(b-a)/distH)+1;
  endif
  
  %Condicao inicial
  xEuler = xi;
  yEuler = yi;
  ivet = 0;
  
  for iCont=1: npontos
    ivet =  ivet + 1;
    vetEuler(ivet,1) = iCont;  %Garda a Iteracao
    vetEuler(ivet,2) = xEuler; %Garda o valor de X
    vetEuler(ivet,3) = yEuler; %Garda o valor de y

    phi = feval(f,xEuler,yEuler,0);
    yEuler = yEuler + distH*phi;
    xEuler = xEuler + distH;
    
  endfor  

  fprintf("O Valor aproximada eh:\n");
  disp(vetEuler);
  %raiz = size(vetEuler);
 
endfunction
