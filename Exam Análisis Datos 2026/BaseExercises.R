#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Base de ejercicios para el examen
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

lproblems <- list()

# Problema 1
lproblems[1] <- sprintf("\n\\item (16 pts) Una empresa que fabrica l\\'aminas de aluminio 
para la industria aeron\\'autica necesita asegurar que el espesor de sus l\\'aminas 
cumple con las especificaciones de $2.50 \\pm 0.10$ mm. Se ha implementado una nueva 
maquinaria y se desea monitorear el espesor de las l\\'aminas. Para ello, se han tomado 
muestras de tama\\~no 5 cada hora y se gener\\'o el diagrama que se muestra abajo.
Calcula los l\\'imites de control para el espesor de las láminas.
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.5\\textwidth]{Xbar_R_Paper.png}
\\end{figure}
")

lproblems[2] <- sprintf("\n\\item (16 pts) Una empresa que fabrica l\\'aminas de aluminio 
para la industria aeron\\'autica necesita asegurar que el espesor de sus l\\'aminas 
cumple con las especificaciones de $2.50 \\pm 0.10$ mm. Se ha implementado una nueva 
maquinaria y se desea monitorear el espesor de las l\\'aminas. Para ello, se han 
tomado muestras de tama\\~no 4 cada hora y se gener\\'o el diagrama que se muestra 
abajo. Calcula los l\\'imites de control para el espesor de las láminas.
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.5\\textwidth]{Xbar_S_Paper.png}
\\end{figure}
")

lproblems[3] <- sprintf("\n\\item (16 pts) En una l\\'inea de producci\\'on de ejes para 
motores, el di\\'ametro es una caracter\\'istica crítica para el ensamblaje adecuado. 
Las especificaciones del di\\'ametro son $50.00 \\pm 0.50$ mm. Se mide el di\\'ametro 
de un eje cada 30 minutos. Despu\\'es de 15 horas de mediciones, se obtuvo el 
gr\\'afico IMR con un promedio m\\'ovil de orden 2 que se muestra abajo. 
Calcula los l\\'imites de control para el di\\'ametro del eje.
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.5\\textwidth]{IMR_Paper.png}
\\end{figure}
")

lproblems[4] <- sprintf("\n\\item (14 pts) Una empresa que fabrica l\\'aminas de aluminio 
para la industria aeron\\'autica necesita asegurar que el espesor de sus l\\'aminas 
cumple con las especificaciones de $2.50 \\pm 0.10$ mm. Se ha implementado una nueva 
maquinaria y se desea monitorear el espesor de las l\\'aminas. Para ello, se han 
tomado muestras de tama\\~no 5 cada hora y se gener\\'o el diagrama que se muestra abajo.
Calcula los l\\'imites de control para la {\\bf variabilidad} del 
espesor de las láminas.
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.5\\textwidth]{Xbar_R_Paper.png}
\\end{figure}
")

lproblems[5] <- sprintf("\n\\item (14 pts) Una empresa que fabrica l\\'aminas de aluminio para 
la industria aeron\\'autica necesita asegurar que el espesor de sus l\\'aminas cumple 
con las especificaciones de $2.50 \\pm 0.10$ mm. Se ha implementado una nueva maquinaria 
y se desea monitorear el espesor de las l\\'aminas. Para ello, se han tomado muestras 
de tama\\~no 4 cada hora y se gener\\'o el diagrama que se muestra abajo.
Calcula los l\\'imites de control para la {\\bf variabilidad} del 
espesor de las láminas.
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.5\\textwidth]{Xbar_S_Paper.png}
\\end{figure}
")

p6_x <- round(runif(1, 2.50, 2.60), digits = 2)
lproblems[6] <- sprintf("\n\\item (14 pts) Una empresa que fabrica l\\'aminas de aluminio para 
la industria aeron\\'autica necesita asegurar que el espesor de sus l\\'aminas cumple 
con las especificaciones de $2.50 \\pm 0.10$ mm. Se ha implementado una nueva maquinaria 
y se desea monitorear el espesor de las l\\'aminas. Para ello, se han tomado muestras 
de tama\\~no 4 cada hora y se gener\\'o el diagrama que se muestra abajo.
Calcula la probabilidad de que espesor de las láminas sea mayor %.2f mm.
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.5\\textwidth]{Xbar_S_Paper.png}
\\end{figure}
", p6_x)

p7_x1 <- round(runif(1, 49.6, 50.0), digits = 1)
p7_x2 <- round(runif(1, 50.0, 50.4), digits = 1)
lproblems[7] <- sprintf("\n\\item (14 pts) En una l\\'inea de producci\\'on de ejes para 
motores, el di\\'ametro es una caracter\\'istica crítica para el ensamblaje adecuado. 
Las especificaciones del di\\'ametro son $50.00 \\pm 0.50$ mm. Se mide el di\\'ametro 
de un eje cada 30 minutos. Despu\\'es de 15 horas de mediciones, se obtuvo el 
gr\\'afico IMR con un promedio m\\'ovil de orden 2 que se muestra abajo.
Calcula la probabilidad de que di\\'ametro del eje se encuentre entre %.1f mm y 
%.1f mm.
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.5\\textwidth]{IMR_Paper.png}
\\end{figure}
", p7_x1, p7_x2)

