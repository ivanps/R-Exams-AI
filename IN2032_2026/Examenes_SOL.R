library(openxlsx)
library(dplyr)

rdunif <- function(n, min, max) { round(runif(n, min, max), digits = 0)}

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

###++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
###+++++++++++  CODE TO GENERATE SOLUTIONS +++++++++++++++++++++++++++++++++++
###+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Lee lista de alumnos
alumnos <- read.xlsx("IN2032_2026/ListaClase.xlsx", sheet="Lista")
filename <- "IN2032_2026/Examenes_SOL.tex"
set.seed(101)

# Select problems at random by difficulty level
NSTUDENT <- nrow(alumnos)
exers <- list(p1 = c(rdunif(NSTUDENT, 1, 3)), p2 = rdunif(NSTUDENT, 4, 5),
              p3 = rdunif(NSTUDENT, 6, 7), p4 = rdunif(NSTUDENT, 8, 9), 
              p5 = rdunif(NSTUDENT, 10, 11), p6 = rep(12, NSTUDENT), 
              p7 = rep(13, NSTUDENT))
# Assignment order: 1, 3, 6, 4, 5, 2, 7

# Report solution for each student in one file
cat(fopen, file = filename, sep = "\n", append = FALSE)
for (i in 1:NSTUDENT) {
  j <- NSTUDENT # ERROR IN GENERATING PROBLEMS. USED FIXED VALUE
  cat("Nombre: \\underline{\\hspace*{.2in}}", alumnos$Nombre[i],
      "\\underline{\\hspace*{.2in}} \\quad Matr\\'icula:\\underline{\\hspace*{.2in}}",
      alumnos$Matricula[i], "\\underline{\\hspace*{.2in}} \\\\",
      file = filename, sep = "\n", append = TRUE)
  cat("\n\\begin{enumerate}", file = filename, sep = "\n", append = TRUE)
  
  # Solution problem 1
  p1_mean <- c(2.4933, 2.5082, 49.818)
  p1_n <- c(5, 4, 1)
  p1_s <- c(0.1518/2.326, 0.0509/0.9213, 0.1920/1.128)
  p1_me <- 3*p1_s/sqrt(p1_n)
  p1_lcs <- p1_mean + p1_me
  p1_lci <- p1_mean - p1_me
  sol1 <- sprintf("\\item LCS = %.4f + 3(%.4f/(%d)**0.5) = %.4f + %.4f = %.4f", p1_mean[exers$p1[j]], 
                  p1_s[exers$p1[j]], p1_n[exers$p1[j]], p1_mean[exers$p1[j]], 
                  p1_me[exers$p1[j]], p1_lcs[exers$p1[j]])
  sol2 <- sprintf("LCI = %.4f - 3(%.4f/(%d)**0.5) = %.4f - %.4f = %.4f", p1_mean[exers$p1[j]], 
                  p1_s[exers$p1[j]], p1_n[exers$p1[j]], p1_mean[exers$p1[j]], 
                  p1_me[exers$p1[j]], p1_lci[exers$p1[j]])
  cat(sol1, file = filename, sep = "\n", append = TRUE)
  cat(sol2, file = filename, sep = "\n", append = TRUE)
  
  cat("\\end{enumerate}\n\n \\newpage\n", file = filename, sep = "\n", append = TRUE)
}
cat("\\end{document}", file = filename, sep = "\n", append = TRUE)