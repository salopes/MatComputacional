function raiz = horner (gpol, X0, es, ni)
	% gpol = Grau Grau do Polinomio(maior exponente)
  % es = Tolerancia
  % ni = numero de iteracoes
  % X0 = Ponto onde se quer a Raiz
    ea=1;
    n=gpol+1;
	  vectCoeficientes=linspace(0,0,n);
	  vectMultipliTemporales= linspace(0,0,n);
	  vectMultipliTemporales2= linspace(0,0,n-1);
	  vectSumasTemporales=linspace(0,0,n);
	  vectSumasTemporales2=linspace(0,0,n-1);
	  valoresX=linspace(0,0,n);
	  for i= 1: n
		  fprintf('Informe o coeficionete %d',i);
		  vectCoeficientes(i)=input(': ');
	  end
    Xo=X0;
	  XoTemp=Xo;
	  itera=ni;
    j=0;
    
    while (ea > es)
  	  %for j=1: itera
	    j = j +1;
      %INICIA ITERACION 
		    %PRIMEIRA PARTE DA DIVISAO SINTETICA
		    for i= 1: n
			    if (i==1)
			  	  vectSumasTemporales(i)=vectCoeficientes(i);
			  	  vectMultipliTemporales(i)=0;
			    end
			    if (i>1)
				    vectMultipliTemporales(i)=vectSumasTemporales(i-1)*Xo;
				    vectSumasTemporales(i)=vectCoeficientes(i)+(vectMultipliTemporales(i));
			    end
		    end

		    %SEGUNDA PARTE DA DIVISAO SINTETICA
		    for i= 1: n-1
			    if (i==1)
				    vectSumasTemporales2(i)=vectSumasTemporales(i);
				    vectMultipliTemporales2(i)=0;
			    end
			    if (i>1)
				    vectMultipliTemporales2(i)=vectSumasTemporales2(i-1)*Xo;
				    vectSumasTemporales2(i)=vectSumasTemporales(i)+(vectMultipliTemporales2(i));
			    end
		    end
		    XoTemp=Xo; %valor de X0 antes de finalizar a iteracao
		    Xo=Xo-(vectSumasTemporales(n)/vectSumasTemporales2(n-1)); %CALCULAR Xo para a siguiente iteracao
		    vectSumasTemporales;
		    vectSumasTemporales2;
		    valoresX(j)= Xo; %vector que almacena los valores de X sub n
		    format long;
		    fprintf('*/*/*/*/*/ITERACION NO %d /*/*/*/*/*\n', j)
		    fprintf('%.13f \t',vectCoeficientes)
		    fprintf('\n')
		    fprintf('%.13f \t',vectMultipliTemporales)
		    fprintf('\n _________________________________________________________________________________________ \n')
		    fprintf('%.13f \t',vectSumasTemporales)
		    fprintf('\n')
		    fprintf('%.13f \t',vectMultipliTemporales2)
		    fprintf('\n ________________________________________________________________\n')
		    fprintf('%.13f \t',vectSumasTemporales2)
		    fprintf('\n')
		    fprintf('\n X(%d)=%.13f -(%.13f/ %.13f) =  %.13f \t',j,XoTemp, vectSumasTemporales(n), vectSumasTemporales2(n-1), Xo)
		    fprintf('\n')
		    operacion=((Xo - XoTemp)/Xo)*100;
		    fprintf('\n |Et|= ((%.13f -  %.13f) / %.13f )*100 \n',Xo,XoTemp,Xo)
		    fprintf('\n |Et|= %.13f \n',operacion)
		    fprintf('\n \n ')
        
        ea = abs(operacion);
	    endwhile
	    raiz = Xo
      fprintf("Para o ponto X0 [%d], a RAIZ eh : [%d]\n", raiz, X0);
      valoresX;
  endfunction