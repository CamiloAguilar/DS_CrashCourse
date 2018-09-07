#**************************************************************************************************************************
## Escuela Colombiana de Ingeniería
## Curso de análisis de datos
#**************************************************************************************************************************

#************************
## 1. Generalidades ####
#************************

# Ayuda en R
?help
?getwd
?setwd
     
# Directorio de trabajo
getwd()
setwd()
ls()

# Secuencias
seq(7)
1:7
seq_along(letters)
letters
month.name

#*****************************
# 2. Objetos en R ####
#*****************************

## Booleanos
#*********************
FALSE
TRUE

## Vectores (array)
#*********************
# En R los vectores son secuencias de elementos del mismo tipo. 
vec_0 <- c(1,3,4,7,99,0,133,8)
vec_0
10 %in% vec_0
c(1, 133) %in% vec_0

vec_1 <- LETTERS
length(vec_1)
vec_1
class(vec_1)

vec_2 <- seq_along(letters); vec_2
class(vec_2)

## Elementos de un vector
vec_1[1:10]
vec_1[vec_1=="J"]
vec_1[vec_1!="M"]
vec_1[vec_1>"J"]

vec_2[vec_2>10]
vec_2[-1]

## Matrices
#*********************
# Una colección de elementos de la misma clase, organizados es un arreglo rectangular de dos dimensiones
?matrix
matrix(data=1:20, ncol=4, nrow=5)

m1 <- matrix(data=1:20, ncol=4, nrow=5)
m2 = matrix(data=1:20, 4, 5)

# operaciones básicas
m1 %*% m2
m1 + 10
m1 * 10

# elementos de una matriz
m1[1,] #fila 1
m1[,2] #columna 
m1[m1>10]

m2[,c(1,3)]
m2[c(4,1), ]

## Dataframes (tablas de datos)
#*********************************
# Es una clase de objeto que se usa para almacenar tablas de datos. Es una lista de vectores de igual longitud.
df0 <- data.frame(nombre = c("Karla", "Camila", "Julian", "Kamilo", "Emily"), 
                  edad = sample(22:32, 5),
                  genero = c("F", "F", "M", "M", "F"),
                  programa = c("economia", "matematicas", "admon", "ing.civil", "economia"))
df0
class(df0)

# selección de elementos en un data frame
names(df0)

df0$nombre
class(df0$nombre) ## Clase factor; muy útil para definir variables categóricas
levels(df0$nombre) ## las diferentes clases de la columna nombre

# coerción: cambio de clase de un objeto 
df0$nombre <- as.character(df0$nombre)
class(df0$nombre)

df1 <- as.data.frame(m1)
df1

data(mtcars)
mtcars
rownames(mtcars)
names(mtcars)

## listas 
#*********************
## una lista es una secuencia de elementos. Dichos elementos no tienen que pertenecer a la misma clase
lista0 <- list("casa", 0, "perro", 100, df0)
lista0[[1]]
lista0[[5]]



#********************************
## 3. Estructuras de control
#********************************

# En programación, las estructuras de control permiten modificar el flujo de ejecución de las instrucciones de un programa.
# Con las estructuras de control se puede:
     
#    * De acuerdo con una condición, ejecutar un grupo u otro de sentencias (ifelse, if - else)
#    * De acuerdo con el valor de una variable, ejecutar un grupo u otro de sentencias (switch)
#    * Ejecutar un grupo de sentencias mientras se cumpla una condición (while)
#    * Ejecutar un grupo de sentencias un número determinado de veces (for)

#*************
## ifelse
#*************
# Aprovechando que R realiza operaciones a nivel vectorial, la sentencia ifelse resulta muy útil para
# evaluar una condición de forma rápida sobre un objeto.

# Por ejemplo, si queremos saber si un número dado es par o impar
x <- sample(1:1000, 100)
ifelse(x %% 2 == 0, "es par", "es impar")
df2 <- data.frame(x,
                  eval=ifelse(x %% 2 == 0, "es par", "es impar")) 
View(df2)

#**************
# if - else
#**************
## Es la estructura de control mas utilizada en R. Esta estructura de control permite actuar en función de una condición. 

x <- runif(1, 0, 10) ## creamos un número aleatorio entre 0 y 10

## Evaluamos si el número es mayor que 5
if(x > 5) {
     y <- TRUE
     print(paste0(y, " >> El número es mayor que 5"))
     } else {
             y <- FALSE
             print(y)
             message(y, " >> El número es menor que 5")
            }

#*****************
# switch
#*****************
# Permite ejecutar un bloque de código distinto en función del valor de una variable.

x <- sample(1:100, 50)
type <- 'de'
switch(type,
       media = mean(x),
       mediana = median(x),
       de = sd(x))


#*****************
# for
#*****************
# Los bucles FOR son el tipo de bucle más utilizado en R. Estos toman una variable a la que se le asignan los 
# elementos de un objeto (en general, vectores o listas) en forma sucesiva a medida que se van recorriendo los 
# ciclos.

for(i in 1:5) {
     print(i)
}

x <- letters
for(letra in x) {
     print(letra)
}

## MAS COMPLEJO!
## En caso en que se quisiera recorrer una estructuras de más de una dimensión, como puede ser una matriz, 
## simplemente anidamos bucles FOR:
## Ejemplo: Guardar 1 a 1 los elementos de la matriz m1 en un vector
vec_m <- NULL

contador <- 1
for(i in 1:nrow(m1)){
     for (j in seq(ncol(m1))){
          vec_m[contador] <- m1[i, j]
          contador = contador + 1
          print(m1[i, j])
          }
}

vec_m

#***************
# while
#***************
## Los bucles WHILE comienzan comprobando una condición. Si esta es verdadera, entonces se entra al cuerpo del bucle. 
## Una vez completada una ejecución de este bloque, se comprueba la condición nuevamente y así sucesivamente hasta
## que la comprobación de la condición de falso.

contador <- 0
while(contador <= 10) {
     print(contador)
     contador <- contador + 1
}


#**************************
# Sentencias de control
#**************************

## next
#*********
## La función next es utilizada para terminar un ciclo del bucle en ejecución y pasar al siguiente. 
## Por ejemplo, si estamos dentro de un bucle FOR lo que sucedería al momento de ejecutar la función next 
## es que se se salta directo al siguiente elemento sobre sobre el que se está iterando.

# Imprimimos en pantalla los números pares entre 1 y 10
for(i in 1:10) {
     if(i %% 2 != 0) next 
     print(i)
}


## break
#*********
## En otro caso, la función break es usada para detener un bucle y salir de él inmediatamente.

# Recorremos los elementos de un vector hasta encontrar una condición y salir de él
for(i in mtcars$mpg) {
     print(i)
     if(i < 15) break
}

#**************************************************************************************************************************
##************************************************      FIN       *********************************************************
#**************************************************************************************************************************

