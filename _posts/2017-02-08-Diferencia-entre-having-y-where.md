---
layout:     post
title:      ¿Cual es la diferencia entre HAVING y WHERE?
date:       2017-02-09 18:01:19
author:     Carlos Andrés Moreno
summary:    Repasamos el funcionamiento de las cláusulas HAVING y WHERE y mostramos sus diferencias con un ejemplo práctico.
categories: SQL
thumbnail:  SQL
tags:
- SQL
- Bases de Datos
- Consultas
---

# Introducción
Estos últimos días he estado estudiando SQL, repasando conceptos que ya había visto en la universidad y aprendiendo otros nuevos, uno de ellos es la cláusula _HAVING_ que, aunque sabía que existía, nunca sentí la necesidad de usarla y fueron pocos los ejercicios que recuerdo haber hecho usando esta cláusula. Total que, profundizando en el tema me di cuenta de lo útil que resulta emplearla, minimizando las consultas y haciendo de estas mucho más legibles e intuitivas.

Pero cuando ya había dominado y entendido el uso de _HAVING_, me surgió una pregunta ¿Esta sentencia no hace lo mismo que la cláusula _WHERE_?. Buscando por la web encontré algunas respuestas (en inglés) que me orientaron al respecto, pero no encontré una respuesta clara y concisa en español (a la fecha) que dejara claro el uso y las diferencias entre ambas cláusulas.

Por lo anterior, he decidido escribir este artículo para dejar claro la diferencia fundamental entre _HAVING_ y _WHERE_, además de un ejemplo que muestre tal diferencia.

# Entendiendo las cláusulas HAVING y WHERE

> _WHERE_ opera sobre **registros individuales**, mientras que _HAVING_ lo hace sobre un **grupo de registros**.

La anterior es la diferencia principal entre estas dos cláusulas. Con _WHERE_ podemos establecer una condición usando **registros individuales**, aquellos que cumplan con esta condición serán seleccionados (eliminados o actualizados); ahora bien, con _HAVING_ podemos establecer una condición sobre un **grupo de registros**, algo muy importante es que _HAVING_ acostumbra ir acompañado de la cláusula _GROUP BY_. Esto último es así dado que _HAVING_ opera sobre los grupos que nos _"retorna"_ _GROUP BY_.

Entonces: _WHERE_ sobre registros individuales y _HAVING_ sobre grupos de registros, sin embargo no hay nada mejor para interiorizar y terminar de entender un concepto que un buen ejemplo, y eso es precisamente lo que vamos a hacer a continuación.  

# Ejemplo

Para este ejemplo estoy utilizando _Oracle Database Express Edition 11g_ junto con _SQL Developer_ sobre Windows 10 de 64 bits. Aclarado lo anterior, comencemos:

* Creamos una tabla llamada películas, que guarda información de código, nombre, director, fecha de lanzamiento, genero, director y recaudo de las películas de un cinema.

{% highlight sql %}
DROP TABLE peliculas;

-- Creamos la tabla peliculas

CREATE TABLE peliculas(
	codigo NUMBER(5) NOT NULL,
	nombre VARCHAR2(40) NOT NULL,
	director VARCHAR2(30) DEFAULT 'Desconocido',
	fecha_lanzamiento DATE,
	genero VARCHAR(20),
	recaudo NUMBER(20),
	PRIMARY KEY(codigo)
);
{% endhighlight %}

* Ahora insertemos algunos registros.

{% highlight sql %}
INSERT INTO peliculas VALUES(1, 'Los juegos del Hambre', DEFAULT, '01/08/2014', 'Ciencia ficción', 1200000);
INSERT INTO peliculas VALUES(2, 'Harry Potter y el Cáliz de Fuego', DEFAULT, '10/04/2012', 'Ciencia ficción', 6005400);
INSERT INTO peliculas VALUES(3, 'Las Crónicas de Narnia', DEFAULT, '22/10/2008', 'Ciencia ficción', 5600098900);
INSERT INTO peliculas VALUES(4, 'La lista de Schindler', 'Steven Spielberg', '22/03/1999', 'Drama', 456000120);
INSERT INTO peliculas VALUES(5, 'La Pasión  de Cristo', 'Steven Spielberg', '19/08/2010', 'Drama', 456000120);
INSERT INTO peliculas VALUES(6, 'Otra de Spielberg', 'Steven Spielberg', '07/11/2014', 'Drama', 456000120);
INSERT INTO peliculas VALUES(7, 'La vida es bella', 'Roberto Benigni', '23/10/1998', 'Drama', 1256000000);
INSERT INTO peliculas VALUES(8, 'Las posibles vidas de Mr. Nobody', 'Jaco Van Dormael', '06/11/2009', 'Ciencia ficción', 340009023);
INSERT INTO peliculas VALUES(10, 'Buscando a Nemo', 'Andrew Stanton', '02/06/2007', 'Infantil', 780003400);
INSERT INTO peliculas VALUES(11, 'Toy Story', 'Andrew Stanton', '22/12/2004', 'Infantil', 679000300);
INSERT INTO peliculas VALUES(12, 'Toy Story 2', 'Andrew Stanton', '11/06/2007', 'Infantil', 5500300030);
INSERT INTO peliculas VALUES(14, 'Toy Story 3', 'Andrew Stanton', '06/11/2012', 'Infantil', 880776000);
INSERT INTO peliculas VALUES(15, 'Cars', 'Andrew Stanton', '14/05/2005', 'Infantil', 459000200);
INSERT INTO peliculas VALUES(16, 'El viaje de Chihro', 'Hayao Miyazaki', '22/12/2004', 'Infantil', 456700000);
INSERT INTO peliculas VALUES(17, 'Mi vecino Totoro', 'Hayao Miyazaki', '20/06/1992', 'Infantil', 5500300210);
INSERT INTO peliculas VALUES(18, 'El viento se levanta', 'Hayao Miyazaki', '01/11/2013', 'Infantil', 990776000);
INSERT INTO peliculas VALUES(19, 'Nausica del valle del viento', 'Hayao Miyazaki', '22/10/1989', 'Infantil', 669000200);
{% endhighlight %}

