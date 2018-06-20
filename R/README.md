# Configuración rápida R y R Studio
### Guía corta para configuración inicial e instalación de librerías importantes

Una vez instalados __R__ y __R Studio__, procedemos a abrir el programa R Studio y realizar la siguiente configuración. En las opciones globales, configuramos la tabulación que será usada en el código, lo que facilitará la lectura posterior del código escrito por cada usuario.

![](https://github.com/CamiloAguilar/DS_CrashCourse/blob/master/R/img/tools_1.png)

![](https://github.com/CamiloAguilar/DS_CrashCourse/blob/master/R/img/tools_2.png)

## Instalación de librerías

Instalar las librerías _dplyr_, _reshape2_, _ggplot2_, _readr_, _readxl_, _stringr_ y _devtools_ usando el código a continuación
```r
install.packages("dplyr", dependencies=T)
```

## Kernel de R en Jupyter

### Requerimientos

 - Haber instalado previamente [Jupyter](https://github.com/CamiloAguilar/DS_CrashCourse/tree/master/Python)

### Instalación

Resulta necesario instalar la librería _IRkernel_ en R desde `devtools`, puesto que aún no se encuentra disponible en CRAN.

```r
install.packages('devtools')
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec()  # Para registrar el kernel en la actual instalación de R
```

Ahora estará disponible el kernel de R dentro del notebook de Jupyter.