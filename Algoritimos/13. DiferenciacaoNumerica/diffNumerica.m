function raiz = diffNumerica (M, xl, xu, p, es, nIter, Deriv)
  % M = Informa se o algoritimo vai l� uma arquivo (MATRIX com as dimens�es X e Y) ou n�o
    % 0 = Faz Leitura do arquivo
      % xs = mat(:,1);
    % 1 = N�o Faz Leitura do arquivo e os par�mtros s�o obrigatorios
      % xl = Ponto Inicial
      % xu = Ponto Final
      %  p = precis�o entre os pontos (ex: 0.1 -> 1.0, 1.1, 1.2, 1.3 ...)
  % es = Tolerancia
  % nIter = Qtd iteracoes
  % Deriv = Qual a Deriva��o desejada
    % 1 = Progressiva
    % 2 = Regressiva
    % 3 = Centralizada
    % 4 = Deriva 2a

  %objetivo: obter os coeficientes dos polinomio de newton (todos na primeira linha)

  funcao = input("entre com a funcao: ", "s");
  f = inline (funcao);
  
  % Definindo as op��es de processamento
  if M == 0
     mat = xlsread('DiferenciacaoNumerica.xlsx');
     xs = mat(:,1);
     nx = length(xs);
     
     for iy=1:nx
       ys(iy) = f(xs(iy));
     endfor  
  elseif M == 1
     n = int16(xl + xu) + 1;
     k = 0;
     in=0;
     i=1;
     while (in < xu)
         in = xl + k;
         xs(i,1) = in;
         ys(i,1) = f(in);
         k = k + p;
         i = i +1;
     endwhile
     
  else
    error('Eh necess�rio entrar com o valor de M = 0 ou 1');   
  endif

  % xs = vetor com um conjunto de pontos em X
  % ys = vetor com um conjunto de pontos em Y
 
  if length(xs)~=length(ys)
     error('Vetores n�o podem ter tamnhos diferentes');
  end;
 
  %fprintf("\n ----- XS ----- \n");
  %disp(xs);
  %fprintf("\n ----- YS ----- \n");
  %disp(ys);
  
  if Deriv == 1
     fprintf("\n ----- Processamento Deriva��o Progressiva ----- \n");
     nd=1;
     valY=0;
     difX=0;
     while nd<length(xs)
        df(nd,1)= nd;
        df(nd,2)= xs(nd);
        df(nd,3)= ys(nd);
        df(nd,4)= (ys(nd+1)-ys(nd))/(xs(nd+1)-xs(nd));
        valY= ys(nd);
        difX = (ys(nd+1)-ys(nd))/(xs(nd+1)-xs(nd));
        df(nd,5)= abs(valY - difX);
        nd=nd+1;
     end

     df(length(xs),1)=length(xs);
     df(length(xs),2)=xs(length(xs));
     df(length(xs),3)=ys(length(ys));
     df(length(xs),4)= ys(length(ys)); %NaN;
     df(length(xs),5)= 0; %NaN;
     fprintf("O Valor da Matriz com a Diferencia��o Progressiva\n");
     fprintf("    Iter    -  Val X   -  Val f(x) - Val f'(x) - EA\n");

  elseif Deriv == 2
     fprintf("\n ----- Processamento Deriva��o Regressiva ----- \n");
     nd=1;
     valY=0;
     difX=0;
     db(1,1)=1;
     db(1,2)=xs(1);
     db(1,3)=ys(1);
     db(1,4)=ys(1); %NaN
     db(1,5)=0; %NaN

     while nd<length(xs)
        nd=nd+1;
        df(nd,1)= nd;
        df(nd,2)= xs(nd);
        df(nd,3)= ys(nd);
        df(nd,4)= (ys(nd)-ys(nd-1))/(xs(nd)-xs(nd-1));
        valY= ys(nd);
        difX = (ys(nd)-ys(nd-1))/(xs(nd)-xs(nd-1));
        df(nd,5)= abs(valY - difX);
     end

     fprintf("O Valor da Matriz com a Diferencia��o Regressiva\n");
     fprintf("    Iter    -  Val X   -  Val f(x) - Val f'(x) - EA\n");

  elseif Deriv == 3
     fprintf("\n ----- Processamento Deriva��o Centralizada ----- \n");
     nd=1;
     valY=0;
     difX=0;
     db(1,1)=1;
     db(1,2)=xs(1);
     db(1,2)=ys(1);
     db(1,2)=ys(1); %NaN
     db(1,2)=0; %NaN

     while nd<length(xs)-1
        nd=nd+1;
        df(nd,1)= nd;
        df(nd,2)= xs(nd);
        df(nd,3)= ys(nd);
        df(nd,4)= (ys(nd+1)-ys(nd-1))/(2*(xs(nd+1)-xs(nd-1)));
        valY= ys(nd);
        difX = (ys(nd+1)-ys(nd))/(xs(nd+1)-xs(nd));
        df(nd,5)= abs(valY - difX);
        
     end

     df(length(xs),1)=length(xs);
     df(length(xs),2)=xs(length(xs));
     df(length(xs),3)=ys(length(ys));
     df(length(xs),4)= ys(length(ys)); %NaN;
     df(length(xs),5)= 0; %NaN;
     fprintf("O Valor da Matriz com a Diferencia��o Centralizada\n");
     fprintf("    Iter    -  Val X   -  Val f(x) - Val f'(x) - EA\n");

  elseif Deriv == 4
     fprintf("\n ----- Processamento Deriva��o Segunda ----- \n");
     fprintf("O Valor da Matriz com a Deriva��o Segunda\n");
  else
     error('Informe a opcao = 1 (progressiva), 2 (regressiva), 3 (centralziada) ou 4 (segunda derivada)');
  endif
  
  disp(df);
  
  
%  raiz = 0;
%  fprintf("O Valor do Ponto Interporlado por Newton eh : [%d]\n", raiz);
  
endfunction
