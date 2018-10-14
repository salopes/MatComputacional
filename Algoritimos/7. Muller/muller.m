function raiz = muller (xr, h, es, ni)
  % xx = p0
  % h = valor para trinagular
  % es = precisão da raiz (se a raiz encontrada for menor ou igual a precisão, satisfaz a equação)
  % ni = numero de iterações, se não encontrar uma raiz até esse numero sai do algoritimo
  
  % muller: determina se a raiz converge ou não
  % usa a função quadratica para deerminar as raizes
  
  iter =0;
  funcao = input("entre com a funcao: ", "s");
  f = inline (funcao);

  x2 = xr;
  x1 = xr+h;
  x0 = xr-h;
  
  % inicializa as variáveis
  k=0;
  flag=1;
  T=[0 0 0 0];
   
  while (flag)
    k = k + 1;
    
    % definição dos pontos a, b, c
    h0 = x1 - x0;
    h1 = x2 - x1;
    
    d0 = (f(x1) - f(x0))/h0;
    d1 = (f(x2) - f(x1))/h1;
    
    a = (d1 - d0)/(h1 + h0);
    b = (a*h1) + d1;
    c = f(x2);
    
    %obtendo a raiz
    raizd = sqrt((b*b) - (4*a*c));
    
    %determina maio valor
    if abs(b + raizd) > abs(b - raizd)
       den = b + raizd;
    else
       den = b - raizd;
    endif
    
    %calculo do valor seguinte
    dxr = (-2*c)/den;
    xr = x2 + dxr;
    
    %verifica se continua;
    flag = abs((dxr/xr)) > es | k<c | abs(f(xr) > e);
    
    x0 = x1;
    x1 = x2;
    x2 = xr;
    
    %Guarda os resultados na Matriz
    T(k, :) = [x0 x1 x2 f(xr)];
  endwhile
  
  if k==c
    xr = 'nao converge'
  endif
  
  fprintf("\n ----- Resultados do Processamento [x0, x1, x2 e f(xr)] ----- \n");
  fprintf("\n ----- Quando f(xr) < es, então x2 é a raiz ----- \n");
  disp(T);
  
  raiz = xr;
  fprintf("A RAIZ eh : %d\n", raiz);

    
endfunction
