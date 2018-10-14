function raiz = secante (xl, xu, es, ni)
  % xl = limite inferior -> a
  % xu = limite superior -> b
  % [xl, xu] = [a, b]
  % es = precisão da raiz (se a raiz encontrada for menor ou igual a precisão, satisfaz a equação)
  % ni = numero de iterações, se não encontrar uma raiz até esse numero sai do algoritimo
  
  % Secante: Elimina a neessidade de calcular a derivada
  % Porém possui uma convergência mais lenta (geralmente)
  % Como o metodo da Secante substitui:
  % Ao invés de pegar a Reta Tangente (derivada)
    % Reta que passa de forma tange ao ponto onde se encontra a raiz da equação
  % Pega-se a resta secante
    % Reta que passa entre os pontos [a,b] e, tem-se a interceção no eixo x (raiz aproximada)
    % f'(x) =~ (f(x(k)) - f(x(k-1))) / (x(k) - x(k-1)) - Secante
    % Com isso, substitui-se a f'(x) na equação de Newton, pela secante
    % x(k+1) = xk - (f(xk)/f'(xk)) => x(x+1) = xk - (f(xk)/((f(x(k)) - f(x(k-1))) / (x(k) - x(k-1)))
    % x(k+1) = xk - ((f(xk)*(xk - xk-1)/(f(xk) - f(xk-1)))
  
  iter =0;
  funcao = input("entre com a funcao: ", "s");
  f = inline (funcao);
  xr0 = 0;
  xr = 0;
  
  fprintf("\n ----- inicio ----- \n")
  fprintf("f(xl)              : %d\n", f(xl));
  fprintf("f(xu)              : %d\n", f(xu));
  
  if (f(xl)*f(xu) > 0)
    printf ("Nao eh possivel continuar, nao existem raizes no intervalo");
    % Baseado no Teorema de Bolzano: Se f(a) * f(b) < 0, então existe pelo menos um ponto c,
    % onde c pertence [a,b], talque f(c)=0. Ou seja, existe pelo menos 01 raiz no intervalo
  else
    % corolário de Bolzano: se f'(x) preservar o sinal em [a, b], então exite um único c
    % pertencente ao intervalo [a, b], tal que f(c) =0
    % se f'(x) = + crescente
    % se f'(x) = - decrescente
    % se f'(x) = 0 ponto crítico
    
    xr = ((xl*f(xu) - xu*f(xl))/(f(xu) - f(xl)));
    ea = abs(f(xr));

    fprintf("\n ----- iteracao %d ----- \n", iter);

    fprintf("Limite Inferiro    : %d\n", xl);
    fprintf("f(xl)              : %d\n", f(xl));
    fprintf("Limite Superior    : %d\n", xu);
    fprintf("f(xu)              : %d\n", f(xu));
    fprintf("Secante            : %d\n", xr);
    fprintf("|f(Secante)|       : %d\n", ea);
    fprintf("Tolerancia         : %d\n", es);

    while (ea > es)
      % atribuição das raizes iniciais para o metodo
      if (iter == 0)
        xr0 = xl;
        xr = xu;
      endif

      % condicao de saida por num de iteracoes
      iter = iter + 1
      if (iter > ni)
          break;
      endif
     
      fprintf("\n ----- iteracao %d ----- \n", iter);

      xri = (xr - ((f(xr)*(xr - xr0))/((f(xr) - f(xr0)))));
      ea = abs(f(xri));
    
      fprintf("Limite Inferiro    : %d\n", xr0);
      fprintf("f(xl)              : %d\n", f(xr0));
      fprintf("Limite Superior    : %d\n", xr);
      fprintf("f(xu)              : %d\n", f(xr));
      fprintf("Secante            : %d\n", xri);
      fprintf("|f(Secante)|       : %d\n", ea);
      fprintf("Tolerancia         : %d\n", es);
      
      xr0 = xr;
      xr = xri;
    endwhile
  endif
  
  raiz = xr;
  fprintf("A RAIZ eh : %d\n", raiz);
  
endfunction
