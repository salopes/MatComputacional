function raiz = nevilleread (p)
  % Arquico contendo a Matriz com as dimensões X e Y
  % p = Ponto onde se pretende obter a interpolação de Neville

  % Termo geral:
  
  % Pi,i(x) = y , 0<= i <= n
  % Pi,j(x) = ((xj-x)*pi,j-1(x) + (x-xi)*pi+1,j(x))/(xj - xi) , 0<= i < j <= n

  % Lendo o arquivo CSV com os dados de X e Y
  mat = xlsread('Nevile.xlsx');
  % xs = vetor com um conjunto de pontos em X
  % ys = vetor com um conjunto de pontos em Y

  fprintf("\n ----- Matriz Entrada ----- \n");
  disp(mat);

  xs = mat(:,1);
  ys = mat(:,2);
  n = length(xs);
  yi=0;
  TbQ(:,1) = ys(:);
      
  %calcula a Coluna do Grau ZERO, ou seja os Y
  fprintf("\n ----- Vetor xs ----- \n");
  disp(xs);
  fprintf("\n ----- Vetor ys ----- \n");
  disp(ys);

  fprintf("\n ----- Vator de F(x) ----- \n");
  disp(TbQ);
  
   for i = 1:n-1
       for j = 1:(n-i)
           FatorA = (p-xs(j))*TbQ(j+1,i);
           FatorB = (xs(j+i)-p)*TbQ(j,i);
           FatorC = (xs(j+i)-xs(j));
                     
           TbQ(j,i+1) = ((FatorA + FatorB)/FatorC);
       endfor    
   endfor  
   fprintf("\n ----- Matriz de Neville ----- \n");
   disp(TbQ); 
   yi = TbQ(1,n);
  
  fprintf("\n -- Resultados de Neville (graus: 1, 1, 2, ...n(-1) -- \n");
  raiz = yi;
  fprintf("O Valor de Neville para o ponto [%d] eh : [%d]\n", p, raiz);
  
endfunction
