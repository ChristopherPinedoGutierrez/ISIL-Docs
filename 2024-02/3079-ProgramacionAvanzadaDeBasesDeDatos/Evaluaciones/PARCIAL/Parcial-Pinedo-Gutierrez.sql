USE SumaQPizza;
GO
ALTER AUTHORIZATION ON DATABASE::[SumaQPizza] TO [sa];
GO

/* PREGUNTA 1 (3 puntos)
Independientemente de la medida de la pizza, ¿cuál es el sabor de pizza
que tiene más demanda entre los clientes de SumaQPizza?
*/

SELECT TOP 1 SaborPizza.nomSaborPizza, SUM(DetallePedido.cantidad) AS total_cantidad
FROM DetallePedido
JOIN Pizza ON DetallePedido.idPizza = Pizza.idPizza
JOIN SaborPizza ON Pizza.idSaborPizza = SaborPizza.idSaborPizza
GROUP BY SaborPizza.nomSaborPizza
ORDER BY total_cantidad DESC;



/* PREGUNTA 2 (3 puntos) 
Para cada sabor de pizza, ¿cuál es el monto total de dinero
ingresado en el mes de diciembre? El monto total por cada sabor de 
pizza se debe mostrar desagregado por la medida de la pizza,
y ordenado de mayor a menor monto total.
*/

SELECT SaborPizza.nomSaborPizza, Pizza.medida, SUM(DetallePedido.cantidad * Pizza.precio) AS total_ingresos
FROM Pedido
JOIN DetallePedido ON Pedido.idPedido = DetallePedido.idPedido
JOIN Pizza ON DetallePedido.idPizza = Pizza.idPizza
JOIN SaborPizza ON Pizza.idSaborPizza = SaborPizza.idSaborPizza
WHERE MONTH(Pedido.fecha) = 12
GROUP BY SaborPizza.nomSaborPizza, Pizza.medida
ORDER BY total_ingresos DESC;



/* PREGUNTA 3 (4 puntos)
Para las pizzas vegetarianas (categoría Veggie), ¿cuántas unidades 
mensuales por sabor de pizza se han vendido en el año para las pizzas
que tienen como ingrediente aceitunas (olives)?
*/

SELECT SaborPizza.nomSaborPizza, MONTH(Pedido.fecha) AS mes, SUM(DetallePedido.cantidad) AS total_cantidad
FROM DetallePedido
JOIN Pizza ON DetallePedido.idPizza = Pizza.idPizza
JOIN SaborPizza ON Pizza.idSaborPizza = SaborPizza.idSaborPizza
JOIN Pedido ON DetallePedido.idPedido = Pedido.idPedido
WHERE SaborPizza.categoria = 'Veggie' AND SaborPizza.ingredientes LIKE '%Olives%'
GROUP BY SaborPizza.nomSaborPizza, MONTH(Pedido.fecha)
ORDER BY mes, SaborPizza.nomSaborPizza;



/* PREGUNTA 4 (5 puntos)
Para las ventas efectuadas en horas de la noche, ¿cuántas
unidades en total se vendieron de 19:00 a 19:59 horas, de
20:00 a 20:59, de 21:00 a 21:59, de 22:00 a 22:59, y de
23:00 a 23:59 horas en la fecha 31 de diciembre ( 3 de enero del 2015 )?
*/

SELECT 
    CASE 
        WHEN DATEPART(HOUR, Pedido.hora) = 19 THEN '19:00 - 19:59'
        WHEN DATEPART(HOUR, Pedido.hora) = 20 THEN '20:00 - 20:59'
        WHEN DATEPART(HOUR, Pedido.hora) = 21 THEN '21:00 - 21:59'
        WHEN DATEPART(HOUR, Pedido.hora) = 22 THEN '22:00 - 22:59'
        WHEN DATEPART(HOUR, Pedido.hora) = 23 THEN '23:00 - 23:59'
    END AS franja_horaria, 
    SUM(DetallePedido.cantidad) AS total_vendido
FROM Pedido
JOIN DetallePedido ON Pedido.idPedido = DetallePedido.idPedido
WHERE CONVERT(DATE, Pedido.fecha, 103) = '2015-01-03'
AND DATEPART(HOUR, Pedido.hora) BETWEEN 19 AND 23
GROUP BY DATEPART(HOUR, Pedido.hora);



/* PREGUNTA 5 (5 puntos)
El supervisor de ventas, que es pariente del dueño de la empresa, 
tiene la impresión de que en los meses octubre, noviembre y diciembre las 
ventas en el horario de 23:00 a 23:59 horas son muy bajas, por lo que 
está pensando sugerir a la Gerencia que el horario de atención sea solo 
hasta las 22:59 y no hasta las 23:59 como es actualmente. 
Elabore un informe que le permita al supervisor tomar la decisión de 
hacer o no dicha sugerencia a la Gerencia.
*/

SELECT 
    DATENAME(MONTH, Pedido.fecha) AS mes,
    SUM(CASE WHEN DATEPART(HOUR, Pedido.hora) = 22 THEN DetallePedido.cantidad ELSE 0 END) AS total_vendido_22_a_23,
    SUM(CASE WHEN DATEPART(HOUR, Pedido.hora) = 23 THEN DetallePedido.cantidad ELSE 0 END) AS total_vendido_23_a_24
FROM Pedido
JOIN DetallePedido ON Pedido.idPedido = DetallePedido.idPedido
WHERE DATEPART(MONTH, Pedido.fecha) IN (10, 11, 12)
GROUP BY DATENAME(MONTH, Pedido.fecha), DATEPART(MONTH, Pedido.fecha)
ORDER BY DATEPART(MONTH, Pedido.fecha);


