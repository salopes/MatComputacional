function raiz = lagrange (xs, ys, p)
  % xs = vetor com um conjunto de pontos em X
  % ys = vetor com um conjunto de pontos em Y
  % p = Ponto onde se pretende obter a interpolação de Lagrange

  % Termo geral:
  
  % Pn(x) = SOMATORIO (de i=0 a n) de Yi x PRODUTORIO (de j=0 a n, onde j <> i) de (x - x(j))/(x(i) - x(j))
  
  n = length(xs);
  %verifica se as dimensões de x e y são iguais
  if (length(ys) ~= n)
      fprintf("ERRO: as dimensões dos vetores X e Y tem que ser iguais\n");
  else
      %calcula os os fatores de Lagrange
      yi=0;
      pol = '0';
      for i=1:n
          % calculo do produtorio de (x-x(j))/(x(i) - x(j)), onde x <> j
          produtorio = ys(i);
          parte_pol = num2str(ys(i));
          for j=1:n
              if (i ~= j)
                produtorio = produtorio * ((p - xs(j))/(xs(i) - xs(j)));
                parte_pol = strcat(parte_pol, '*((x - ',num2str(xs(j)),')/(',num2str(xs(i)),' - ',num2str(xs(j)),'))' );
              endif
          endfor
          % Faz o Somatorio dos Produtorios
          yi = yi + produtorio;
          pol = strcat(pol, '+', parte_pol);
      endfor
  endif    
  
  fprintf("\n ----- Resultados do Lagrange ----- \n");
  raiz = yi;
  fprintf("O Valor de Lagrange para o ponto [%d] eh : [%d]\n", p, raiz);
  fprintf("O Polinomio de Lagrange para o ponto [%d] eh : [%s]\n", p, pol);

  %syms pol;
  %pol=simplify(pol);
  %pol=inline(char(pol));
  
  %disp(pol);
  
  
endfunction
