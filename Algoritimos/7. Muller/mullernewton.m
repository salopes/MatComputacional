function raiz = mullernewton (xl, xu, es, ni)
  % xl = limite inferior -> a
  % xu = limite superior -> b
  % [xl, xu] = [a, b]
  % es = precisão da raiz (se a raiz encontrada for menor ou igual a precisão, satisfaz a equação)
  % ni = numero de iterações, se não encontrar uma raiz até esse numero sai do algoritimo
  
     
  iter =0;
  funcao = input("entre com a funcao: ", "s");
  f = inline (funcao);

  %gera a função derivada de f(x)
  funcaoD = input("entre com a funcao derivada: ", "s");
  df = inline (funcaoD);
  xr=0;
  
  xr = xl;
  ea = abs(f(xr));

  fprintf("\n ----- Calcular a Raiz aproximanda de Newton ----- \n")
  fprintf("P(%d)              : %d\n", iter, xl);
  fprintf("Erro Absoluto      : %d\n", ea);
  fprintf("Tolerancia         : %d\n", es);

  TermosNewton(1,1) =  iter;
  TermosNewton(1,2) =  xl;
  TermosNewton(1,3) =  ea;

    while (ea > es)
      % condicao de saida por num de iteracoes
      iter = iter + 1;
      j = iter + 1;
      if (iter > ni)
          break;
      endif

      % fprintf("\n ----- iteracao %d ----- \n", iter);

      xri = xr - (f(xr)/df(xr));
      ea = abs(xri - xr);

      % fprintf("P(%d)              : %d\n", iter, xri);
      % fprintf("Erro Absoluto      : %d\n", ea);
      % fprintf("Tolerancia         : %d\n", es);
      
      TermosNewton(j,1) =  iter;
      TermosNewton(j,2) =  xri;
      TermosNewton(j,3) =  ea;
      
      xr = xri;
    endwhile
  
  disp(TermosNewton);
  
  fprintf("\n ----- Calcular os Tersmos de Muller usando as raizes de Newton ----- \n")

  i=0;
  iTam = size(TermosNewton)(1);
  xr = 0; 
  ea=1;
  flag=1;
  while (flag)
    i=i+1;

    if ((i > ni) | (i > iTam))
       break;
    endif
    
    pa =0;
    pb =0;
    pc =0;

    ia = i;
    ib = i+1;
    ic = i+2;
      
    pa = TermosNewton(ia,2);
    pb = TermosNewton(ib,2);
    pc = TermosNewton(ic,2);

    % definição dos pontos a, b, c
    h0 = pb - pa;
    h1 = pc - pb;
    
    d0 = (f(pb) - f(pa))/h0;
    d1 = (f(pc) - f(pb))/h1;
    
    a = (d1 - d0)/(h1 + h0);
    b = (a*h1) + d1;
    c = f(pc);
 
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
    xr = pc + dxr;
    
    %verifica se continua;
    flag = abs((dxr/xr)) > es | i<c | abs(f(xr) > e);
    
    pa = pb;
    pb = pc;
    pc = xr;
    
    %Guarda os resultados na Matriz
     T(i, :) = [pa pb pc f(xr)];
    
  endwhile
  if i==c
    xr = 'nao converge'
  endif
 
  disp(T);

  raiz = xr;
  fprintf("A RAIZ eh : %d\n", raiz);
  
  
endfunction
