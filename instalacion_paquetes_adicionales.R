#Unidad 3: Carga de datos
install.packages('readxl', dependencies=T)
install.packages('readODS', dependencies=T)
install.packages('foreign', dependencies=T)
install.packages('pxR', dependencies=T)
install.packages('tabulizer', dependencies=T)
##Si no podemos instalar tabulizer (https://github.com/ropensci/tabulizer)
install.packages("remotes")
remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"), INSTALL_opts = "--no-multiarch", force = TRUE)

#Unidad 3: Salvando datos
install.packages('writexl', dependencies=T)

#Unidad 3: Tablas y resúmenes estadísticos
install.packages('psych', dependencies=T)

#Unidad 5
install.packages('ggplot2', dependencies=T)
install.packages('rmarkdown', dependencies=T)
install.packages('dplyr', dependencies=T)
install.packages('RODBC', dependencies=T)