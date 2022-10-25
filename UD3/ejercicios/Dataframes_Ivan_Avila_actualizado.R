#1. 
load("C:/Users/ivan.avila/Downloads/muestra.RData")
#2. 
factor(muestra$Sexo) -> fsexo
levels(fsexo) <- c('Hombre','Mujer')
cbind(muestra,fsexo) -> muestra
#3. 
length(muestra$Sexo) 
length(muestra$fsexo[muestra$fsexo=='Hombre'])
length(muestra$fsexo[muestra$fsexo=='Mujer']) 
#4. 
muestra$Altura <- muestra$Altura*100
muestra$Altura  
#5. 
aggregate(cbind(Altura,Peso)~fsexo,FUN=mean,data=muestra)
     
#6. 
subset(muestra,Situacion==2&Peso>75)


#7.
factor(muestra$Situacion) -> fsituacion
levels(fsituacion) <- c('Ocupada','Parada','Inactiva')
cbind(muestra,fsituacion) -> muestra 

#8.
table(muestra$fsexo,muestra$fsituacion)

#9.
tail(names(sort(table(muestra$CPMN))), 1)
