library(exams)

?# Crea una lista de las preguntas del examen
mi_examen <- as.list(list.files("banco_preguntas", pattern = "*.Rmd", full.names = TRUE))
# Fija una semilla para reproducibilidad
set.seed(2026)

# Genera n quizzes en formato pdf en dir y tex files in texdir
exams2canvas(mi_examen, 
          n = 5, 
          name = "Tema_Evaluacion",
          dir = "examen_canvas",
          converter = "pandoc-mathml"
)
