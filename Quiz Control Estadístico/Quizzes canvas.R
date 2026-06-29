library(exams)

# Crea una lista de las preguntas del examen
mi_examen <- as.list(list.files("banco_preguntas", pattern = "*.Rmd", full.names = TRUE))
# Fija una semilla para reproducibilidad
set.seed(8047)

# Genera n quizzes en formato QTI 1.2
exams2canvas(mi_examen, 
             n = 5, 
             name = "CEC",
             dir = "examenes_canvas",
             converter = "pandoc-mathml"
)