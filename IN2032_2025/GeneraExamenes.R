# Genera random exams for all students in the class

library(openxlsx)
library(dplyr)

rdunif <- function(n, min, max) { round(runif(n, min, max), digits = 0)}

# Lee lista de alumnos
alumnos <- read.xlsx("IN2032_2025/ListaClase.xlsx")
filename <- "IN2032_2025/Examenes.tex"
set.seed(101)

###############################################################################
# Include basic format
fopen <- 
"\\documentclass[10pt]{report}
\\usepackage{graphicx}
\\parindent=0in
\\textwidth=6.7in 
\\textheight=9in
\\setlength{\\oddsidemargin}{-0.10in}
\\setlength{\\evensidemargin}{-0.10in}
\\setlength{\\topmargin}{-0.55in}
\\setlength{\\unitlength}{0.5in}
\\pagestyle{empty}

\\begin{document}"

ftitle <- "
\\begin{center}
{\\large Instituto Tecnol\\'{o}gico y de Estudios Superiores de Monterrey \\\\
An\\'alisis Estad\\'stico de Datos } \\\\
Examen Argumentativo (Papel)
\\end{center}
"

###########################################################################
# CONSTRUCT EXAM FOR EACH STUDENT IN ONE FILE
#############################################################################

cat(fopen, file = filename, sep = "\n", append = FALSE)
NSTUDENT <- nrow(alumnos)
for (i in 1:NSTUDENT) {
  
  cat(ftitle, file = filename, sep = "\n", append = TRUE)
  cat("Nombre: \\underline{\\hspace*{.2in}}", alumnos$Nombre[i],
      "\\underline{\\hspace*{.2in}} \\quad Matr\\'icula:\\underline{\\hspace*{.2in}}",
      alumnos$Matricula[i], "\\underline{\\hspace*{.2in}} \\\\",
      file = filename, sep = "\n", append = TRUE)
  
  cat("
{\\bf Instrucciones:} Lee con cuidado cada problema y escribe la soluci\\'on
en tu hoja de respuesta. Incluye tu procedimiento que muestre c\\'omo obtienes tu respuesta.  Respeta el c\\'odigo de \\'etica del curso y del Tecnol\\'ogico de Monterrey y responde los ejercicios de manera individual sin ayuda externa o no autorizada.

\\begin{enumerate}", file = filename, sep = "\n", append = TRUE)
  
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Ejercicios

lproblems <- list()

# Problema 1
lproblems[1] <- sprintf("\n\\item Una empresa que fabrica l\\'aminas de aluminio para la industria aeron\\'autica necesita asegurar que el espesor de sus l\\'aminas cumple con las especificaciones de $2.5 \\pm 0.1$ mm. Se ha implementado una nueva maquinaria y se desea monitorear el espesor de las l\\'aminas. Para ello, se han tomado muestras de tama\\~no 5 cada hora y se gener\\'o el diagrama que se muestra abajo.
\\begin{enumerate}
\\item (5 pts) Calcula la media y variabilidad del proceso (dentro de grupos).
\\item (10 pts) Calcula los l\\'imites de control para el espesor de las láminas.
\\item (10 pts) Calcula el porcentaje de l\\'aminas que no cumplen con las especificaciones. Use los valores del inciso a) para calcular este porcentaje.
\\end{enumerate}
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.75\\textwidth]{Xbar_R_Paper.png}
\\end{figure}
")

lproblems[2] <- sprintf("\n\\item Una empresa que fabrica l\\'aminas de aluminio para la industria aeron\\'autica necesita asegurar que el espesor de sus l\\'aminas cumple con las especificaciones de $2.5 \\pm 0.1$ mm. Se ha implementado una nueva maquinaria y se desea monitorear el espesor de las l\\'aminas. Para ello, se han tomado muestras de tama\\~no 5 cada hora y se gener\\'o el diagrama que se muestra abajo.
\\begin{enumerate}
\\item (5 pts) Calcula la media y variabilidad del proceso (dentro de grupos).
\\item (10 pts) Calcula los l\\'imites de control para la {\\bf variabilidad} del espesor de las láminas.
\\item (10 pts) Calcula el porcentaje de l\\'aminas que tienen un espesor menor a 2.4 mm. Use los valores del inciso a) para calcular este porcentaje.
\\end{enumerate}
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.75\\textwidth]{Xbar_R_Paper.png}
\\end{figure}
")

lproblems[3] <- sprintf("\n\\item Una empresa que fabrica l\\'aminas de aluminio para la industria aeron\\'autica necesita asegurar que el espesor de sus l\\'aminas cumple con las especificaciones de $2.5 \\pm 0.1$ mm. Se ha implementado una nueva maquinaria y se desea monitorear el espesor de las l\\'aminas. Para ello, se han tomado muestras de tama\\~no 4 cada hora y se gener\\'o el diagrama que se muestra abajo.
\\begin{enumerate}
\\item (5 pts) Calcula la media y variabilidad del proceso (dentro de grupos).
\\item (10 pts) Calcula los l\\'imites de control para el espesor de las láminas.
\\item (10 pts) Calcula el porcentaje de l\\'aminas que cumplen con las especificaciones. Use los valores del inciso a) para calcular este porcentaje.
\\end{enumerate}
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.75\\textwidth]{Xbar_S_Paper.png}
\\end{figure}
")

lproblems[4] <- sprintf("\n\\item Una empresa que fabrica l\\'aminas de aluminio para la industria aeron\\'autica necesita asegurar que el espesor de sus l\\'aminas cumple con las especificaciones de $2.5 \\pm 0.1$ mm. Se ha implementado una nueva maquinaria y se desea monitorear el espesor de las l\\'aminas. Para ello, se han tomado muestras de tama\\~no 4 cada hora y se gener\\'o el diagrama que se muestra abajo.
\\begin{enumerate}
\\item (5 pts) Calcula la media y variabilidad del proceso (dentro de grupos).
\\item (10 pts) Calcula los l\\'imites de control para la {\\bf variabilidad} del espesor de las láminas.
\\item (10 pts) Calcula el porcentaje de l\\'aminas que tienen un espesor mayor a 2.6 mm. Use los valores del inciso a) para calcular este porcentaje.
\\end{enumerate}
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.75\\textwidth]{Xbar_S_Paper.png}
\\end{figure}
")

lproblems[5] <- sprintf("\n\\item En una l\\'inea de producci\\'on de ejes para motores, el di\\'ametro es una caracter\\'istica crítica para el ensamblaje adecuado. Las especificaciones del di\\'ametro son $50 \\pm 0.5$ mm. Se mide el di\\'ametro de un eje cada 30 minutos. Despu\\'es de 15 horas de mediciones, se obtuvo el gr\\'afico IMR con un promedio m\\'ovil de orden 2 que se muestra abajo.
\\begin{enumerate}
\\item (5 pts) Calcula la media y variabilidad del proceso (dentro de grupos).
\\item (10 pts) Calcula los l\\'imites de control para el di\\'ametro del eje.
\\item (10 pts) Calcula el porcentaje de ejes que no cumplen con las especificaciones. Use los valores del inciso a) para calcular este porcentaje.
\\end{enumerate}
\\begin{figure}[h!]
\\centering
\\includegraphics[width=0.75\\textwidth]{IMR_Paper.png}
\\end{figure}
")

lproblems[6] <- sprintf("\n\\item Una empresa que fabrica tarjetas de circuitos impresos desea evaluar si la implementaci\\'on de un nuevo sistema de ensamblaje ha reducido el n\\'umero de disconformidades. Se tomaron 50 mediciones, antes y después del cambio, para analizar los efectos.
\\begin{center}
\\begin{tabular}{|l|c|c|}
\\hline
 & Antes & Después \\\\ 
\\hline
Media muestral & 3.60 & 2.37 \\\\ 
\\hline
Desviaci\'on est\'andar muestral & 1.09 & 1.62 \\\\ 
\\hline
\\end{tabular}
\\end{center}
\\begin{enumerate}
\\item (15 pts) Calcula un intervalo de confianza de 90\\%% para el número medio de disconformidades antes del cambio.
\\item (15 pts) Calcula un intervalo de confianza de 90\\%% para la estimar la diferencia en el número medio de disconformidades antes y después del cambio. ¿Qu\\'e puedes concluir con este resultado?
\\end{enumerate}
")

lproblems[7] <- sprintf("\n\\item Una empresa que fabrica tarjetas de circuitos impresos desea evaluar si la implementaci\\'on de un nuevo sistema de ensamblaje ha reducido el n\\'umero de disconformidades. Se tomaron 50 mediciones, antes y después del cambio, para analizar los efectos.
\\begin{center}
\\begin{tabular}{|l|c|c|}
\\hline
 & Antes & Después \\\\ 
\\hline
Media muestral & 3.60 & 2.37 \\\\ 
\\hline
Desviaci\'on est\'andar muestral & 1.09 & 1.62 \\\\ 
\\hline
\\end{tabular}
\\end{center}
\\begin{enumerate}
\\item (15 pts) Calcula un intervalo de confianza de 90\\%% para el número medio de disconformidades antes del cambio.
\\item (15 pts) ¿Existe suficiente evidencia para concluir que el número medio de disconformidades ha disminuido despu\\'es del cambio? Usa un nivel de significancia de 0.05.
\\end{enumerate}
")

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
cat(lproblems[[rdunif(1, 1, 5)]], file = filename, sep = "\n", append = TRUE)
cat(lproblems[[rdunif(1, 6, 7)]], file = filename, sep = "\n", append = TRUE)  
  fexam <- "
\\end{enumerate}
  
\\newpage

"
  cat(fexam, file = filename, sep = "\n", append = TRUE)
}

cat("\\end{document}", file = filename, sep = "\n", append = TRUE)
