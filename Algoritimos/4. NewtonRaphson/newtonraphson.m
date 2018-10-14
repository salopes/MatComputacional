function raiz = newtonraphson (xl, xu, es, ni)
  % xl = limite inferior -> a
  % xu = limite superior -> b
  % [xl, xu] = [a, b]
  % es = precis�o da raiz (se a raiz encontrada for menor ou igual a precis�o, satisfaz a equa��o)
  % ni = numero de itera��es, se n�o encontrar uma raiz at� esse numero sai do algoritimo
  
  % Newton: Tem uma alta convergencia
  % A Raiz seguinte � encontrada a partir da raiz anterior * a divis�o da f(x)/f'(x)
  %  x(x+1) = xk * (f(xk)/f'(xk))
  % Por�m � necess�rio saber a derivada da funcao, que pode ser complexo.
  % pkg load symbolic
  % syms x
  % ff=(x)^3 - 9*(x) + 3
  % fd=diff(ff)
  % ans fd - Exibe a Funcao derivada
  % Estou usando a aproxima��o do ponto fixo, para a 1a raiz a ser usada.
  % Condicoes de Convergencia
    % f(x), f'(x) e f''(x) s�o continuas em I
    % f'(x) <> 0
    % x0 est� suficientemente proximo da raiz
      
  iter =0;
  funcao = input("entre com a funcao: ", "s");
  f = inline (funcao);

  %gera a fun��o derivada de f(x)
  funcaoD = input("entre com a funcao derivada: ", "s");
  df = inline (funcaoD);
  xr=0;
  
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
    fprintf("Newton             : %d\n", xr);
    fprintf("|f(Newton)|        : %d\n", ea);
    fprintf("Tolerancia         : %d\n", es);

    while (ea > es)
      % condicao de saida por num de iteracoes
      iter = iter + 1
      if (iter > ni)
          break;
      endif

      fprintf("\n ----- iteracao %d ----- \n", iter);

      xri = xr - (f(xr)/df(xr));
      ea = abs(f(xri));

      fprintf("Limite Inferiro    : %d\n", xl);
      fprintf("f(xl)              : %d\n", f(xl));
      fprintf("Limite Superior    : %d\n", xu);
      fprintf("f(xu)              : %d\n", f(xu));
      fprintf("Newton             : %d\n", xri);
      fprintf("|f(Newton)|        : %d\n", ea);
      fprintf("Tolerancia         : %d\n", es);
      
      xr = xri;
    endwhile
  endif
  
  raiz = xr;
  fprintf("A RAIZ eh : %d\n", raiz);
  
endfunction
