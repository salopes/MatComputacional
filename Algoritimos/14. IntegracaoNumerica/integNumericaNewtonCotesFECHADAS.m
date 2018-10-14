function apxIntg = integNumericaNewtonCotesFECHADAS (xl, xu)
 % x1 = Ponto Inicial
 % xu = Ponto Final

 % Dica: xl e xu fazem parte
 % npontos = Definie o Metodo
        % 0 pontos entre os extremos - Trapezio (02 pontos totais - 0 + 2)
        % 1 pontos entre os extremos - Simpson composto (03 pontos totais - 1 + 2)
        % 2 pontos entre os extremos - Simpson 3/8 (04 pontos totais - 2 + 2)
        % 3 pontos entre os extremos - Simpson 2/45 (05 pontos totais - 3 + 2)
  % Ex: integNumericaNewtonCotesFECHADAS(1,3)
  % f(x)= e^(-x^2)

  %objetivo: Encontrar uma aproximação numerica da Itegral usando o método de Simpson Composto

  funcao = input("entre com a funcao: ", "s");
  f = inline (funcao);
  
  % Definindo as opções de processamento
  
  distH=0;
  npontos=0;

  fprintf("\nDados para Processamento: Funcao [%s] - Intervalo [%d,%d]\n", funcao, xl, xu);
  fprintf("--- Resultados Algoritimos Livro ---\n");

  %Trapezio:
    npontos=0;
    distH=abs((xu-xl))/(npontos+1);
    xs = integNumericaPreencheXS(xl, xu, npontos);
    %disp(xs);
    nvet = size(xs)(1);
    yi = f(xs(nvet-1,1)) + f(xs(nvet,1));
 
    apxIntg = ((1/2)*distH)*yi;
    fprintf("Trapezio        : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);
    
  %Simpson:
    npontos=1;
    distH=abs((xu-xl))/(npontos+1);
    xs = integNumericaPreencheXS(xl, xu, npontos);
    %disp(xs);
    nvet = size(xs)(1);
    yi = f(xs(nvet-2,1)) + 4*f(xs(nvet-1,1)) + f(xs(nvet,1));
  
    apxIntg = ((1/3)*distH)*yi;
    fprintf("Simpson         : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);
    
  %Simpson 3/8:
    npontos=2;
    distH=abs((xu-xl))/(npontos+1);
    xs = integNumericaPreencheXS(xl, xu, npontos);
    %disp(xs);
    nvet = size(xs)(1);
    yi = f(xs(nvet-3,1)) + 3*f(xs(nvet-2,1)) + 3*f(xs(nvet-1,1)) + f(xs(nvet,1));
  
    apxIntg = ((3/8)*distH)*yi;
    fprintf("Simpson 3/8     : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);
    
    %Simpson 2/45:
    npontos=3;
    distH=abs((xu-xl))/(npontos+1);
    xs = integNumericaPreencheXS(xl, xu, npontos);
    %disp(xs);
    nvet = size(xs)(1);
    yi = 7*f(xs(nvet-4,1)) + 32*f(xs(nvet-3,1)) + 12*f(xs(nvet-2,1)) + 32*f(xs(nvet-1,1)) + 7*f(xs(nvet,1));
  
    apxIntg = ((2/45)*distH)*yi;
    fprintf("Newton-cotes    : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);
    
    fprintf("\n--- Resultados Algoritimos Proprios ---\n");

    % Meus Metodos
      %Simpson Composto:
      npontos=0;
      apxIntg = integNumericaSimpsonComposto (1, xl, xu, npontos, funcao)
      fprintf("Simpson Composto: [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);
      
      npontos=1;
      apxIntg = integNumericaSimpsonComposto (1, xl, xu, npontos, funcao)
      fprintf("Simpson Composto: [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);

      npontos=2;
      apxIntg = integNumericaSimpsonComposto (1, xl, xu, npontos, funcao)
      fprintf("Simpson Composto: [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);

      npontos=3;
      apxIntg = integNumericaSimpsonComposto (1, xl, xu, npontos, funcao)
      fprintf("Simpson Composto: [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);

      %Simpson 3/8:
      npontos=0;
      apxIntg = integNumericaSimpson38 (1, xl, xu, npontos, funcao)
      fprintf("Simpson 3/8     : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);

      npontos=1;
      apxIntg = integNumericaSimpson38 (1, xl, xu, npontos, funcao)
      fprintf("Simpson 3/8     : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);

      npontos=2;
      apxIntg = integNumericaSimpson38 (1, xl, xu, npontos, funcao)
      fprintf("Simpson 3/8     : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);

      npontos=3;
      apxIntg = integNumericaSimpson38 (1, xl, xu, npontos, funcao)
      fprintf("Simpson 3/8     : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);

      %Newton-Cotes:
      npontos=0;
      apxIntg = integNumericaNewtonCotes (1, xl, xu, npontos, funcao)
      fprintf("Newton-Cotes    : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);

      npontos=1;
      apxIntg = integNumericaNewtonCotes (1, xl, xu, npontos, funcao)
      fprintf("Newton-Cotes    : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);

      npontos=2;
      apxIntg = integNumericaNewtonCotes (1, xl, xu, npontos, funcao)
      fprintf("Newton-Cotes    : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);

      npontos=3;
      apxIntg = integNumericaNewtonCotes (1, xl, xu, npontos, funcao)
      fprintf("Newton-Cotes    : [%d] Ptos -> integral eh : [%d]\n", npontos, apxIntg);
    
endfunction
