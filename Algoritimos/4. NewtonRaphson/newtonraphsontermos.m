function raiz = newtonraphsontermos (xl, xu, es, ni)
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
  
  fprintf("\n ----- Calcular os Tersmos de Aikten usando as raizes de Newton ----- \n")

  i=0;
  iTam = size(TermosNewton)(1);
  xr = 0;
  ea=1;
  while (ea > es)
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

    xri = pa - (((pb - pa)^2)/(pc - (2*pb) + pa));
 
    ea = abs(xri - xr);

    % fprintf("iter [%d] - xri [%d] - ea [%d]\n", i, xri, ea);
    
    dAikiten(i,1) = i;
    dAikiten(i,2) = xri;
    dAikiten(i,3) = ea;
    
    xr = xri;

  endwhile

  disp(dAikiten);
  
endfunction
