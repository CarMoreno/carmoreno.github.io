---
source: _notebooks/2025-05-25-pruebas-saber-11-icfes-colombia-en-números.ipynb
layout: post
class: dashboard
title: Pruebas Saber 11 en números
author: Carlos Andrés Moreno
date: 2025-05-20 12:31:19
summary: Data storytelling sobre las Pruebas Saber Pro, el exámen final de secundaria
  en Colombia
categories: dataviz
thumbnail: plot
tags:
- Data
- Python
- Plotly
lang: es
page_id: pruebas-saber-11-icfes-colombia-en-numeros
---
# Sobre las Pruebas Saber 11

La Prueba Saber 11 es un examen diseñado por el Instituto Colombiano para la Evaluación de la Educación (ICFES) que se realiza a cada estudiante de último año de educación secundaria en Colombia. Esta prueba mide el nivel de conocimiento en diferentes áreas o asignaturas, específicamente en Lectura Crítica, Matemáticas, Sociales y Ciudadanas, Ciencias Naturales e Inglés. El exámen se divide en dos sesiones, con una duración de 4 horas y 30 minutos cada una. Cada asignatura tiene un puntaje de 0 a 100 puntos y la prueba tiene un puntaje global que va de 0 a 500 puntos. Dependiendo de estos puntajes, el estudiante tendrá opciones de postularse a becas para continuar sus estudios superiores, o de ser admitido en alguna universidad pública o privada.

Una persona que haya obtenido el título de bachiller en años anteriores también puede presentar esta prueba, que, dicho sea de paso, se puede realizar más de una vez en diferentes años electivos.

# Sobre los datos