* Realicemos algunas consultas que implique el uso de _HAVING_ y _WHERE_

{% highlight sql%}
/*1. Una fácil: Obtener el total del recaudo, agrupado por genero y 
director*/

SELECT genero, director, SUM(recaudo) AS TOTAL FROM peliculas
	GROUP BY genero, director; 

{%endhighlight%}

![punto1](http://i.imgur.com/iHpxKUb.png)

{% highlight sql%}
/*2. Ahora queremos obtener el total del recaudo, agrupado por genero y director, teniendo en cuenta solo aquellas películas que recaudaron mas de 80 pesos*/
  
SELECT genero, director, SUM(recaudo) AS TOTAL FROM peliculas
  GROUP BY genero, director
  HAVING SUM(recaudo) > 80;
{% endhighlight %}

![punto2](http://i.imgur.com/HfzAGNw.png)

{% highlight sql%}
/*3. Ahora queremos obtener el total del recaudo, agrupado por genero y director, sin tener en cuenta las películas cuyo director sea
desconocido y teniendo en cuenta solo aquellas películas que recaudaron mas de 80 pesos.*/

SELECT genero, director, SUM(recaudo) AS TOTAL FROM peliculas
  WHERE director <> 'Desconocido' AND director IS NOT NULL
  GROUP BY genero, director
  HAVING SUM(recaudo) > 80;
{% endhighlight %}
![punto3](http://i.imgur.com/Ema5mgB.png)

* La confusión de que _WHERE_ hace lo mismo que _HAVING_ viene de lo siguiente:

{% highlight sql %}
/*Queremos obtener el recaudo de las películas agrupadas por genero y director pero solo de aquellas cuyo genero sea drama.*/

-- Con where...
SELECT genero, director, SUM(recaudo) AS TOTAL FROM peliculas
  WHERE genero LIKE '%Drama%'
  GROUP BY genero, director;
{% endhighlight %}

![](http://i.imgur.com/t22nqn0.png)

{% highlight sql %}
--Con having...
SELECT genero, director, SUM(recaudo) AS TOTAL FROM peliculas
  GROUP BY genero, director
  HAVING genero LIKE '%Drama%';
{% endhighlight %}

![](http://i.imgur.com/xi5Tloh.png)

Las dos consultas anteriores retornan los mismos registros, pero se comportan totalmente distinto. En la primera, seleccionamos genero, director y la suma del recaudo **siempre y cuando el genero sea 'Drama'** (_WHERE_) y posteriormente los agrupamos por genero y director (_GROUP BY_).

En la segunda seleccionamos el genero, director y hacemos la suma del recaudo, **sin importar si el genero es o no 'Drama'**, luego los agrupamos por genero y director (_GROUP BY_). Por último seleccionamos solo los registros cuyo genero sea 'Drama' (_HAVING_). Además, si prestaste atención, el resultado de la consulta hecha con _HAVING_ se demora el doble de tiempo que la consulta hecha con WHERE (`0.008 seg` y `0.004 seg` respectivamente).

Quizá te estés preguntando ¿cuándo usar _HAVING_ o _WHERE_?, desde mi punto de vista, deberíamos usar _HAVING_ solo cuando se vea implicado el uso de funciones de grupo (`AVG`, `SUM`, `COUNT`, `MAX`, `MIN`), debido a que con _WHERE_ no podemos realizar condiciones que impliquen estas funciones. Por ejemplo, si intentas esto, tendrás un error:

{%highlight sql%}
/*Obtener el promedio del recaudo de las películas, agrupado por director, teniendo en cuenta solamente aquellos promedios menores a 40 y con autor conocido*/

SELECT director, AVG(recaudo) AS PROMEDIO FROM peliculas
  WHERE AVG(recaudo) < 40 AND director NOT LIKE '%Desconocido%'  
  GROUP BY director; 
{%endhighlight%}

![error](http://i.imgur.com/iaAH8RO.png)

La anterior consulta genera error puesto que estamos usando funciones de grupo con una cláusula _WHERE_, que solo opera sobre registros individuales, mejor intenta esto:

{%highlight sql%}
/*Obtener el promedio del recaudo de las películas, agrupado por director, teniendo en cuenta solamente aquellos promedios menores a 40 y con autor conocido*/

SELECT director, AVG(recaudo) AS PROMEDIO FROM peliculas
  GROUP BY director
  HAVING AVG(recaudo) < 40 AND director NOT LIKE '%Desconocido%'; 
{%endhighlight%}

![](http://i.imgur.com/qIXK8rX.png)

Te recomiendo entonces usar _HAVING_ cuando se vean implicadas las funciones de grupo. Si tienes una condición simple, que implique comparar campos individuales entonces usa _WHERE_ (e.g. que el nombre sea igual a una cadena, que el recaudo de un registro sea menor a un valor, etc.) 

y por supuesto, si tienes otras recomendaciones puedes dejar tu comentario más abajo, siempre es bueno compartir lo que sabes.

# Conclusión

Espero que con este artículo hayas aprendido que _WHERE_ y _HAVING_ se comportan de manera distinta aunque a veces pareciera que hacen exactamente lo mismo. Si tienes alguna sugerencia que hacer o quieres aportar algo más, puedes dejarlo más abajo en los comentarios. Nos vemos en una próxima entrada.

{% highlight python %}print("Hasta pronto"){% endhighlight %}