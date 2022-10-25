#1. Cargar el fichero Ejercicio_texto.Rdata
load("Ejercicio_texto.RData")
#2. Extraer el código de la provincia del campo Código del expediente y almacenarlo en el mismo data frame en una columna llamada Provincia
substr(Ejercicio_texto$Cod_Expediente,4,5)->Ejercicio_texto$Provincia
#3. En la nueva variable creada, sustituir todas las abreviaturas de las provincias por el nombre completo de cada una de ellas
sub('AL','Almería',sub('CA','Cádiz',sub('CO','Córdoba',sub('GR','Granada',sub('HU','Huelva',sub('JA','Jaén',sub('MA','Málaga',sub('SE','Sevilla',Ejercicio_texto$Provincia))))))))->Ejercicio_texto$Provincia
#4. Cambiar la variable a tipo factor
as.factor(Ejercicio_texto$Provincia)->Ejercicio_texto$Provincia