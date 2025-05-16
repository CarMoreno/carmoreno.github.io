---
source: _notebooks/2025-05-11-Data-storytelling-datos-hotel-ploty-python.ipynb
layout: post
title: Data storytelling, visualizando datos sobre reservas de hoteles.
date: 2025-05-11 10:49:19
author: Carlos Andrés Moreno
summary: En este artículo vamos a realizar un storytelling de un conjunto de datos de reservas de hoteles
categories: Data
thumbnail: plot
tags:
  - Data
  - Python
  - Plotly
---

# Introducción

Como parte de la Maestría en Cienicas de Datos que estoy estudiando en la [Universidad Oberta de Catalunya](https://uoc.edu), me fue asignada una actividad que consiste en crear un *Data Storytelling* de un conjunto de datos sobre reservaciones de hoteles en Lisboa, Portugal. Creo que es una excelente oportunidad de mostrar un poco lo que he aprendido este semestre en la asignatura de Visualización de Datos, es por eso que he decidido crear el *storytelling* en un nuevo artículo del blog.


# Sobre los datos

El conjunto de datos que vamos a usar a lo largo del *storytelling* ha sido descrito completamente en el artículo titulado [Hotel booking demand datasets ](https://www.sciencedirect.com/science/article/pii/S2352340918315191). Como se ha mencionado anteriormente, los datos tratan sobre reservaciones de hoteles en Lisboa, Portugal hechas desde Julio 1 de 2015 hasta Agosto 31 de 2017. Particularmente dos hoteles, uno ubicado en la zona urbana de la ciudad y otro hotel tipo resort.

Cada fila del conjunto de datos es una reservación hecha por un cliente para alguno de los dos hoteles. Además, tenemos información sobre el número de niños, bebés y adultos dentro de la reserva; més, semana y día en el cual se hizo la reserva; país de residencia de cliente, si la reserva se canceló o no, el tipo de comida que se incluyó para los clientes, entre otra información de interés.

# Herrmientas usadas para la visualización

Todas las visualizaciones que vas a ver han sido creadas usando la librería [Plotly](https://plotly.com/python/). El blog está hosteado en Github pages y utiliza Jekyll para generar todo el sitio (si quieres saber un poco más a cerca de esto, puedes hacer click [acá](https://carmoreno.com.co/tutoriales/2015/08/13/Como-hice-el-blog/)).

Me gustaría tambien mencionar a [Jérome Eertmans](https://github.com/jeertmans), el artículo de su blog titulado ["Embedding Plotly in a Jekyll Post"](https://eertmans.be/posts/plotly-example/) fue de gran ayuda para poder integrar Plotly y Jekyll sin morir en el intento (a veces una buena googleada es mejor que escribirle a Gemini o ChatGPT).

# Ahora sí, manos a la obra.

### ¿Prefieres mucha o poca gente?

Lisboa es uno de los destinos turísticos más visitados todos los años en Europa, tiene un clima excelente, buena comida, hermosos paisajes y playas mediterraneas. En 2021, esta ciudad ocupó [el tercer lugar](https://elordenmundial.com/mapas-y-graficos/ciudades-mas-visitadas-europa/) entre las 15 ciudades más visitadas de Europa, solo por detrás de París y Barcelona. Sin embargo, que sea tan popular no significa que todo sea color de rosa; muchas veces implica sitios de interés repletos de gente, pocos lugares para parquear tu vehículo y pagar precios más altos por temporada. ¿No sería mejor ir a Lisboa en una temporada un poco mas relajada?, podríamos usar los datos de hoteles para saber cuándo hay mayor cantidad de turistas. Entre más reservaciones sin cancelación existan, significa mayor cantidad de personas yendo a estos hoteles. Miremos qué nos dicen los datos.


<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_0022420b-d3cd-47f1-8b56-1e9938604407/figure_5.html"
    frameborder="0"
    allowfullscreen
></iframe>



Al parecer los meses donde más reservaciones hay son Julio y Agosto, tanto para el Hotel Urbano como para el Hotel Resort. Esto no debería de sorprendernos, puesto que son normalmente en los meses de verano donde más personas salen a vacacionar. Sin embargo, algo que sorprende son los números de reservas completadas para el mes de **Junio**, ya que son pocas en comparación con el increible clima que hace en este mes, solo 6,404.

Fijémonos ahora en el mes de Septiembre, si bien no acostumbra a ser extremadamente soleado de inicio a fin, no esta nada mal para tomarse unas vacaciones, aún así el numero de reservas completadas no son tantas (6,392) como en Julio y Agosto. Por lo general, los primeros cuatro meses del año y los últimos tres no tienen el mejor clima, por eso no es de sorprendernos que la cantidad de reservas completadas no sean tan altas. Pareciera que viajar en Junio y Septiembre nos ofrece una relación `clima/cantidad de turistas` bastante interesante. Pero, ¿de qué nacionalidad serían las personas que nos encontraríamos si viajásemos en alguno de esos dos meses? Exploremos.

### Los más viajeros

Primero miremos de forma general de dónde proceden las personas que han hecho una reserva completada (sin cancelación) en alguno de los dos hoteles.

<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_0022420b-d3cd-47f1-8b56-1e9938604407/figure_7.html"
    frameborder="0"
    allowfullscreen
></iframe>



Vemos que tenemos muchos paises (**178** para ser exactos). Tiene sentido que Portugal sea el país desde donde más se hacen reservas a Lisboa seguido de los paises cercanos como España, Francia, Italia y Reino Unido. Este último al igual que Irlanda parecen preferir el Hotel Resort en lugar del Hotel Urbano.

Por el contrario, los tursitas que vienen de los tres primeros países mencionados anteriormente prefieren visitar el Hotel Urbano, al igual que los turistas que proceden de Alemania. Ahora exploremos de qué paises serían los turistas que nos pudieramos encontrar en Lisboa, en caso de que viajaramos en Junio o Septiembre. Quizá podamos hacer amigos mientras viajamos, miremos qué nos dicen los datos:

<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_0022420b-d3cd-47f1-8b56-1e9938604407/figure_9.html"
    frameborder="0"
    allowfullscreen
></iframe>



El anterior gráfico de árbol nos muestra la cantidad de personas por nacionalidad que podemos encontrarnos, sea que vayamos en Junio o en Septiembre y sea que nos quedemos en el Hotel Resort o en el Hotel Urbano. Puedes pasar el cursor por encima de cada cuadro para obtener el total de personas de cada nacionalidad, también hacer clic por ejemplo en el Hotel Urbano del mes de Junio, para navegar directamente a esta información.

Vemos que si nos hospedamos en el Hotel Resort en cualquiera de los dos meses, tendríamos muchas más chances de encontrarnos Británicos que Portugueses. Por el contrario, en el Hotel Urbano nos encontraríamos en mayor medida con Portugueses, Alemanes y Franceses. En Septiembre podríamos encontrarnos con algún Español en el Hotel Urbano. Parece ser que los Británicos tienden a preferir el Hotel Resort.

Del anterior gráfico también podemos observar que habrá un poco más de turistas en Junio que en Septiembre, sin embargo, será el Hotel Urbano quién tendrá mas cantidad de personas sin importar el mes. Por lo tanto, si tu plan es relajarte en un hotel cercano a la playa y no tanto salir a conocer la ciudad llena de turistas, sería un excelente plan ir al Hotel Resort cerca del mar en Junio ya que habrán menos personas, y si hablas Inglés, podrías aprovechar para practicar, ya que la mayoría de ellos serían Británicos.

### ¡Atentos a las cancelaciones!

Ya vimos que Junio y Septiembre pueden ser los mejores meses para viajar si es que estás buscando un equilibrio entre clima y cantidad de turistas, pero quizá no te importe mucho esto último. Quizá lo más importante para tí sea viajar en los meses de verano sea que haya muchos turístas o no; sin embargo no siempre es posible reservar a tiempo y los mejores meses son los primeros en irse. Que tal si miramos la taza de cancelaciones por mes para mirar si tenemos algún chance de "cazar" alguna reserva cancelada en caso de no poder reservar a tiempo, e irnos de vacaciones a Lisboa.

<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_0022420b-d3cd-47f1-8b56-1e9938604407/figure_13.html"
    frameborder="0"
    allowfullscreen
></iframe>



En los anteriores gráficos la etiqueta "Sí" tiene el procentaje de reservas canceladas y "No" el porcentaje de reservas completadas. Para cada mes podemos obtener esta información pasando el mouse por encima de algun mes o simplemente haciendo click sobre el mismo. Vemos que para el total de reservas hechas en el Hotel Reort en el mes de Junio, solamente se cancelaron el **33.07%**, mientras que el **66.93%** restante se completaron. En general, parece que las reservas para este tipo de hotel tienen una taza mas pequeña de cancelaciones. Será mejor planear con antelacion el hospedaje en el Hotel Resort y reservar con antelación.

Por otra parte, en el Hotel Urbano, para el mes de Junio tenemos una taza de cancelaciones más elevadas, de un **44.69%**. Imagina que no alcanzaste a reservar un lugar en Lisboa para tus próximas vacaciones, en este escenario parece más probable que puedas aprovechar alguna cancelación hecha en el Hotel Urbano, pero que sea más dificil "cazar" una para el Hotel Resort.

Otro compartamiento interesante que vemos es que en el mes de Enero, donde el Hotel Resort tiene un porcentaje de cancelación mínimo, de hecho es el más bajo de todos con un **14.82%** (¿vacaciones de trabajo en Enero?). Para finalizar y solo por curiosidad, miremos el porcentaje de cancelaciones de reserva por pais de origen.



### ¿Los más viajeros ahora no lo son tanto?

En el siguiente mapa de calor podemos ver la taza de cancelaciones de los diferentes paises que han hecho al menos diez reservas teniendo en cuenta ambos hoteles. La razon para este filtro es que hay muchos paises que tienen solo una reserva cancelada, esto nos daría una taza del 100% de cancelaciones para ese país, lo cual no sería suficientemente significativo.

Podemos hacer _zoom in_ / _zoom out_ para ir apreciando la taza de cancelaciones por continente. Centrandonos en Europa vemos que la taza mas grande de cancelaciones la tiene Portugal. En un principio pensabamos que eran los que mas viajaban, pero al parecer son tambien los que más cancelan reservas. Por otra parte, en el continente Americano, los paises que menos cancelan reservas de alojamiento a Lisboa son México con el **11.76%** y Perú con el **20.79%**.

<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_0022420b-d3cd-47f1-8b56-1e9938604407/figure_15.html"
    frameborder="0"
    allowfullscreen
></iframe>



## Conclusiones

Algunas conclusiones (un poco a la ligera), que podemos sacar de esta exploración de datos son:

* Junio y Septiembre ofrecen una buena relación entre clima y número de turistas.
* Es muy dificil poder reservar alojamiento en el Hotel Resort a última hora, por lo que es mejor hacer este proceso con antelación.
* Portugal es el país de donde vienen los turistas que más viajan a Lisboa, pero también de donde más cancelan reservas (En Europa).
* Es más fácil reservar a última hora en el Hotel Urbano, puesto que la taza de cancelaciones es mayor que en el Hotel Urbano.
* Los Británicos prefieren el Hotel Resort, mientras que el resto de países vecinos prefieren el Hotel Urbano.


Muchas gracías por llegar hasta el final de este ejercicio. El código completo de este artículo lo puedes ver en [este notebook](https://github.com/CarMoreno/carmoreno.github.io/blob/dataviz-test/_notebooks/2025-05-11-Data-storytelling-datos-hotel-ploty-python.ipynb).

{% highlight python %}print("Hasta pronto"){% endhighlight %}