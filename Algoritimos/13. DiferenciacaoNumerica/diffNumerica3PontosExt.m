function raiz = diffNumerica3PontosExt (funcao, x1, distH)
  % x1 = Ponto 1
  % distH = o H, a distancia entre os pontos
  % Funcao
  
  % pkg load symbolic
  % syms x
  % ff=(x)^3 - 9*(x) + 3
  % fd=diff(ff)
  % ans fd - Exibe a Funcao derivada
  % fd=diff(ff,2)
  % ans fd - Exibe a Funcao derivada segunda

  
  %ex: diffNumerica3PontosExt ("sin(x)", 0, pi/30) com f(x) = sin(x), 0<= x <= pi/2 e h = pi/30
  %    diffNumerica3Pontos ("x*e^x", 2.0, 0.1) com f(x) = x*e^x

  %objetivo: Montar as Matrizes de xs e ys

  f = inline (funcao);
  xs(:,1)=[x1, x1+distH, x1+(2*distH)];
  
  id=0;
  dx=0;
  dR=0;
  dC=0;
  dP=0;

  
  for id=1:length(xs)
      iCol=1;
      ddFinitas(id,iCol+0) = id; %num da linha
      ddFinitas(id,iCol+1) = xs(id); %Valor de x
      ddFinitas(id,iCol+2) = f(xs(id)); %Valor de f(x)
      dx= xs(id);
 
      dR = ((-3*f(dx)) + 4*(f(dx+distH)) - f(dx +(2*distH)))/(2*distH);
      dC = (f(dx+distH) - f(dx-distH))/(2*distH);
      dP = (f(dx-(2*distH)) - 4*f(dx-distH) + 3*f(dx))/(2*distH);
      
      deriv2 = (f(dx+distH) + f(dx-distH) - 2*f(dx))/(distH^2);
      
  
      ddFinitas(id,iCol+3) = dR;     %Diferenças Finitas Retroativa
      ddFinitas(id,iCol+4) = dC;     %Diferenças Finitas Centrada
      ddFinitas(id,iCol+5) = dP;     %Diferenças Finitas Progressiva
      ddFinitas(id,iCol+6) = deriv2; %%f''(x) Aproximada
    
  endfor
  d1 = dC;
  d2 = deriv2;
  raiz = [d1, d2];
  %disp(ddFinitas);
  
endfunction
