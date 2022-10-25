#Con el archivo de datos tarjetas_black.RData obtener una tabla con los diez comercios donde más dinero se ha gastado en total
load("tarjetas_black.RData")
library(dplyr)
comerciosblack<-select(movimientos,c(comercio,actividad_completa,importe))%>%
  group_by(comercio,actividad_completa)%>%
  summarise(importe=sum(importe), .groups = 'drop')%>%
  arrange(desc(importe))%>%
  top_n(10,importe)

#Realizamos un gráfico con los resultados
library(ggplot2)
ggplot(comerciosblack,aes(importe,actividad_completa))+
  xlab("Importe")+
  ylab("Actividad")+
  geom_bar(stat='identity', fill="#0072B2")

#Agradecimiento
print('Gracias Juan de Dios por el curso')

