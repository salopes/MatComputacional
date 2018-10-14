function raiz = pontofixo (xl, xu, es, ni)
  % xl = limite inferior -> a
  % xu = limite superior -> b
  % [xl, xu] = [a, b]
  % es = precisão da raiz (se a raiz encontrada for menor ou igual a precisão, satisfaz a equação)
  % ni = numero de iterações, se não encontrar uma raiz até esse numero sai do algoritimo
  
  % Ponto Fixo: Gera uma sequencia de Soluções Aproximadas (FI(x))
  % Nese caso a aproximacao do valor no algoritimo é dado pela Função FI(x)
  % Sempre usa-se a raiz anterior para calcular a raiz atual x[k+1] = FI (x[k])
  % FI(x) = x + A(x)*f(x), onde A(x) <> 0
  % Teorema: FI(x) = x <=> f(x) = 0 (Provar o se somente se, prova na ida (=>) e na volta(<=))
    % Prova na IDA (=>)
    % FI(x) = x
    % FI(x) = x + A(x)f(x) portanto, FI(X) = FI(x) + A(x)f(x), logo A(x)f(x) = 0
    % Prova na VOLTA (<=)
    % f(x) = 0
    % FI(x) = x + A(x)f(x) portanto, FI(X) = x + A(x)*0, logo FI(x) = x
    
    %FI(x) - Funcao de Iterecao tem que ser informada
  
  
  iter =0;
  funcao = input("entre com a funcao: ", "s");
  f = inline (funcao);
  
  xr = 0 ;  
  
  funcao_iteracao = input("entre com a funcao de iteracao: ", "s");
  f_i = inline (funcao_iteracao);

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
    fprintf("Ponto Fixo         : %d\n", xr);
    fprintf("f(Ponto Fixo)      : %d\n", f(xr));
    fprintf("|f(Ponto Fixo)|    : %d\n", ea);
    fprintf("Tolerancia         : %d\n", es);

    while (ea > es)
      % condicao de saida por num de iteracoes
      iter = iter + 1
      if (iter > ni)
          break;
      endif

      fprintf("\n ----- iteracao %d ----- \n", iter);
    
      xri = f_i(xr);
      ea = abs(f(xri));
    
      fprintf("Limite Inferiro    : %d\n", xl);
      fprintf("f(xl)              : %d\n", f(xl));
      fprintf("Limite Superior    : %d\n", xu);
      fprintf("f(xu)              : %d\n", f(xu));
      fprintf("Ponto Fixo         : %d\n", xri);
      fprintf("f(Ponto Fixo)      : %d\n", f(xri));
      fprintf("|f(Ponto Fixo)|    : %d\n", ea);
      fprintf("Tolerancia         : %d\n", es);
      
      xr = xri;
    endwhile
  endif
  
  raiz = xr;
  fprintf("A RAIZ eh : %d\n", raiz);
  
endfunction
