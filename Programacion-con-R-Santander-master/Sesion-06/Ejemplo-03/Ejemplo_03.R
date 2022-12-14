# Ejemplo 3. Modelos no estacionarios y predicción

# https://github.com/AtefOuni/ts/tree/master/Data
    
# Serie de Producción de Electricidad de Australia

CBE <- read.csv("cbe.csv", header = TRUE)
Elec.ts <- ts(CBE[, 3], start = 1958, freq = 12)
plot(Elec.ts, xlab = "", ylab = "")
title(main = "Serie de Producción de Electricidad Australiana",
      ylab = "Producción de electricidad (GWh)",
      xlab = "Tiempo")

###

plot(diff(Elec.ts), xlab = "", ylab = "")
title(main = "Serie Diferenciada de Producción de Electricidad Australiana",
      xlab = "Tiempo", ylab = "Dif Serie",
      sub = "Gráfica de la serie diferenciada de primer órden")

###

plot(diff(log(Elec.ts)), xlab = "", ylab = "")
title(main = "Serie de log dif de Producción de Electricidad Australiana",
      xlab = "Tiempo", ylab = "Dif log-Serie",
      sub = "Gráfica de la serie log-transformada diferenciada de primer órden")

####################################################################################################################################################

                      # Simulación y ajuste

# A continuación, simulamos datos de un modelo ARIMA(1, 1, 1) y luego ajustamos un modelo a la serie simulada 
# para recuperar los parámetros estimados.

set.seed(1)
x <- w <- rnorm(1000)
for(i in 3:1000) x[i] <- 0.5*x[i-1] + x[i-1] - 0.5*x[i-2] + w[i] + 0.3*w[i-1]

###

plot(x, type = "l", 
     main = "Serie simulada de un modelo ARIMA(1, 1, 1)",
     xlab = "Tiempo",
     ylab = expression(x[t]),
     sub = expression(x[t] == 0.5*x[t-1] + x[t-1] - 0.5*x[t-2] + w[t] + 0.3*w[t-1]))

###

arima(x, order = c(1, 1, 1))

###

      # Simulación con la función arima.sim

x <- arima.sim(model = list(order = c(1, 1, 1), ar = 0.5, ma = 0.3), n = 1000)

###

arima(x, order = c(1, 1, 1))

####################################################################################################################################################

    # Serie de producción de cerveza

Beer.ts <- ts(CBE[, 2], start = 1958, freq = 12)
plot(Beer.ts, xlab = "", ylab = "")
title(main = "Serie de Producción de Cerveza en Australia",
      ylab = "Producción de Cerveza (Megalitros)",
      xlab = "Mes")

###

Beer.ima <- arima(Beer.ts, order = c(0, 1, 1))
Beer.ima

###

acf(resid(Beer.ima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

###

Beer.1991 <- predict(Beer.ima, n.ahead = 12)
sum(Beer.1991$pred)

#### Modelos Arima estacionales

# Procedimiento de ajuste
# Serie de Producción de Electricidad de Australia

plot(Elec.ts, xlab = "", ylab = "")
title(main = "Serie de Producción de Electricidad Australiana",
      ylab = "Producción de electricidad (GWh)",
      xlab = "Tiempo")

###

plot(log(Elec.ts), xlab = "", ylab = "")
title(main = "Log de Serie de Producción de Electricidad Australiana",
      ylab = "Log de Producción de electricidad (GWh)",
      xlab = "Tiempo")

###

Elec.AR <- arima(log(Elec.ts), order = c(1, 1, 0), 
                 seas = list(order = c(1, 0, 0), 12))

Elec.MA <- arima(log(Elec.ts), order = c(0, 1, 1),
                 seas = list(order = c(0, 0, 1), 12))


AIC(Elec.AR)
AIC(Elec.MA)

###

# Función para buscar un "buen" modelo (no basarse únicamente en los resultados de aplicar la función)

get.best.arima <- function(x.ts, maxord = c(1, 1, 1, 1, 1, 1)){
  best.aic <- 1e8
  n <- length(x.ts)
  for(p in 0:maxord[1])for(d in 0:maxord[2])for(q in 0:maxord[3])
    for(P in 0:maxord[4])for(D in 0:maxord[5])for(Q in 0:maxord[6])
    {
      fit <- arima(x.ts, order = c(p, d, q),
                   seas = list(order = c(P, D, Q),
                               frequency(x.ts)), method = "CSS")
      fit.aic <- -2*fit$loglik + (log(n) + 1)*length(fit$coef)
      if(fit.aic < best.aic){
        best.aic <- fit.aic
        best.fit <- fit
        best.model <- c(p, d, q, P, D, Q)
      }
    }
  list(best.aic, best.fit, best.model)
}

# Nuevo ajuste a los datos de la serie transformada de producción 
# de electricidad

best.arima.elec <- get.best.arima(log(Elec.ts),
                                  maxord = c(2, 2, 2, 2, 2, 2))

best.fit.elec <- best.arima.elec[[2]]  # Modelo
best.arima.elec[[3]] # Tipo de modelo (órdenes)
best.fit.elec
best.arima.elec[[1]] # AIC
###

# ACF para residuales del ajuste

acf(resid(best.fit.elec), main = "")
title(main = "Correlograma de los residuales del ajuste")

###
# Predicción

pr <- predict(best.fit.elec, 12)$pred 
ts.plot(cbind(window(Elec.ts, start = 1981),
              exp(pr)), col = c("blue", "red"), xlab = "")
title(main = "Predicción para la serie de producción de electricidad",
      xlab = "Mes",
      ylab = "Producción de electricidad (GWh)")



