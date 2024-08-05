 /* b) Explorar la tabla “menu_items” para conocer los productos del menú.
 1.- Realizar consultas para contestar las siguientes preguntas:
 ● Encontrar el número de artículos en el menú.
	Respuesta = 32
*/

SELECT COUNT(*)
FROM MENU_ITEMS;

 /*● ¿Cuáles el artículo menos caro y el más caro en el menú?
	Respuesta = Edameme y Shrimp Scampi*/

SELECT *
FROM MENU_ITEMS
ORDER BY PRICE
LIMIT 1;

SELECT *
FROM MENU_ITEMS
ORDER BY PRICE DESC
LIMIT 1;

/* ● ¿Cuántos platos americanos hay en el menú?
	Respuesta = 6*/

SELECT COUNT(*)
FROM MENU_ITEMS
WHERE CATEGORY = 'American';

 /*● ¿Cuálesel precio promedio de los platos?
	Respuesta = 13.29*/

SELECT ROUND(AVG(PRICE),2)
FROM MENU_ITEMS;

/* c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
 1.- Realizar consultas para contestar las siguientes preguntas:
 ● ¿Cuántos pedidos únicos se realizaron en total?
	Respuesta = 5370'*/

SELECT COUNT(DISTINCT(ORDER_ID))
FROM ORDER_DETAILS;

/* ● ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
	Respuesta = 330,440,443,1957,2675 */

SELECT ORDER_ID, COUNT(*)
FROM ORDER_DETAILS
GROUP BY ORDER_ID
ORDER BY COUNT(*) DESC, ORDER_ID
LIMIT 5;

/* ● ¿Cuándose realizó el primer pedido y el último pedido?
	Respuesta = 2023-01-01 11:38:36 y 2023-03-31 22:15:48*/

SELECT ORDER_DATE, ORDER_TIME
FROM ORDER_DETAILS
ORDER BY ORDER_DATE, ORDER_TIME
LIMIT 1;

SELECT ORDER_DATE, ORDER_TIME
FROM ORDER_DETAILS
ORDER BY ORDER_DATE DESC, ORDER_TIME DESC
LIMIT 1;

/* ● ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?*/

SELECT COUNT(ORDER_ID)
FROM ORDER_DETAILS
WHERE ORDER_DATE BETWEEN '2023-01-01' AND '2023-01-05';

/*d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.
 1.- Realizar un left join entre entre order_details y menu_items con el identificador
 item_id(tabla order_details) y menu_item_id(tabla menu_items).*/

SELECT *
FROM ORDER_DETAILS T1
LEFT JOIN MENU_ITEMS T2 ON T1.ITEM_ID = MENU_ITEM_ID;

/*e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las
 preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El
 objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del
 restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y
 utiliza los resultados obtenidos para llegar a estas conclusiones.*/

SELECT CATEGORY, COUNT(ORDER_DETAILS_ID)
FROM ORDER_DETAILS T1
LEFT JOIN MENU_ITEMS T2 ON T1.ITEM_ID = MENU_ITEM_ID
GROUP BY CATEGORY
ORDER BY COUNT(ORDER_DETAILS_ID), CATEGORY;

SELECT ITEM_NAME, CATEGORY, COUNT(ORDER_DETAILS_ID)
FROM ORDER_DETAILS T1
LEFT JOIN MENU_ITEMS T2 ON T1.ITEM_ID = MENU_ITEM_ID
GROUP BY ITEM_NAME, CATEGORY
ORDER BY CATEGORY, COUNT(ORDER_DETAILS_ID) DESC, ITEM_NAME;

SELECT ITEM_NAME, COUNT(ORDER_DETAILS_ID)
FROM ORDER_DETAILS T1
LEFT JOIN MENU_ITEMS T2 ON T1.ITEM_ID = MENU_ITEM_ID
GROUP BY ITEM_NAME
ORDER BY COUNT(ORDER_DETAILS_ID) DESC, ITEM_NAME;

SELECT ITEM_NAME, CATEGORY, PRICE, COUNT(ORDER_DETAILS_ID)
FROM ORDER_DETAILS T1
LEFT JOIN MENU_ITEMS T2 ON T1.ITEM_ID = MENU_ITEM_ID
GROUP BY ITEM_NAME, CATEGORY, PRICE
ORDER BY CATEGORY, PRICE DESC, COUNT(ORDER_DETAILS_ID) DESC, ITEM_NAME;

SELECT *
FROM MENU_ITEMS;

SELECT *
FROM ORDER_DETAILS;