Los datos que serán usados a lo largo del presente estudio han sido obtenidos desde la [Plataforma Oficial de Datos Abiertos del Gobierno de Colombia](https://www.datos.gov.co), y están disponibles para su descarga en este [link](https://www.datos.gov.co/Educaci-n/Resultados-nicos-Saber-11/kgxf-xxbe/about_data). Originalmente, este _dataset_ cuenta con los resultados de las evaluaciones desde el año 2010 hasta el año 2022. Sin embargo, para efectos prácticos, he decidido enfocarme en el año 2022. Quizá luego me anime a estudiar los datos de años anteriores para hacer comparaciones, mirar cambios y tendencias a lo largo del tiempo.

Además, he decidido enfocarme en dos grandes aspectos que pueden influir en el desempeño de las pruebas: Aspectos familiaries y colegiales. Para los primeros, miraremos como es el desempeño de los estudiantes de acuerdo al estrato socioeconómico de la vivienda familiar y si el estudiante cuenta con internet en su hogar. En cuanto a los colegios estudiaremos el desempeño según la jornada (mañana, tarde, sabatina, etc.), género del colegio (colegio masculino, femenino o mixto), si el colegio es o no bilingüe, si el colegio es rural o urbano y por último, miraremos el desemepeño de los estudiantes en los colegios públicos y privados.



## Trabajos relacionados

Ya han habido otros trabajos bastante buenos sobre el análisis de las Pruebas Saber 11, me gustaría resaltar el realizado por Javier Moreno y Jorge Orlando Melo con los resultados de matemáticas y lenguaje para los resultados del 2013; este trabajo se enfocó en municipios y colegios públicos. Además se trató de encontrar algunas correlaciones interesantes entre pobreza multidimensional y violencia con los resultados del exámen. Puedes ir a revisar este trabajo [acá](https://finiterank.github.io/saber_notebooks/).

# Ojeadita a nivel nacional

Primero vamos a revisar las distribuciones a nivel nacional. Vemos que los puntajes de Inglés, Sociales y Ciudadanas y Ciencias Nataurales están concentrados hacia la izquierda, en los valores más bajos, mientras que podemos ver una leve concentración a la derecha en las asignaturas de Matemáticas y Léctura Crítica. Pareciera que los estudiantes son mejores en Matemáticas y Lectura y no tanto en las otras asignaturas, aunque también puede ser que el sistema educativo no esté en concordancia con lo que las pruebas de Inglés, Ciencias Naturales y Sociales y Ciudadanas están evaluando.

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_11.html" %}


Si nos fijamos en la última gráfica, podemos ver que el puntaje global, que va de 0 a 500 puntos, tiene una concentración hacia la izquierda, lo que sugiere que los estudiantes en Colombia tienden a sacar puntajes menores al promedio nacional, que para el año 2022 fue de **251.4** según [Portafolio](https://www.portafolio.co/economia/finanzas/educacion-en-colombia-puntaje-promedio-de-pruebas-saber-11-aumento-en-2022-581407). Con un puntaje igual o menor al promedio, es bastante improbable que se puedan conseguir becas para estudios superiores y ni hablar de las chances de ser admitido en algún programa académico que exija un mínimo requerido.

Lo anterior nos hace preguntar qué tienen de especial aquellos colegios donde estudian los alumnos que tuvieron buenos rendimientos en las Pruebas Saber 11, quizá los entes oficiales puedan tomar nota de esto y, por qué no, implementar ciertas prácticas o rutinas para empezar a elevar el puntaje de sus graduados.

# Estudie inglés mijo

Miremos la distribución de los puntajes de las diferentes áreas para los colegios bilingües y los que no lo son. Para esto nos ayudamos de los [diagramas de cajas](https://bookdown.org/jboscomendoza/r-principiantes4/diagramas-de-caja.html), puedes pasar el mouse por sobre cada caja para ver su información. Para el lector olvidadizo, recordemos que cada caja tiene una linea en la mitad, esta es la mediana. La parte superior de la caja es el tercer cuartil de los datos y la parte inferior de la caja el primer cuartil, el rango desde el primer al tercer cuartil se conoce como Rango Intercuartílico, que es la caja misma. Las líneas que salen de las cajas se llaman bigotes y representan los valores mínimos y máximos, mientras que los puntos mas lejanos representan valores atípicos.

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_13.html"
    orientation="left"
    height="650px"
    text="Vemos entonces que los estudiantes de los colegios bilingües tienen un rango que va de **41** a **77**. También, vemos que los puntajes se concentran en la parte superior de la caja (los puntajes más altos), lo que nos dice que la mayoría de estudiantes tienen una puntuación de entre **55** (la mediana) y **77**, incluso, hubieron estudiantes con puntuación perfecta, de **100** puntos. Por el contrario, los estudiantes de colegios no bilingües tienen un rango desde **40** hasta **58**, con una mediana de **49**. Como era de esperarse, los bilingües sacan mejores resultados en las pruebas de inglés."
%}

En las demás asignaturas, los bilingües tienden a estar un poco por arriba también (no tanto como lo están en Inglés). Estas diferencias de entre 6 y 10 puntos en las demás asignaturas sumado a sus increíbles puntajes en pruebas de inglés hacen que, en el puntaje global del exámen, los bilingües sobrepasen (y por mucho) tanto el promedio nacional como el promedio de los NO bilingües.

En el siguiente [Gráfico de Bala](https://www.tableau.com/chart/what-is-bullet-graph#:~:text=A%20bullet%20graph%20is%20a,elements%20to%20provide%20additional%20detail.) podemos verlo mejor. La línea blanca vertical marca el promedio nacional global mientras que la línea azul oscuro mide el puntaje promedio de los estudiantes de cada colegio; las franjas azul claro del fondo representan los rangos de puntajes globales. Vemos que los bilingües están arriba del promedio nacional en **+18** puntos y los no bilingües lo están solo por **+1** punto. Además, estos últimos tienen un promedio de **252**, 18 puntos por debajo de los bilingües, que tiene **270** puntos de promedio.

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_14.html" height="255px" %}


# Colegios Oficiales y Privados

No pude encontrar mucha información con respecto a la naturaleza de los colegios para el año 2022. Sin embargo:

> ... Para 2023 en Colombia habian 53,148 colegios con 8 de cada 10 siendo de caracter oficial. Esto nos dá aproxiamdamente 42,518 colegios oficiales y 10.630 colegios no oficiales. — M*ateo Medina Ariza, en [Dos de cada diez estudiantes escolares en Colombia estudian en colegios privados](https://www.larepublica.co/economia/dos-de-cada-diez-estudiantes-escolares-en-colombia-estudian-en-colegios-privados-3964187), Diario La República*

Con base en lo anterior, podríamos entonces afirmar que en Colombia hay menos colegios privados, lo que supone que más estudiantes de colegios oficiales presentan el Saber 11.

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_16.html" 
    height="650px"
    orientation="left"
    text="Segun las visualizaciones, vemos que los puntajes de los estudiantes privados están siempre por encima en todas las asignaturas que los puntajes de los estudiantes oficiales. En Inglés y Lectura Crítica esta diferencia es un poco más marcada. Una posible causa de esto pueda deberse a que en los colegios oficiales hay muchos más alumnos por docente, esto hace que la experiencia de aprendiaje en el aula sea compleja y que el profesor no pueda centrarse en cada estudiante individualmente para comprobar si los tenams fueron comprendidos. Para el 2023 había alreadedor de 24 estudiantes por decente en los colegios oficiales y solo 14 por docente en los privados según el mismo artículo del [Diario La República](https://www.larepublica.co/economia/dos-de-cada-diez-estudiantes-escolares-en-colombia-estudian-en-colegios-privados-3964187)." %}

Para terminar, los estudiantes de colegios privados obtienen un promedio de **274** en el puntaje global del examen superando con **+22** puntos el promedio global nacional. Los estudiantes de colegios oficiales obtienen solo **244** de promedio, quedandose **-8** puntos por detrás de las expectativas nacionales. Sin duda esto debería prender las alarmas en el Ministerio de Educación de Colombia y buscar acciones que permitan elevar el puntaje en Pruebas Saber 11 a sus estudiantes.

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_17.html" height="255px" %}

_Nota: Pueden haber colegios oficiales o privados bilingües, para obtener los datos se discriminó solamente por el caracter del colegio (oficial y privado)._

# Del campo a la ciudad

Para ningún colombiano debería ser un secreto que el Gobierno Nacional tiene un deuda muy grande con la ruralidad. Colombia no es un país de ciudades sino de campos, y en esto el lector y yo podemos o no estar de acuerdo. Lo que sí no entra en debate alguno es que:

> En Colombia existen aproximadamente 39,949 establecimientos educativos rurales, que equivalen al 67.5% del total de establecimientos nacionales. Mientras que en las áreas urbanas hay 17,346 establecimentos, equivalentes al 32.5% nacional. — *Josué Sarmiento Lozano en [El Universo de la escuela y los colegios rurales en Colombia](https://rutamaestra.santillana.com.co/el-universo-de-la-escuela-y-los-colegios-rurales-en-colombia/)*

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_19.html" 
    orientation="left"
    height="650px"
    text="Los estudiantes de los colegios rurales tienden a obtener resultados marcadamente más bajos en todas las asignaturas en comparación con los colegios urbanos. En general, el rango intercuartílico de los estudiantes de colegios urbanos, está entre **40** y **60** puntos aproxiamadamente para todas las asigxnturas evaluadas. Mientras que, en los colegios rurales el tercer cuartil no alcanza siquiera los **60** puntos. Peor aún, los puntajes más bajos empiezan con valores inferiores a **40**, esto sugiere que un puntaje bajo de un estudiante urbano no es tan bajo si lo comparamos con un puntaje de un estudiante rural en la mayoría de los casos."
%}

Además, ninguno de los valores máximos de puntaje de los estudiantes rurales supera a los obtenidos por los estudiantes urbanos. Si comparamos la asignatura de Matemáticas, que es donde los estudiantes rurales parecen brillar un poco más, el puntaje máximo obtenido es de **80** puntos lo que se encuentran todavia por debajo de los puntajes máximos de Matemáticas de los estudiantes urbanos, que es de **84** puntos.

¿A qué se puede deber estos resultados de los colegios rurales?, la verdad es que son muchos factores y se sale del propósito de este estudio describirlos todos con pelos y señales. Lo que sí es cierto es que falta mucha presencia del estado en la mayor parte de las áreas rurales. No aislemos el problema solamente a los colegios, temas como accesibilidad a través de vías, servicios públicos como agua y electricidad e infrastructura de los centros educativos, todos estos componentes van de la mano y seguro puede influir en los resultados de las Pruebas Saber 11. Recomiendo una lectura al artículo que mencioné antes titulado [El Universo de la escuela y los colegios rurales en Colombia](https://rutamaestra.santillana.com.co/el-universo-de-la-escuela-y-los-colegios-rurales-en-colombia/).


{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_20.html" height="255px" %}


# Mijas, Mijos y Mixtos Bajo la Lupa

Algo que se debe tener en cuenta en estas comparaciones es que no son del todo justas, debido a que el porcentaje de colegios de un solo género en Colombia es muy bajo con respecto a los colegios mixtos. Para las Pruebas Saber 11 del año 2022, el 96% de los estudiantes evaluados pertenecian a un colegio mixto, el 2.31% pertenecían a colegios femeninos y solo el 0.75% pertenecían a colegios masculinos. Dicho esto, interpretemos las visualizaciones.

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_21.html"
    orientation="left"
    height="650px"
    text="Lo primero que salta a la vista es que, en general los colegios conformados solamente por estudiantes mujeres o solamente por estudiantes hombres les va mejor en todas las asignutras de las Pruebas Saber 11 que a los colegios mixtos (aquellos conformados por hombres y mujeres a la vez). Aproximadamente el rango de puntajes para hombres y mujeres empieza desde **50** puntos hacia adelante. Mientras que el de los mixtos comienza desde los **40** puntos."
%}

Los datos parecen indicar que a los colegios de hombres les va un poco mejor en Inglés y Matemáticas en comparación con los colegios de mujeres. Mientras que en el resto de asignaturas ambos géneros tienen puntajes muy similares, estando los puntajes de ellos un poquito por encima de ellas. En cuanto al promedio nacional global, los colegios de hombres lo superan con creces, con **+45** puntos. Igual sucede con los colegios de solo mujeres, que los superan con **+36** puntos. En cuanto a los colegios mixtos, quedan rezagados y no consiguen superar el promedio nacional de puntaje global, quedando **-2** puntos por debajo.

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_22.html" height="380px" %}

Entonces, parece que el orden es este: Colegios Masculinos en primer lugar, luego muy de cerca los Colegios Femeninos y de último los Colegios Mixtos. ¿A que se debe este comportamiento?. ¿Por qué a los hombres les va mejor, por ejemplo en Matemáticas?.

> Que a los niños les vaya mejor que a las niñas en materias como matemáticas y ciencias naturales no es una noticia nueva; de los 65 países que presentaron la prueba PISA en el 2009, 54 países presentaron esta tendencia. Así mismo, el ICFES conoce estas diferencias desde hace tres décadas. Una de las explicaciones para la diferencia entre géneros es que los niños tienen mayores habilidades visuoespaciales. — _Tomado de [Mixto, masculino, femenino. ¿Importa el género del colegio?](https://www.eccole.co/importa-el-genero-del-colegio/)_



# La Jornada Escolar y su Sorprendente Efecto en Saber 11

Para terminar con los aspectos relacionados a los colegios donde pertenecen los estudiantes, miremos los datos de las jornadas escolares. Los puntajes más bajos vienen de las jornadas nocturnas y sabatinas, ambas jornadas con números similarmente malos para todas las asignaturas. Mientras que los puntajes más altos vienen dados por los estudiantes de jornada completa. En el gráfico, puedes hacer click en cada cuadrito de la leyenda para activar/desactivar categorías de jornadas. En cuanto a las jornadas de mañana, tarde y única sus puntajes para todas las asignaturas son también bastante similares, estando la jornada de la mañana un poco por encima en el promedio global con respecto a la jornada de la tarde.

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_23.html" height="650" %}

[Buscando un poco más sobre la jornada completa](https://www.youtube.com/watch?v=2B74W0aoB08), pareciera que no es algo del todo común en los colegios del país, la idea detrás de esta jornada es que los estudiantes puedan participar en activiades culturales y de refuerzo académico luego del término de las clases. No queda del todo claro si esto es obligatorio u opcional. Si el lector tiene mas información sobre esta jornada, sería de gran utilidad que dejara un comentario al final. Sin duda, es algo en lo que vale la pena indagar, pues los resultados son positivos con respecto a los puntajes en todas las asignaturas evaluadas para esta jornada.

Viendo el promedio de los puntajes globales para cada jornada, podemos apreciar que los estudiantes de jornada completa están **+32** puntos por encima del promedio nacional. El lector podrá sacar sus propias conclusiones de las demás jornadas mostradas en el gráfico de balas.


{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_24.html" height="575px" %}


A parte de los aspectos de colegio que acabamos de estudiar anteriormente, también vale la pena preguntarse si existe algun factor socioeconómico que afecte los puntajes de las Pruebas Saber 11. ¿Violencia, pobreza, acceso a tecnología, nivel de estudios de los padres del estudiante?. Para terminar el presente estudio quiero mirar dos aspectos: Estrato y Acceso a Internet. Miremos.

# Estratos en Saber 11, ¿qué nos dicen los datos?

La siguiente gráfica de barras muestra el número de estudiantes en el eje `y` y los diferentes rangos de los puntajes globales en el eje `x`. Pasando el cursor por encima puedes ver la información del porcentaje para cada rango. Lo primero que nos damos cuenta es que hay mas estudiantes que presentaron la Prueba Saber que pertenecen a los Estratos 1, 2 y 3. Para el lector no colombiano, entre más bajo es el número de Estrato significa menores ingresos económicos de la familia, además de que la vivienda familiar esté ubicada en barrios con problemas sociales más complejos (aunque claro, no nos podemos olvidar del fenómeno de la riqueza/pobreza oculta).

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_27.html" %}

Mientras más arriba vamos en el estrato, mas crece el porcentaje de estudiantes que están entre los 300 y 400 puntos. Hasta que, llegando al Estrato 6, vemos como el rango anteriormente mencionado sobrepasa en porcentaje al rango de 200 a 300. Algo a tener en cuenta es el total de estudiantes por estrato. No sería justo comparar al Estrato 1 con el Estrato 6, el total de población en ambos nos haria caer en conclusiones y juicios a la ligera. Sin emabrgo, podríamos comparar los 3 primeros estratos entre sí. Tal parece que el estrato socioeconómico del estudiante influye en el resultado de las pruebas, esto tiene sentido leyendo trabajos relacionados, como [este](https://finiterank.github.io/saber_notebooks/) que mencioné al inicio, donde vemos una correlación entre pobreza y los resultados de matemáticas y lectura.


# ¿Internet al rescate?

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_30.html" 
    orientation="left"
    text="Por último, sería interesante saber si tener internet en casa hace que el estudiante pueda obtener mejores calificaciones en las pruebas. En Estrato 1, el **71%** de los estudiantes ubicados en los mejores puntajes globales tenían internet en casa, así como el **54%** de los ubicados en el rango entre los 200 y 300 puntos. A su vez, el **57%** de los estudiantes ubicados en el rango mas bajo de puntajes no tenía internet. Lo anterior podría hacernos pensar de que en Estrato 1, tener internet puede hacer una diferencia y ayudar a obtener mejores puntajes."  
%}

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_31.html" 
    orientation="left"
    text="Pero algo contraintuitivo pasa en el Estrato 2 y 3. En los puntajes más bajos, más de la mitad de estudiantes tenía internet; ¿por qué entonces, si la mayoría tenía internet en casa, obtuvieron bajos puntajes?, puede deberse a muchos factores, quizá el estudiante nunca usó internet para estudiar para el examen, o su conexión es de muy baja calidad. Creo que más allá de conocer si el estudiante tenía (o no) internet en casa, deberíamos preguntarnos ¿cómo el estudiante usa el internet?, y más aún, si usó el internet para desarrollar simulacros de las Pruebas Saber 11 antes de presentarlas." %}


# ¡Gracias!

Si haz llegado hasta este punto, no tengo más sino que agradecer tu tiempo, el notebook con el código de las visualizaciones puede ser accedido a través de [este enlace](https://colab.research.google.com/drive/1hxYrCXIEwsEeHUkDhqlcd7HrlSDTjKL4?usp=sharing). He usado Plotly para todas estas visualizaciones tal cual hice en este [otro artículo](https://carmoreno.com.co/data/2025/05/11/Data-storytelling-datos-hotel-ploty-python/) sobre reservas de hoteles, que si no lo haz leído te anímo a que lo hagas, es de lejos muchísimo mas corto que este 🙃.
