#1. 
library(readxl)
emigraciones <- read_excel("C:/Users/ivan.avila/Downloads/migraciones_mun.xlsx",sheet = "emigraciones")
inmigraciones<- read_excel("C:/Users/ivan.avila/Downloads/migraciones_mun.xlsx",  sheet = "inmigraciones")
 
#2.
 migraciones<-merge(emigraciones,inmigraciones,all = T)
 
#3.
migraciones$Saldo<-migraciones$Inmigraciones-migraciones$Emigraciones
#4.
for(i in 1:nrow(migraciones)){
  if(is.na(migraciones$Saldo[i])){migraciones$Cod_Saldo[i]<-'-'}
  else if(migraciones$Saldo[i] < 0){migraciones$Cod_Saldo[i]<-1}
  else if(migraciones$Saldo[i] > 0){migraciones$Cod_Saldo[i]<-2}
  else if(migraciones$Saldo[i] == 0){migraciones$Cod_Saldo[i]<-3}
}