p8_tol <- round(runif(1, 0.08, 0.14), digits = 1)
lproblems[8] <- sprintf("\n\\item (14 pts) Una empresa que fabrica l\\'aminas de aluminio para 
la industria aeron\\'autica necesita asegurar que el espesor de sus l\\'aminas cumple 
con las especificaciones de $2.50 \\pm %.2f$ mm. Se ha implementado una nueva maquinaria 
y se desea monitorear el espesor de las l\\'aminas. Para ello, se han tomado muestras 
de tama\\~no 4 cada hora y se gener\\'o el diagrama que se muestra abajo.
¿Es el proceso es capaz de cumplir con las especificaciones? Argumente.
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.5\\textwidth]{Xbar_S_Paper.png}
\\end{figure}
", p8_tol)

p9_tol <- round(runif(1, 0.40, 0.70), digits = 1)
lproblems[9] <- sprintf("\n\\item (14 pts) En una l\\'inea de producci\\'on de ejes para 
motores, el di\\'ametro es una caracter\\'istica crítica para el ensamblaje adecuado. 
Las especificaciones del di\\'ametro son $50.00 \\pm %.2f$ mm. Se mide el di\\'ametro 
de un eje cada 30 minutos. Despu\\'es de 15 horas de mediciones, se obtuvo el 
gr\\'afico IMR con un promedio m\\'ovil de orden 2 que se muestra abajo.
¿Es el proceso es capaz de cumplir con las especificaciones? Argumente.
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.5\\textwidth]{IMR_Paper.png}
\\end{figure}
", p9_tol)

p10_n <- rdunif(1, 35, 50)
p10_mu2 <- round(runif(1, 2.50, 3.55), digits = 2)
p10_cl <- round(runif(1, 90, 99), digits = 0)
lproblems[10] <- sprintf("\n\\item (14 pts) Una empresa que fabrica tarjetas de circuitos 
impresos desea evaluar si la implementaci\\'on de un nuevo sistema de ensamblaje 
ha reducido el n\\'umero de disconformidades. Se tomaron %d mediciones, antes y 
después del cambio, para analizar los efectos.
\\begin{center}
\\begin{tabular}{|l|c|c|}
\\hline
 & Antes & Despu\\'es \\\\ 
\\hline
Media muestral & 3.60 & %.2f \\\\ 
\\hline
Desviaci\\'on est\\'andar muestral & 1.09 & 1.62 \\\\ 
\\hline
\\end{tabular}
\\end{center}
Calcula un intervalo de confianza de %d\\%% para el número medio 
de disconformidades antes del cambio. Interprete su resultado.
", p10_n, p10_mu2, p10_cl)

p11_n <- rdunif(1, 35, 50)
p11_mu2 <- round(runif(1, 2.50, 3.55), digits = 2)
lproblems[11] <- sprintf("\n\\item (14 pts) Una empresa que fabrica tarjetas de circuitos 
impresos desea evaluar si la implementaci\\'on de un nuevo sistema de ensamblaje 
ha reducido el n\\'umero de disconformidades. Se tomaron %d mediciones, antes y 
después del cambio, para analizar los efectos.
\\begin{center}
\\begin{tabular}{|l|c|c|}
\\hline
 & Antes & Despu\\'es \\\\ 
\\hline
Media muestral & 3.60 & %.2f \\\\ 
\\hline
Desviaci\\'on est\\'andar muestral & 1.09 & 1.62 \\\\ 
\\hline
\\end{tabular}
\\end{center}
¿Existe suficiente evidencia para concluir que el número medio de 
disconformidades ha disminuido despu\\'es del cambio? Argumente.
", p11_n, p11_mu2)

p12_n <- rdunif(1, 13, 17)
p12_x <- rdunif(1, 3, 7)
lproblems[12] <- sprintf("\n\\item (14 pts) Una m\\'aquina de inyecci\\'on de pl\\'astico 
produce piezas de precisi\\'on. Se ha determinado que la probabilidad de que una 
pieza tenga una rebaba fuera de tolerancia es de $0.05$. Durante una auditor\\'a 
de calidad, un inspector toma una muestra aleatoria de $n = %d$ piezas de la 
l\\'inea de producci\\'on. ¿Cu\\'al es la probabilidad de que el inspector 
encuentre exactamente %d piezas defectuosas en esa muestra?", p12_n, p12_x)

p13_p <- round(runif(1, 80, 99), digits = 1)
lproblems[13] <- sprintf("\n\\item (14 pts) Una m\\'aquina envasadora de detergente tiene 
una variabilidad natural con una desviaci\\'on est\\'andar de 8 ml, y la empresa 
debe garantizar que el %.1f\\%% de las botellas contengan al menos 500 ml para cumplir 
con la normativa de calidad. Determine a qu\\'e valor promedio debe 
ajustarse la m\\'aquina para que solo el %.1f\\%% de las botellas queden por debajo 
del contenido m\\'inimo permitido.", p13_p, 100-p13_p)
