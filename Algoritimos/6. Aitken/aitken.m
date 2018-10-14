function raiz = aitken (xl, xu, es, ni)
  % xl = p0
  % xu = quntidade de termos da sequencia a ser calculado
  % [xl, xu] = [a, b]
  % es = precisão da raiz (se a raiz encontrada for menor ou igual a precisão, satisfaz a equação)
  % ni = numero de iterações, se não encontrar uma raiz até esse numero sai do algoritimo
  
  % aitken: usada para acelerar a convergencia
  % Steffesen: determina o ponto fixo
  % se f(x) =0, sendo f(x)=x^3 + 4x^2 - 10 => x^3 + 4x^2 - 10 = 0, x^2(x + 4) = 10
  % x^2 = (10/(x+4), assim x = (10/(x+4)^-2 => g(x) = (10/(x+4)^-2
  
  iter =0;
  funcao = input("entre com a funcao G(x) - Steffesen: ", "s");
  f = inline (funcao);

  xr0 = 0;
  xr = 0;
  
  fprintf("\n ----- inicio ----- \n")

  xr = xl;
  ea = abs(f(xr));

  fprintf("P(%d)                      : %d\n", iter, xr);
  fprintf("Qtd Termos a serem gerados : %d\n", xu);
  fprintf("Tolerancia                 : %d\n", es);

  % calcula-se xu+3 termos da sequecnia
  iTam = xu + 3;
  p=xr;
  for i=1:iTam
    seq(i) = p;
    p = f(p);
  endfor
  fprintf("\n ----- Termos da Sequencia ----- \n");
  disp(seq);
    
  % verifica-se as condições de saida do algoritimo e calcular o termos delta Aitken
    ia = 0;
    ib = 0;
    ic = 0;
    
  while (iter < (xu+1))

    pa =0;
    pb =0;
    pc =0;

    % condicao de saida por num de iteracoes
    iter = iter + 1;
    if ((iter > ni) | (iter > (xu+1)))
        break;
    endif
          
    % fprintf("\n ----- iteracao %d ----- \n", iter);

    ia = iter;
    ib = iter+1;
    ic = iter+2;
      
    pa = seq(ia);
    pb = seq(ib);
    pc = seq(ic);

    xri = pa - (((pb - pa)^2)/(pc - (2*pb) + pa));
    ea = abs(f(xri));
   
    j = iter;
    delta(j) = xri;
      
   endwhile

  fprintf("\n ----- Sequencia de Aikten ----- \n");
  disp(delta);
  
  
endfunction
