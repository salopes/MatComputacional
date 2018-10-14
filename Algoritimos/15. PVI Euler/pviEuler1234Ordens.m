function raiz = pviEuler1234Ordens (funcao, xi, yi, distH, npontos, a, b)
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
     % ex:  pviEuler1234Ordens ("cos(2*x) + sin(3*x)", 0, 1, 0.25, 0, 0, 1)
     % y' = cos 2t + sen 3t, 0 = t = 1, y(0) = 1, com h = 0,25

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
  yEuler1 = yi;
  yEuler2 = yi;
  yEuler3 = yi;
  yEuler4 = yi;
  ivet = 0;
  
  for iCont=1: npontos
    ivet = ivet + 1;
    vetEuler(ivet,1) = iCont; %Garda a Iteracao
    vetEuler(ivet,2) = xEuler; %Garda o valor de X
    vetEuler(ivet,3) = yEuler1; %Garda o valor de y 1a Ordem
    vetEuler(ivet,4) = yEuler2; %Garda o valor de y 2a Ordem
    vetEuler(ivet,5) = yEuler3; %Garda o valor de y 3a Ordem
    vetEuler(ivet,6) = yEuler4; %Garda o valor de y 4a Ordem

    phi1 = feval(f,xEuler,yEuler1,0);
    yEuler1 = yEuler1 + distH*phi1;
    
    phi2 = phi1 + ((distH/2)*(feval(f,xEuler,yEuler2,1)));
    yEuler2 = yEuler2 + distH*phi2;

    phi3 = phi2 + ((distH/6)*(feval(f,xEuler,yEuler3,2)));
    yEuler3 = yEuler3 + distH*phi3;

    phi4 = phi3 + ((distH/24)*(feval(f,xEuler,yEuler4,3)));
    yEuler4 = yEuler4 + distH*phi4;
    
    xEuler = xEuler + distH;
    
  endfor  

  fprintf("O Valor aproximada eh:\n");
  fprintf("   IT        Valor x   1a Ord    2a Ord    3a Ord    4a Ord\n");
  disp(vetEuler);
  %raiz = size(vetEuler);
 
endfunction
