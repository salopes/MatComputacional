function raiz = integNumericaSimpsonCompostoXY ()

  %objetivo: Encontrar uma aproximação numerica da Itegral usando o método de Simpson Composto
  %          usando as entradas x e f(x) do Arquivo
  %          não conheco a f(x)dx, só os valores
  
  
  % Definindo as opções de processamento
   mat = xlsread('IntegracaoNumericaXY.xlsx');
   xs = mat(:,1);
   ys = mat(:,2);
   nvet = size(mat)(1);
   
   distH = abs(xs(nvet) - xs(nvet-1));

  yi = ys(1) + ys(nvet);
  
  %calculando a integração aproximada
  iIntg = 0;
  for iIntg = 2: nvet-1
      if  mod(iIntg,2) == 0
          yi = yi + 4*ys(iIntg);
      else
          yi = yi + 2*ys(iIntg);
      endif
  endfor
  
  raiz = (distH/3)*yi;
  fprintf("O Valor aproximada da Integral (Simpson Composta) eh : [%d]\n", raiz);
 
endfunction
