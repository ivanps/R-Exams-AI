library(exams)

# Crea una lista de las preguntas del examen
mi_examen <- as.list(list.files("banco_preguntas", pattern = "*.Rmd", full.names = TRUE))
# Fija una semilla para reproducibilidad
set.seed(8047)

# Genera n quizzes en formato pdf en dir y guarda tex files in texdir
exams2pdf(mi_examen, 
          n = 5, 
          name = "Tema_A_Evaluar",
          dir = "examenes_pdf",
          texdir = "examenes_tex",
          template = "master_template.tex",
          type = "latex",
          verbose = TRUE
)
