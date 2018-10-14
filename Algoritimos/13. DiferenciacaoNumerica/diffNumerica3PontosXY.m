function raiz = diffNumerica3PontosXY (nIter)
  % es = Tolerancia

  %objetivo: Montar as Matrizes de xs e ys
  % Efetua a leitura da Matriz e obtem xs e ys
  % como não se sabe a f(x), aproxima-se f'(x) e aproxima-se f''(x)
  % Precisa-se da Taela com x e f(x)
  % precisa-se de pelo menos 03 Entradas

  mat = xlsread('DiferenciacaoNumericaXY.xlsx');
  itamMat = size(mat)(1);
  xs = mat(:,1);
  ys = mat(:,2);

  distH = abs(xs(itamMat) - xs(itamMat-1))
  
  id=0;
  dR=NaN;
  dC=NaN;
  dP=NaN;
  deriv2=NaN;
  iCol=1;

  if itamMat >= 3
    for id=1:itamMat
        
        iCol=1;
        ddFinitas(id,iCol+0) = id; %num da linha
        ddFinitas(id,iCol+1) = xs(id); %Valor de x
        ddFinitas(id,iCol+2) = ys(id); %Valor de f(x)

        if (itamMat - id) >= 2
           dR = ((-3*ys(id)) + 4*(ys(id+1)) - ys(id+2))/(2*distH);
        else
           dR = NaN;
        endif
        
        if ((id > 1) & (id < itamMat))
           dC = (ys(id+1) - ys(id-1))/(2*distH);
           deriv2 = (ys(id+1) + ys(id-1) - 2*ys(id))/(distH^2);  
        else
           dC = NaN;
           deriv2 = NaN;
        endif
        
        if (id > 2)
           dP = (ys(id-2) - 4*ys(id-1) + 3*ys(id))/(2*distH);
        else
           dP = NaN;
        endif
        
        ddFinitas(id,iCol+3) = dR;     %Diferenças Finitas Retroativa
        ddFinitas(id,iCol+4) = dC;     %Diferenças Finitas Centrada
        ddFinitas(id,iCol+5) = dP;     %Diferenças Finitas Progressiva
        ddFinitas(id,iCol+6) = deriv2; %%f''(x) Aproximada
    
    endfor
  
    fprintf("It - Val x - Val f(x) - Dif Retroativa - Dif Centrada - Dif Progressiva - Val f''(x) Aproximada\n");
    disp(ddFinitas);

  else
    fprintf("tabela de Entrada incompleta, precisa de pelo menos 02 Entradas\n");
    disp(mat);
  endif  
  
endfunction
