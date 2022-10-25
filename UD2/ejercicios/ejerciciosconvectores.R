#1. 
 c(2.6,2.7,1.5,2.1,1.7,1.7,2.3,2.1,2.2,1.9,2.7,1.6,1.4,2.1,1.4,1,2.6,2.5,1,2.6,0.6,1.8,1.5,2.8,2.3,2.9,1,2.1,1.1,0.3,0.7,2.6,1,1.8,1.9,2,1.4,2.1,2,2.4,1.5,2.7,1.7,2,2.8,3,1.5,2.6,1.7)->Prueba1
 c(4.3,3.7,2.4,3.8,1.7,2.2,3.4,3.4,3.1,1.9,4.1,3.8,1.5,1.4,0.3,2.1,6,3,1.4,2.3,1.2,1.6,3.4,2.1,1.2,4.3,0.8,3.3,4.2,0.4,1,1.7,1.1,3,1.5,3.8,1.6,2.8,2,3.5,1.1,3.6,3.6,3.2,6.1,5.2,7.3,6.1,8)->Prueba2

#2.
 length (Prueba1)
[1] 49
length (Prueba2)
[1] 49

#3. 
Prueba1+Prueba2->notas
notas
 [1] 6.9 6.4 3.9 5.9 3.4 3.9 5.7 5.5 5.3 3.8 6.8 5.4 2.9 3.5 1.7 3.1 8.6 5.5 2.4 4.9 1.8 3.4 4.9 4.9 3.5 7.2 1.8 5.4 5.3 0.7 1.7 4.3 2.1 4.8
[35] 3.4 5.8 3.0 4.9 4.0 5.9 2.6 6.3 5.3 5.2 8.9 8.2 8.8 8.7 9.7

#4.
> mean(notas)
[1] 4.857143

#5.
max(notas)
[1] 9.7
which.max(notas)
[1] 49

#6.
append(notas, 7.3)->notasfinales
notasfinales
 [1] 6.9 6.4 3.9 5.9 3.4 3.9 5.7 5.5 5.3 3.8 6.8 5.4 2.9 3.5 1.7 3.1 8.6 5.5 2.4 4.9 1.8 3.4 4.9 4.9 3.5 7.2 1.8 5.4 5.3 0.7 1.7 4.3 2.1
[34] 4.8 3.4 5.8 3.0 4.9 4.0 5.9 2.6 6.3 5.3 5.2 8.9 8.2 8.8 8.7 9.7 7.3

#7.
notasfinales +0.5 ->notasdefinitivas
notasdefinitivas
 [1]  7.4  6.9  4.4  6.4  3.9  4.4  6.2  6.0  5.8  4.3  7.3  5.9  3.4  4.0  2.2  3.6  9.1  6.0  2.9  5.4  2.3  3.9  5.4  5.4  4.0  7.7  2.3
[28]  5.9  5.8  1.2  2.2  4.8  2.6  5.3  3.9  6.3  3.5  5.4  4.5  6.4  3.1  6.8  5.8  5.7  9.4  8.7  9.3  9.2 10.2  7.8

#8.

notasdefinitivas>10
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[23] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[45] FALSE FALSE FALSE FALSE  TRUE FALSE

replace(notasdefinitivas, notasdefinitivas>10, 10) -> notasoposicion
> notasoposicion
 [1]  7.4  6.9  4.4  6.4  3.9  4.4  6.2  6.0  5.8  4.3  7.3  5.9  3.4  4.0  2.2  3.6  9.1  6.0  2.9  5.4  2.3  3.9  5.4  5.4  4.0  7.7  2.3
[28]  5.9  5.8  1.2  2.2  4.8  2.6  5.3  3.9  6.3  3.5  5.4  4.5  6.4  3.1  6.8  5.8  5.7  9.4  8.7  9.3  9.2 10.0  7.8

#9. 
sort(notasoposicion)-> notas_ord
notas_ord
 [1]  1.2  2.2  2.2  2.3  2.3  2.6  2.9  3.1  3.4  3.5  3.6  3.9  3.9  3.9  4.0  4.0  4.3  4.4  4.4  4.5  4.8  5.3  5.4  5.4  5.4  5.4  5.7
[28]  5.8  5.8  5.8  5.9  5.9  6.0  6.0  6.2  6.3  6.4  6.4  6.8  6.9  7.3  7.4  7.7  7.8  8.7  9.1  9.2  9.3  9.4 10.0


#10.

notas_ord >=5
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[23]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[45]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE

factor (notas_ord >=5) ->calificacion
calificacion
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE TRUE 
[23] TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE 
[45] TRUE  TRUE  TRUE  TRUE  TRUE  TRUE 
Levels: FALSE TRUE
levels()

levels(calificacion)<- c('suspenso','aprobado')
calificacion
 [1] suspenso suspenso suspenso suspenso suspenso suspenso suspenso suspenso suspenso suspenso suspenso suspenso suspenso suspenso suspenso
[16] suspenso suspenso suspenso suspenso suspenso suspenso aprobado aprobado aprobado aprobado aprobado aprobado aprobado aprobado aprobado
[31] aprobado aprobado aprobado aprobado aprobado aprobado aprobado aprobado aprobado aprobado aprobado aprobado aprobado aprobado aprobado
[46] aprobado aprobado aprobado aprobado aprobado
Levels: suspenso aprobado

#11.
media <- mean(notas_ord)
media
[1] 5.402
length(notas_ord[notas_ord<5])->suspensos
suspensos
[1] 21

length(notas_ord[notas_ord>=5])->aprobados
aprobados
[1] 29
length(notas_ord[notas_ord>=9])->sobresalientes
sobresalientes
[1] 5

#12.
tail (notas_ord,8)
[1]  7.7  7.8  8.7  9.1  9.2  9.3  9.4 10.0
tail (notas_ord,8)->con_plaza
con_plaza
[1]  7.7  7.8  8.7  9.1  9.2  9.3  9.4 10.0


