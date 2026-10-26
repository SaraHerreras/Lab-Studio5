library(dplyr)
library(ggplot2)
library(lubridate)
library(tseries)

data("AirPassengers")
 
 # Inspeccionar la estructura del dataset
 print(class(AirPassengers))   # Verifica que es una serie temporal (ts)
 print(summary(AirPassengers))# Resumen estadístico
 print(start(AirPassengers))   # Inicio de la serie
 print(end(AirPassengers))     # Fin de la serie
 print(frequency(AirPassengers)) # Frecuencia: 12 (mensual)

 #2.   Exploración inicial:
 head(AirPassengers)
 
 AirPassengers %>% 
   ggplot() +
   geom_line(color=color) 
 
 mean(AirPassengers)
 sd(AirPassengers)
 
 #3.   Análisis de tendencia y estacionalidad:
 plot(decompose(AirPassengers))
 
 #4.   Análisis de estacionariedad:
 acf(AirPassengers, type="covariance", plot="FALSE")
 pacf(AirPassengers, lag.max=12)
 
 adf.test(AirPassengers, k = 0)
 
 lineplot(AirPassengers)
 boxplot(AirPassengers)
 
 print("Se ha observado dos grandes períodos con ciclos de bajada y subida, por un lado, una entre los años 1949 a 1953 y otra entre los años 1958 a 1961, descomponiendo la serie temporal se observa un gran tendencia positiva y gran estacionalidad")
 print("El comportamiento de los ciclos y de la estacionalidad puede deberse a que la mayoría de las personas suelen realizar viajes en sus períodos vacacionales, que suelen ser en verano y vacaciones de Navidad, y su tendencia positiva puede deberse a que los costes de los viajes se redujeron, por lo que cada vez más personas podían realizar viajes. ")
 