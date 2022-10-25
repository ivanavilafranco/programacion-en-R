#1. Cargar en RStudio la información de la hoja Excel llamada migraciones_mun.xls, creando dos data frames distintos denominados emigraciones e inmigraciones
library(readxl)
emigraciones_mun <- read_excel("migraciones_mun.xlsx", sheet = "emigraciones")
inmigraciones_mun <- read_excel("migraciones_mun.xlsx", sheet = "inmigraciones")
#2. Unir los data frame de manera correcta (con la información común en los dos) en un único data frame llamado migraciones
migraciones<-merge(inmigraciones_mun,emigraciones_mun,all=T)
#3. Añadir una nueva variable al data frame que se llame Saldo como diferencia entre inmigrantes y emigrantes.
migraciones$Saldo<-migraciones$Inmigraciones-migraciones$Emigraciones
#4. Añadir una nueva variable al data frame llamada Cod_Saldo que codifique la variable Saldo de la siguiente manera: 1 si el municipio tiene saldo negativo, 2 si el municipio tiene saldo positivo y 3 si el municipio tiene saldo cero
for(i in 1:nrow(migraciones)){
  if(is.na(migraciones$Saldo[i])){migraciones$Cod_Saldo[i]<-'-'}
  else if(migraciones$Saldo[i] < 0){migraciones$Cod_Saldo[i]<-1}
  else if(migraciones$Saldo[i] > 0){migraciones$Cod_Saldo[i]<-2}
  else if(migraciones$Saldo[i] == 0){migraciones$Cod_Saldo[i]<-3}
}