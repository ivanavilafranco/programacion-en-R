#1. Cargar el fichero con todas sus especificaciones
Paro_por_municipios_2006_csv <- read.csv("Paro_por_municipios_2006_csv.csv", sep=";", skip="1")
#2. Crear un data frame solo con los datos de Andalucía
subset(Paro_por_municipios_2006_csv,Comunidad.Autónoma=='Andalucía',1:20)->Paro_Andalucia
#3. Crear dos variables nuevas en el data frame que sean el total de hombres y el total de mujeres por municipio
Paro_Andalucia$Paro.total.hombres<-Paro_Andalucia$Paro.hombre.edad...25+Paro_Andalucia$Paro.hombre.edad...45+Paro_Andalucia$Paro.hombre.edad.25..45
Paro_Andalucia$Paro.total.mujeres<-Paro_Andalucia$Paro.mujer.edad...25+Paro_Andalucia$Paro.mujer.edad...45+Paro_Andalucia$Paro.mujer.edad.25..45
#4. Crear un data frame que solamente contenga las siguientes variables: Código de provincia, Provincia, Código de municipio, Municipio, Total paro registrado, Total paro Hombres, Total paro Mujeres
Paro_Andalucia_2<-Paro_Andalucia[,-c(1:4,10:20)]
#5. Cambiar el nombre a la variable “total.Paro.Registrado” por “Total”
names(Paro_Andalucia_2)[5]<-'Total'
#6. Crear una tabla con el sumatorio por provincias del total, total de hombres y total de mujeres paradas
aggregate(cbind(Total,Paro.total.hombres,Paro.total.mujeres)~Provincia,FUN=sum,data=Paro_Andalucia_2)->Paro_Andalucia_Provincias
