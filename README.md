# Generación Automática de Exámenes Parametrizados con R/exams e Inteligencia Artificial

Este repositorio proporciona una metodología integral y plantillas estructuradas para asistir al personal docente en la creación de bancos de preguntas dinámicos e individualizados. Mediante la integración de la Inteligencia Artificial Generativa (como asistente de redacción del problema estadístico, código R y el formato RMarkdown y LaTeX) y el paquete `exams` de R, este flujo de trabajo permite generar múltiples versiones de un mismo instrumento de evaluación. El objetivo principal es salvaguardar la integridad académica y mitigar el plagio, facilitando la exportación nativa a Canvas LMS, formato PDF y HTML.

## Requisitos previos
* Entorno de desarrollo [R](https://cran.r-project.org/) y [RStudio](https://posit.co/download/rstudio-desktop/) instalados.
* Paquete estadístico instalado en R (mediante el comando `install.packages("exams")`).
* Una distribución de LaTeX (como MiKTeX, MacTeX o TinyTeX) para la compilación de documentos en formato PDF. Los exámenes generados en HTML y Canvas no requieren LaTeX, pero los exámenes en PDF fueron generados utilizando MiKTeX 26.5.

## Procedimiento de Uso

El flujo de trabajo para la generación de evaluaciones requiere seguir los siguientes cuatro pasos metodológicos:

### 1. Preparación del entorno de trabajo
1. Inicie la aplicación RStudio.
2. Descargue el directorio denominado `Mi_DGP_Quiz` disponible en este repositorio por medio de la [liga de descarga](https://download-directory.github.io/). En la página de descarga copie la dirección del directorio Mi_DGP_Quiz: https://github.com/ivanps/R-Exams-AI/tree/main/Mi_DGP_Quiz. 
3. Copie dicho directorio en la ubicación local destinada para la gestión de sus evaluaciones y configúrelo como su Directorio de Trabajo (*Working Directory*) dentro de RStudio.

### 2. Generación de ejercicios asistida por IA
En lugar de programar los Procesos de Generación de Datos (DGP) manualmente, se emplean modelos de lenguaje para estructurar la lógica matemática y las variables aleatorias. En el directorio `Mi_DGP_Quiz\template_preguntas` se encuentra un archivo de ejemplo para preguntas de opción múltiple y de respuesta numérica. 
* Modifique el siguiente prompt de IA para adaptarlo a su problema o temática específica:
```text
Actúa como experto en Diseño Instruccional STEM y programador avanzado en el paquete R/exams desarrollado por Achim Zeileis. 
Utiliza los archivos adjuntos q_num.Rmd y q_schoice.Rmd como plantillas obligatorias. 
Genera exactamente 5 ejercicios independientes en formato R Markdown (.Rmd) sobre Control Estadístico de la Calidad (específicamente gráficos de Shewhart, cálculo de límites de control, fracción defectuosa y capacidad real/potencial del proceso Cp/Cpk). 
Diseña los problemas en los niveles cognitivos de Aplicar y Analizar de la Taxonomía de Bloom, privilegiando situaciones que requieran interpretación, razonamiento estadístico y toma de decisiones basadas en datos, evitando preguntas de simple memorización. 
Dos ejercicios deben ser de respuesta numérica (extype: num) y tres de opción múltiple con una sola respuesta correcta (extype: schoice). 
Respeta estrictamente la estructura, formato, sintaxis y estilo de los archivos de referencia. 
Entrega los resultados como 5 archivos .Rmd descargables, uno por ejercicio.
```
* Ejecute el prompt en un modelo de lenguaje generativo (como ChatGPT) para obtener los archivos .Rmd que contienen el ejercicio, el código R y el formato RMarkdown.
* Guarde los archivos `.Rmd` dentro de su directorio `Mi_DGP_Quiz\banco_preguntas`.

*Nota: Los ejercicios generados con este prompt en ChatGPT se guardaron en el directorio `Quiz Control Estadístico\banco_preguntas`.*

### 3. Configuración de la evaluación
Abra el script de configuración de R correspondiente al formato de salida deseado (Canvas, PDF o HTML) y modifique los siguientes parámetros:
* Especifique el número de copias o versiones únicas requeridas.
* Borre los archivos `.Rmd` que no desee incluir en la evaluación. Recuerde que el script inclye automáticamente todos los archivos `.Rmd` presentes en el directorio `banco_preguntas`.
* En caso de requerir exámenes en PDF, este es el paso donde se debe modificar el archivo `master_template.tex` para integrar la identidad gráfica e institucional correspondiente. También es posible editar los archivo tex de cada ejercicio o los exámenes individuales para personalizar el diseño de cada pregunta.

### 4. Compilación y despliegue multiplataforma
Ejecute el script configurado en el paso anterior para compilar las evaluaciones. Las salidas disponibles son:
* **HTML (`exams2html`):** Permite la previsualización local para verificar la correcta renderización de fórmulas, imágenes y resultados.
* **PDF (`exams2pdf`):** Genera archivos listos para impresión en aplicaciones presenciales, produciendo simultáneamente el cuadernillo del estudiante y la clave de respuestas automatizada.
* **Canvas LMS (`exams2canvas`):** Construye un paquete comprimido (`.zip`) bajo el estándar QTI 1.2. Esta configuración utiliza el parámetro `pandoc-mathml` para garantizar la compatibilidad matemática en el navegador y está listo para ser importado directamente a la plataforma.

Nota: Los exámenes en HTML, PDF y Canvas generados con este flujo de trabajo se encuentran en el directorio `Exam Control Estadístico`*.

## Contribuciones y referencias
Este proyecto ha sido desarrollado como una innovación tecnológica para optimizar los tiempos de diseño de los educadores en disciplinas de Ciencia, Tecnología, Ingeniería y Matemáticas (STEM). Se invita a la comunidad académica a clonar el repositorio, proponer mejoras institucionales (Pull Requests) y adaptar la metodología a sus respectivos entornos educativos.
