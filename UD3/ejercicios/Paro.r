#1. 
Paro_por_municipios_2006_csv <- read.csv("C:/Users/ivan.avila/Downloads/Paro_por_municipios_2006_csv.csv", sep=";")
View(Paro_por_municipios_2006_csv)
 
#2.
subset(Paro_por_municipios_2006_csv,X.3=='Andalucía',1:20)->Datos_Andalucia
 View(Datos_Andalucia)
 
#3.NO ESTOY SEGURO DE COMO HACER ESTA PARTE. 
Datos_Andalucia$X.19<-Datos_Andalucia$X.8+Datos_Andalucia$X.9+Datos_Andalucia$X.10
Datos_Andalucia$X.20<-Datos_Andalucia$X.11+Datos_Andalucia$X.12+Datos_Andalucia$X.13

#4.
Datos_Andalucia_nuevo<- Datos_Andalucia[,-c(1:4,10:20)]
View(Datos_Andalucia_nuevo)

#5.
names(Datos_Andalucia_nuevo)[5]<-'Total'
#6. 
aggregate(cbind(Total,X.19,X.20)~Provincia,FUN=sum,data=Datos_Andalucia_nuevo)->Datos_Andalucia_sumatorio




