function grafico = geragrafico (p)
  xneg=input("Entrar valor negativo de X: ", "s");
  xpos=input("Entrar valor positivo de X: ", "s");
  escala=input("Entrar com a escala de valores X: ", "s");
  x=xneg:escala:xpos;
  k= ((str2num(xpos)- str2num(xneg))/str2num(escala))+1;
    
  funcao = input("entre com a funcao: ", "s");
  f = inline (funcao);

  z = (str2num(xneg) - str2num(escala));
  for i=1:k
      v = z + (i*str2num(escala));
      G(i,1) = v;
      G(i,2) = f(v);
  endfor

  fprintf("\n -- Matriz Entrada (x e f(x)) -- \n");
  disp(G);
  figure (1)
  plot (G(:,1),G(:,2));
  title('Titulo');
  xlabel('Eixo x');
  ylabel ('Eixo Y');

  grid on;
  grafico=1;
  
 endfunction