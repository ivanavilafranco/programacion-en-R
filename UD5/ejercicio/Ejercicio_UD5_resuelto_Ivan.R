#tabla con los diez comercios
load("C:/Users/ivan.avila/Desktop/tarjetas_black.RData")
library(dplyr)
top10comercios<-select(movimientos, c(comercio,actividad_completa,importe))%>% group_by(comercio,actividad_completa)%>% summarise(importe=sum(importe), .groups = 'drop')%>% arrange(desc(importe))%>% top_n(10,importe)
View(top10comercios)



#he realidao dos formas de hacer el grafico de barras:
library(ggplot2)
ggplot(top10comercios, aes(actividad_completa, importe))+ xlab("TOP 10 COMERCIOS")+ ylab("IMPORTE") + geom_bar(stat = 'identity', fill="green")
ggplot(top10comercios, aes(importe,actividad_completa))+ xlab("IMPORTE")+ ylab("TOP 10 COMERCIOS") + geom_bar(stat = 'identity', fill="green")


