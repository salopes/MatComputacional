function raiz = falsaposicao (xl, xu, es, ni)
  % xl = limite inferior -> a
  % xu = limite superior -> b
  % [xl, xu] = [a, b]
  % es = precis�o da raiz (se a raiz encontrada for menor ou igual a precis�o, satisfaz a equa��o)
  % ni = numero de itera��es, se n�o encontrar uma raiz at� esse numero sai do algoritimo
  
  % Falsa Posi��o: usa uma media ponderada entre f(a) e f(b), xk = (a*f(b) - b*f(a))/(f(b) - f(a))
  % Vantagem, ao inves de usar o ponto m�dio, o metodo usa uma raiz aproximada, mais do que o ponto m�dio
  
  iter =0;
  funcao = input("entre com a funcao: ", "s");
  f = inline (funcao);
  
  xr = 0 ;
  
  fprintf("\n ----- inicio ----- \n")
  fprintf("f(xl)              : %d\n", f(xl));
  fprintf("f(xu)              : %d\n", f(xu));
  
  if (f(xl)*f(xu) > 0)
    printf ("Nao eh possivel continuar, nao existem raizes no intervalo");
    % Baseado no Teorema de Bolzano: Se f(a) * f(b) < 0, ent�o existe pelo menos um ponto c,
    % onde c pertence [a,b], talque f(c)=0. Ou seja, existe pelo menos 01 raiz no intervalo
  else
    % corol�rio de Bolzano: se f'(x) preservar o sinal em [a, b], ent�o exite um �nico c
    % pertencente ao intervalo [a, b], tal que f(c) =0
    % se f'(x) = + crescente
    % se f'(x) = - decrescente
    % se f'(x) = 0 ponto cr�tico
    
    xr = ((xl*f(xu) - xu*f(xl))/(f(xu) - f(xl)));
    ea = abs(f(xr));

    fprintf("\n ----- iteracao %d ----- \n", iter);

    fprintf("Limite Inferiro    : %d\n", xl);
    fprintf("f(xl)              : %d\n", f(xl));
    fprintf("Limite Superior    : %d\n", xu);
    fprintf("f(xu)              : %d\n", f(xu));
    fprintf("Falsa Posicao      : %d\n", xr);
    fprintf("f(Falsa Posicao)   : %d\n", f(xr));
    fprintf("|f(Falsa Posicao)| : %d\n", ea);
    fprintf("Tolerancia         : %d\n", es);

    while (ea > es)
      % condicao de saida por num de iteracoes
      iter = iter + 1
      if (iter > ni)
          break;
      endif

      fprintf("\n ----- iteracao %d ----- \n", iter);
      if (f(xl)*f(xr) < 0)
          xu = xr;
      elseif (f(xu)*f(xr) < 0)
          xl = xr;
      else
          break;
      endif
    
      xr = ((xl*f(xu) - xu*f(xl))/(f(xu) - f(xl)));
      ea = abs(f(xr));

      fprintf("Limite Inferiro    : %d\n", xl);
      fprintf("f(xl)              : %d\n", f(xl));
      fprintf("Limite Superior    : %d\n", xu);
      fprintf("f(xu)              : %d\n", f(xu));
      fprintf("Falsa Posicao      : %d\n", xr);
      fprintf("f(Falsa Posicao)   : %d\n", f(xr));
      fprintf("|f(Falsa Posicao)| : %d\n", ea);
      fprintf("Tolerancia         : %d\n", es);
    endwhile
  endif
  
  raiz = xr;
  fprintf("A RAIZ eh : %d\n", raiz);
  
endfunction
