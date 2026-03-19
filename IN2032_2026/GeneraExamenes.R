# Genera random exams for all students in the class

library(openxlsx)
library(dplyr)

rdunif <- function(n, min, max) { round(runif(n, min, max), digits = 0)}

###############################################################################
# Include basic format
fopen <- 
  "\\documentclass[8pt]{report}
\\usepackage{graphicx}
\\parindent=0in
\\textwidth=6.7in 
\\textheight=9.5in
\\setlength{\\oddsidemargin}{-0.10in}
\\setlength{\\evensidemargin}{-0.10in}
\\setlength{\\topmargin}{-0.8in}
\\setlength{\\unitlength}{0.5in}
\\pagestyle{empty}

\\begin{document}"

ftitle <- "
\\begin{center}
{An\\'alisis Estad\\'stico de Datos (Examen Argumentativo)}
\\end{center}
"
finstructions <- "
{\\bf Instrucciones:} Muestra c\\'omo obtienes tu respuesta. Puedes usar Excel 
o Minitab para tus cálculos de probabilidades o 
percentiles, pero no uses otros archivos o hagas uso de la IA. Respeta el 
c\\'odigo de \\'etica del curso y del Tecnol\\'ogico 
de Monterrey.
"

###++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
###+++++++++++  CODE TO GENERATE EXAMS ++++++++++++++++++++++++++++++++++++++++
###+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Lee lista de alumnos
alumnos <- read.xlsx("IN2032_2026/ListaClase.xlsx", sheet="Lista")
filename <- "IN2032_2026/Examenes.tex"
set.seed(101)
#set.seed(67)

# Select problems at random by difficulty level
NSTUDENT <- nrow(alumnos)
exers <- list(p1 = c(rdunif(NSTUDENT, 1, 3)), p2 = rdunif(NSTUDENT, 4, 5),
              p3 = rdunif(NSTUDENT, 6, 7), p4 = rdunif(NSTUDENT, 8, 9), 
              p5 = rdunif(NSTUDENT, 10, 11), p6 = rep(12, NSTUDENT), 
              p7 = rep(13, NSTUDENT))

# CONSTRUCT EXAM FOR EACH STUDENT IN ONE FILE
cat(fopen, file = filename, sep = "\n", append = FALSE)
for (i in 1:NSTUDENT) {
  
  cat(ftitle, file = filename, sep = "\n", append = TRUE)
  cat("Nombre: \\underline{\\hspace*{.2in}}", alumnos$Nombre[i],
      "\\underline{\\hspace*{.2in}} \\quad Matr\\'icula:\\underline{\\hspace*{.2in}}",
      alumnos$Matricula[i], "\\underline{\\hspace*{.2in}} \\\\",
      file = filename, sep = "\n", append = TRUE)
  cat(finstructions, file = filename, sep = "\n", append = TRUE)
  cat("
\\begin{enumerate}", file = filename, sep = "\n", append = TRUE)

  #------------------------------------------------------------------------------
  source("IN2032_2026/BaseExercises.R")
  #i <- NSTUDENT # ERROR IN GENERATING PROBLEMS. USED FIXED VALUE
  cat(lproblems[[exers$p1[i]]], file = filename, sep = "\n", append = TRUE)
  cat(lproblems[[exers$p3[i]]], file = filename, sep = "\n", append = TRUE)
  cat(lproblems[[exers$p6[i]]], file = filename, sep = "\n", append = TRUE)
  cat(lproblems[[exers$p4[i]]], file = filename, sep = "\n", append = TRUE)
  cat(lproblems[[exers$p5[i]]], file = filename, sep = "\n", append = TRUE)
  cat(lproblems[[exers$p2[i]]], file = filename, sep = "\n", append = TRUE)
  cat(lproblems[[exers$p7[i]]], file = filename, sep = "\n", append = TRUE)
  #------------------------------------------------------------------------------
  
  cat("
\\end{enumerate}

\\newpage

", file = filename, sep = "\n", append = TRUE)
}
cat("\\end{document}", file = filename, sep = "\n", append = TRUE)