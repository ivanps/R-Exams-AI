library(exams)

# Crea una lista de las preguntas del examen
my_exam <- as.list(list.files("questions", pattern = "*.Rmd", full.names = TRUE))
# Fija una semilla para reproducibilidad
set.seed(2026)

# Genera n quizzes en formato pdf en dir y tex files in texdir
exams2pdf(my_exam, 
          n = 2, 
          name = "Normal_Quiz_",
          dir = "exams",
          texdir = "tex_files",
          template = "template/exam_template.tex",
          type = "latex",
          verbose = TRUE
)
