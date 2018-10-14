function xs = integNumericaPreencheXS (xl, xu, npontos)
 % x1 = Ponto Inicial
 % xu = Ponto Final
 % xs = arrei do tipi (n,1) com os interva-los
 
 %objetivo preenche XS com os dados e retona a qtd de pontos em XS
 
 distH = abs((xu-xl))/(npontos+1);
 ixs=1;
 nvet=0;
 valxs=xl;
 nvet = npontos + 2;
 while (ixs <= nvet)
       xs(ixs,1)=valxs; 
       valxs = valxs + distH;
       ixs = ixs+1;
 endwhile

endfunction
