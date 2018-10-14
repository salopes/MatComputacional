function raiz = coeficientesNewton (p)
  % Arquico contendo a Matriz com as dimensões X e Y
  % p = Ponto onde se pretende obter a interpolação de Neville

  % Termo geral:
  
  % Pi,i(x) = y , 0<= i <= n
  % T(i,j) = ((T(i+1, j-1) - T(i, j-1)) / (x(j+i-1) - x(i)))
  % j = 2: n
  % i = 1: n -j + 1
  
  %objetivo: obter os coeficientes dos polinomio de newton (todos na primeira linha)

  % Lendo o arquivo CSV com os dados de X e Y
  mat = xlsread('DiferencasDivididas.xlsx');
  % xs = vetor com um conjunto de pontos em X
  % ys = vetor com um conjunto de pontos em Y

  fprintf("\n ----- Matriz Entrada ----- \n");
  disp(mat);

  xs = mat(:,1);
  ys = mat(:,2);
  n = length(xs);
  yi=0;
  %Definiçaõ da Matriz (ZERO nxn) que vai receber as diferencas divididas
  TbQ = zeros(n,n);
  Tcoeficientes = zeros(1,n);
  Tcoeficientes2 = zeros(1,n);
  
  %Por definição a 1a coluna é formada pelos valores de F(x)
  TbQ(:,1) = ys(:); % ou TbQ(:,1) = ys;
        
  %calcula a Coluna do Grau ZERO, ou seja os Y
  fprintf("\n ----- Vetor xs ----- \n");
  disp(xs);
  fprintf("\n ----- Vetor ys ----- \n");
  disp(ys);
  fprintf("\n ----- Vetortor de F(x) ----- \n");
  disp(TbQ);

   %começa-se calculando a 2a coluna  
   for j = 2:n
       for i = 1:(n - j + 1)
           FatorA = (TbQ(i+1,j-1));
           FatorB = (TbQ(i,j-1));
           FatorC = (xs(j+i-1)-xs(i));
                     
           TbQ(i,j) = ((FatorA - FatorB)/FatorC);
       endfor    
   endfor  
   fprintf("\n ----- Matriz das Diferencas Dividas ----- \n");
   disp(TbQ); 
  
  fprintf("\n ----- Coeficientes de Newton (b0, b1, b2 ... bn) ----- \n");
  iTam = size(TbQ)(1);
  s=iTam;
  pol='';
  for m= 1:iTam
      Tcoeficientes2(m) = TbQ(1,s);
      if((s-1) > 1)
         pol = strcat(pol, '(', num2str(TbQ(1,s)), '*x^', num2str(s-1), ') + ');
      elseif((s-1) == 1)
         pol = strcat(pol, '(', num2str(TbQ(1,s)), '*x^) + ');
      else
         pol = strcat(pol, '(', num2str(TbQ(1,s)), ')');
      endif
      s = s - 1;
  endfor

  Tcoeficientes = TbQ(1,:);
  disp(Tcoeficientes);

  fprintf("\n ----- Coeficientes de Newton (bn, bn-1, bn-2 ... b0) ----- \n");
  disp(Tcoeficientes2);

  fprintf("O Polinomio das Diferencas Dividas eh : [%s]\n", pol);
  
  %Calculo da Raiz do ponto interpolado
  yi = Tcoeficientes(1);
  nCont = length(Tcoeficientes);
  for w = 2: nCont
      produto = Tcoeficientes(w);
      for k = 1:w-1
          produto = produto*(p-xs(k));
      endfor
      yi = yi + produto;
  endfor
  raiz = yi;
  fprintf("O Valor do Ponto [%d] Interporlado por Newton eh : [%d]\n", p, raiz);
  
endfunction
