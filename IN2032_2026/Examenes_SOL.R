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
  print(paste("Generando solución para estudiante", i, "de", NSTUDENT))
  cat("Nombre: \\underline{\\hspace*{.2in}}", alumnos$Nombre[i],
      "\\underline{\\hspace*{.2in}} \\quad Matr\\'icula:\\underline{\\hspace*{.2in}}",
      alumnos$Matricula[i], "\\underline{\\hspace*{.2in}} \\\\",
      file = filename, sep = "\n", append = TRUE)
  cat("\n\\begin{enumerate}", file = filename, sep = "\n", append = TRUE)
  
  # Generate parameters
  p6_x <- round(runif(1, 2.50, 2.60), digits = 2)
  p7_x1 <- round(runif(1, 49.6, 50.0), digits = 1)
  p7_x2 <- round(runif(1, 50.0, 50.4), digits = 1)
  p8_tol <- round(runif(1, 0.08, 0.14), digits = 1)
  p9_tol <- round(runif(1, 0.40, 0.70), digits = 1)
  p10_n <- rdunif(1, 35, 50)
  p10_mu2 <- round(runif(1, 2.50, 3.55), digits = 2)
  p10_cl <- round(runif(1, 90, 99), digits = 0)
  p11_n <- rdunif(1, 35, 50)
  p11_mu2 <- round(runif(1, 2.50, 3.55), digits = 2)
  p12_n <- rdunif(1, 13, 17)
  p12_x <- rdunif(1, 3, 7)
  p13_p <- round(runif(1, 80, 99), digits = 1)
  
  # Solution exam
  reorderexs <- c(1, 3, 6, 4, 5, 2, 7)
  for (k in 1:length(exers)) {
    # ERROR IN GENERATING PROBLEMS. USED FIXED VALUE
    ex <- exers[[reorderexs[k]]][NSTUDENT]  # Exercise k for the student j
    print(paste("Ejercicio", k, ":", ex))
    switch(ex,
           "1" = {
             p1_mean <- 2.4933
             p1_n <- 5
             p1_s <- 0.1518/2.326
             p1_me <- 3*p1_s/sqrt(p1_n)
             p1_lcs <- p1_mean + p1_me
             p1_lci <- p1_mean - p1_me
             sol <- sprintf("\\item $\\hat\\sigma = 0.1518/2.326 = %.4f$\\\\", p1_s)
             sol1 <- sprintf("LCS = %.4f + 3(%.4f/%d**0.5) = %.4f + %.4f = %.4f\\\\", 
                             p1_mean, p1_s, p1_n, p1_mean, p1_me, p1_lcs)
             sol2 <- sprintf("LCI = %.4f - 3(%.4f/%d**0.5) = %.4f - %.4f = %.4f", p1_mean, 
                             p1_s, p1_n, p1_mean, p1_me, p1_lci)
             cat(sol, file = filename, sep = "\n", append = TRUE)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
             cat(sol2, file = filename, sep = "\n", append = TRUE)
             },
           "2" = {
             p2_mean <- 2.5082
             p2_n <- 4
             p2_s <- 0.0509/0.9213
             p2_me <- 3*p2_s/sqrt(p2_n)
             p2_lcs <- p2_mean + p2_me
             p2_lci <- p2_mean - p2_me
             sol1 <- sprintf("\\item LCS = %.4f + 3(%.4f/%d**0.5) = %.4f + %.4f = %.4f\\\\", 
                             p2_mean, p2_s, p2_n, p2_mean, p2_me, p2_lcs)
             sol2 <- sprintf("LCI = %.4f - 3(%.4f/%d**0.5) = %.4f - %.4f = %.4f", p2_mean, 
                             p2_s, p2_n, p2_mean, p2_me, p2_lci)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
             cat(sol2, file = filename, sep = "\n", append = TRUE)
             },
           "3" = {
             p3_mean <- 49.818
             p3_n <- 1
             p3_s <- 0.1920/1.128
             p3_me <- 3*p3_s/sqrt(p3_n)
             p3_lcs <- p3_mean + p3_me
             p3_lci <- p3_mean - p3_me
             sol1 <- sprintf("\\item LCS = %.4f + 3(%.4f/%d**0.5) = %.4f + %.4f = %.4f\\\\", 
                             p3_mean, p3_s, p3_n, p3_mean, p3_me, p3_lcs)
             sol2 <- sprintf("LCI = %.4f - 3(%.4f/%d**0.5) = %.4f - %.4f = %.4f", p3_mean, 
                             p3_s, p3_n, p3_mean, p3_me, p3_lci)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
             cat(sol2, file = filename, sep = "\n", append = TRUE)
           },
           "4" = {
             p4_Rbar <- 0.1518
             p4_n <- 5
             p4_s <- 0.1518/2.326
             p4_me <- 3*0.864*p1_s
             p4_lcs <- p4_Rbar + p4_me
             p4_lci <- p4_Rbar - p4_me
             sol1 <- sprintf("\\item LCS = %.4f + 3(0.864)%.4f = %.4f + %.4f = %.4f\\\\", 
                             p4_Rbar, p4_s, p4_Rbar, p4_me, p4_lcs)
             sol2 <- sprintf("LCS = %.4f - 3(0.864)%.4f = %.4f - %.4f = %.4f", 
                             p4_Rbar, p4_s, p4_Rbar, p4_me, p4_lci)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
             cat(sol2, file = filename, sep = "\n", append = TRUE)
           },
           "5" = {
             p5_Sbar <- 0.0509
             p5_n <- 4
             p5_s <- 0.0509/0.9213
             p5_me <- 3*sqrt(1-0.9213^2)*p5_s
             p5_lcs <- p5_Sbar + p5_me
             p5_lci <- p5_Sbar - p5_me
             sol <- sprintf("\\item $\\hat\\sigma = 0.0509/0.9213 = %.4f$\\\\", p5_s)
             sol1 <- sprintf("LCS = %.4f + 3((1-0.9213**2)**0.5)%.4f = %.4f + %.4f = %.4f\\\\", 
                             p5_Sbar, p5_s, p5_Sbar, p5_me, p5_lcs)
             sol2 <- sprintf("LCS = %.4f - 3((1-0.9213**2)**0.5)%.4f = %.4f - %.4f = %.4f", 
                             p5_Sbar, p5_s, p5_Sbar, p5_me, p5_lci)
             cat(sol, file = filename, sep = "\n", append = TRUE)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
             cat(sol2, file = filename, sep = "\n", append = TRUE)
           },
           "6" = {
             p6_mean <- 2.5082
             p6_n <- 4
             p6_s <- 0.0509/0.9213
             p6_z <- (p6_x - p6_mean)/p6_s
             p6_prob <- 1 - pnorm(p6_z) 
             sol <- sprintf("\\item $P(X > %.4f) = P(Z > %.4f) = %.4f$\\\\", 
                             p6_x, p6_z, p6_prob)
             cat(sol, file = filename, sep = "\n", append = TRUE)
           },
           "7" = {
             p7_mean <- 49.818
             p7_n <- 1
             p7_s <- 0.1920/1.128
             p7_z1 <- (p7_x1 - p7_mean)/p7_s
             p7_z2 <- (p7_x2 - p7_mean)/p7_s
             p7_prob <- pnorm(p7_z2) - pnorm(p7_z1)
             sol <- sprintf("\\item $\\hat\\sigma = 0.1920/1.128 = %.4f$\\\\", p7_s)
             sol1 <- sprintf("$P(%.4f < X < %.4f) = P(%.4f < Z < %.4f) = %.4f$\\\\", 
                            p7_x1, p7_x2, p7_z1, p7_z2, p7_prob)
             cat(sol, file = filename, sep = "\n", append = TRUE)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
           },
           "8" = {
             p8_mean <- 2.5082
             p8_n <- 4
             p8_s <- 0.0509/0.9213
             p8_les <- 2.70 + p8_tol
             p8_lei <- 2.30 - p8_tol
             p8_Cp <- (p8_les - p8_lei)/(6*p8_s)
             p8_Cps <- (p8_les - p8_mean)/(3*p8_s)
             p8_Cpi <- (p8_mean - p8_lei)/(3*p8_s)
             p8_Cpk <- min(p8_Cps, p8_Cpi)
             sol1 <- sprintf("\\item Cp = (%.4f-%.4f)/(6*%.4f) = %.4f\\\\", p8_les, 
                             p8_lei, p8_s, p8_Cp)
             sol2 <- sprintf("Cpks = (%.4f-%.4f)/(3*%.4f) = %.4f\\\\", p8_les, p8_mean, 
                             p8_s, p8_Cps)
             sol3 <- sprintf("Cpki = (%.4f-%.4f)/(3*%.4f) = %.4f\\\\", p8_mean, p8_lei, 
                             p8_s, p8_Cpi)
             sol4 <- sprintf("Cpk = min(%.4f, %.4f) = %.4f", p8_Cps, p8_Cpi, p8_Cpk)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
             cat(sol2, file = filename, sep = "\n", append = TRUE)
             cat(sol3, file = filename, sep = "\n", append = TRUE)
             cat(sol4, file = filename, sep = "\n", append = TRUE)
           },
           "9" = {
             p9_mean <- 49.818
             p9_n <- 1
             p9_s <- 0.1920/1.128
             p9_les <- 50.00 + p9_tol
             p9_lei <- 50.00 - p9_tol
             p9_Cp <- (p9_les - p9_lei)/(6*p9_s)
             p9_Cps <- (p9_les - p9_mean)/(3*p9_s)
             p9_Cpi <- (p9_mean - p9_lei)/(3*p9_s)
             p9_Cpk <- min(p9_Cps, p9_Cpi)
             sol <- sprintf("\\item $\\hat\\sigma = 0.1920/1.128 = %.4f$\\\\", p9_s)
             sol1 <- sprintf("Cp = (%.4f-%.4f)/(6*%.4f) = %.4f\\\\", p9_les, p9_lei, 
                             p9_s, p9_Cp)
             sol2 <- sprintf("Cpks = (%.4f-%.4f)/(3*%.4f) = %.4f\\\\", p9_les, p9_mean, 
                             p9_s, p9_Cps)
             sol3 <- sprintf("Cpki = (%.4f-%.4f)/(3*%.4f) = %.4f\\\\", p9_mean, p9_lei, 
                             p9_s, p9_Cpi)
             sol4 <- sprintf("Cpk = min(%.4f, %.4f) = %.4f", p9_Cps, p9_Cpi, p9_Cpk)
             cat(sol, file = filename, sep = "\n", append = TRUE)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
             cat(sol2, file = filename, sep = "\n", append = TRUE)
             cat(sol3, file = filename, sep = "\n", append = TRUE)
             cat(sol4, file = filename, sep = "\n", append = TRUE)
            },
           "10" = {
             p10_se <- sqrt(1.09^2/p10_n + 1.62^2/p10_n)
             p10_nu <- (p10_se^4)/((1.09^4/(p10_n^2*(p10_n-1))) + (1.62^4/(p10_n^2*(p10_n-1))))
             p10_t <- qt(1 - (1-p10_cl/100)/2, df = floor(p10_nu))
             p10_me <- p10_t*p10_se
             p10_lcs <- 3.60 - p10_mu2 + p10_me
             p10_lci <- 3.60 - p10_mu2 - p10_me
             cat("\\item **** Diferencia de medias\\\\", file = filename, sep = "\n", append = TRUE)
             sol <- sprintf("$\\nu = %.4f$\\\\", p10_nu)
             sol1 <- sprintf("LCS = 3.60 - %.4f + %.4f(%.4f) = %.4f + %.4f = %.4f\\\\", 
                             p10_mu2, p10_t, p10_se, 3.60-p10_mu2, p10_me, p10_lcs)
             sol2 <- sprintf("LCI = 3.60 - %.4f - %.4f(%.4f) = %.4f - %.4f = %.4f\\\\", 
                             p10_mu2, p10_t, p10_se, 3.60-p10_mu2, p10_me, p10_lci)
             cat(sol, file = filename, sep = "\n", append = TRUE)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
             cat(sol2, file = filename, sep = "\n", append = TRUE)
             cat("*** Antes del cambio\\\\", file = filename, sep = "\n", append = TRUE)
             p10_ta <- qt(1 - (1-p10_cl/100)/2, df = p10_n-1)
             sol3 <- sprintf("LCS = %.4f + %.4f(%.4f/%.4f**0.5) = %.4f + %.4f = %.4f\\\\", 
                             3.60, p10_ta, 1.09, sqrt(p10_n), 3.60, p10_ta*1.09/sqrt(p10_n), 
                             3.60 + p10_ta*1.09/sqrt(p10_n))
             sol4 <- sprintf("LCI = %.4f - %.4f(%.4f/%.4f**0.5) = %.4f - %.4f = %.4f\\\\", 
                             3.60, p10_ta, 1.09, sqrt(p10_n), 3.60, p10_ta*1.09/sqrt(p10_n), 
                             3.60 - p10_ta*1.09/sqrt(p10_n))   
             cat(sol3, file = filename, sep = "\n", append = TRUE)
             cat(sol4, file = filename, sep = "\n", append = TRUE)
             },
           "11" = {
             p11_se <- sqrt(1.09^2/p11_n + 1.62^2/p11_n)
             p11_nu <- floor((p11_se^4)/((1.09^4/(p11_n^2*(p11_n-1))) + (1.62^4/(p11_n^2*(p11_n-1)))))
             p11_t0 <- (3.60-p10_mu2)/p11_se
             p11_p <- 1-pt(p11_t0, df = p11_nu)
             sol1 <- sprintf("\\item Ho: $\\mu_1 = \\mu_2$\\\\
                                     Ha: $\\mu_1 > \\mu_2$\\\\
                                     $\\sigma = 0.05$\\\\")
             sol2 <- sprintf("Estadistico: $T_0 = %.4f/%.4f = %.4f$\\\\", 3.60-p11_mu2, p11_se, p11_t0)
             sol3 <- sprintf("Valor p = $P(T >%.4f) = %.4f$\\\\", p11_t0, p11_p)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
             cat(sol2, file = filename, sep = "\n", append = TRUE)
             cat(sol3, file = filename, sep = "\n", append = TRUE)
           },
           "12" = {
             p12_p <- dbinom(p12_x, size = p12_n, prob = 0.05)
             sol <- sprintf("\\item $X \\sim Bin(n=%d, p=0.05)$\\\\", p12_n)
             sol1 <- sprintf("$P(X = %d) = %.6f$", p12_x, p12_p)
             cat(sol, file = filename, sep = "\n", append = TRUE)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
           },
           "13" = {
             p13_z0 <- qnorm(1-p13_p/100)
             p13_mu <- 500 - 8*p13_z0
             sol1 <- sprintf("\\item $P(X < 500) = P(Z < (500-\\mu)/8) = %.4f$\\\\", 1-p13_p/100)
             sol2 <- sprintf("$\\mu = 500 - 8(%.4f) = %.4f$\\\\", p13_z0, p13_mu)
             cat(sol1, file = filename, sep = "\n", append = TRUE)
             cat(sol2, file = filename, sep = "\n", append = TRUE)
           }
    )
  } # Exam Student i

  
  cat("\\end{enumerate}\n\n \\newpage\n", file = filename, sep = "\n", append = TRUE)

  } # All students
cat("\\end{document}", file = filename, sep = "\n", append = TRUE)