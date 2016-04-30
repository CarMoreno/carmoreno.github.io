---
layout:     post
title:      Interfaces gráficas con mucho estilo usando Python y PyQT
date:       2016-04-30 14:24:10
author:     Carlos Andrés Moreno
summary:   	Explico como realizar una interfaz gráfica usando Python y la libería PyQt.
categories: Blog
thumbnail:  python
tags:
- Python
- PyQt
- Estilo
- Interfaz
---
![estilo](http://i.imgur.com/uascq4u.jpg)

# Introducción

El estilo es uno de esos aspectos que a veces descuidamos en nuestras aplicaciones, más aún si tienes un perfil orientado más al back-end . Sin embargo no podemos negar que la apariencia es parte fundamental en el desarrollo hoy en día, la interfaz de usuario final debe de ser intuitiva y agradable, los matices y mezclas entre colores, fuentes de texto y efectos nos ayudan a esto. Hoy vas a aprender como dar estilo a interfaces gráficas usando Python y PyQt4 para que le puedas dar un toque de personalidad a tus proyectos.

# Requisitos

Para seguir este artículo doy por sentado que has instalado correctamente Python y PyQt, además de la herramienta QtDesigner. En particular tengo la versión 2.7 de Python y la versión 4 de PyQt corriendo sobre un Windows 10 de 64 bits, aclarado lo anterior comencemos.

# Construyendo la interfaz en QtDesigner
Vamos a hacer una ventana de login, para ello creamos un `QtMainWindow`, arrastramos un `QPushButton`, dos `QLineEdit` (para el nombre de usuario y contraseña) y 3 `QLabel`, hasta que tengas algo como esto:

![login](http://i.imgur.com/rLx1Qlf.png)

Ahora vamos a **cambiar el nombre del objeto** de cada uno de los componentes que hemos puesto en el MainWindow, incluyendo el MainWindow como tal, para ello das clic derecho sobre el componente que deseas cambiar de nombre, luego damos en `Change objectName...` como vemos en la imagen de abajo.

![cambioName](http://i.imgur.com/yIX0bzC.png)

En mi caso Los `objectName` de mis componentes son `VentanaLogin` para el `QMainWindow`; `button_iniciar` para el `QPushButton`; `line_usuario` y `line_password` para los dos `QLineEdit`; `label_login` para el `QLabel` superior y `label_usuario` y `label_password` para los otros dos restantes.

# Dando estilo a la interfaz
Siempre es mejor establecer los estilos desde el objeto padre, en nuestro caso ese objeto es el `QMainWindow`, entonces será en este objeto donde vamos a establecer las reglas de estilo que afectaran a todos los componentes hijos (e.i. botones, labels). Damos clic derecho **sobre la ventana** (ojo, sin tocar otro componente), y luego clic en `Change styleSheet ...`, como vemos en la imagen.

![cambioEstilos](http://i.imgur.com/wGdrjsx.png)
Se nos abrirá un recuadro para escribir reglas de estilo, estas afectarán a todos los elementos de la ventana. Si tienes conocimientos en CSS te sentirás como en casa. Realizemos entonces algunos cambios de estilo.

{% highlight css %}

	/*Cambiamos el color de la ventana*/
	#VentanaLogin{
		background-color: #009688;
	}

	/*Estilos para el botón*/
	QPushButton{
		background-color: #ff5722;
		border-radius: 4px;
		color: #fff;
		font-family: 'Roboto';
		font-size: 17px;
	}
	
	/*Definimos el estilo para un efecto hover sobre el botón,
	este cambiará su background cuando pasemos el mouse por
	encima*/
	QPushButton:hover{
	background-color: #ff7043;
	}

	/*Definimos los estilos para los QLineEdit*/
	QLineEdit{
		border-radius: 3px;
		border: 2px solid #00796b;
	}

	/*Definimos los estilos para los QLabel*/
	QLabel{
		font-family: 'Roboto';
	}

	/*Definimos los estilos para los QLabels cuyos nombres son
	'label_usuario' y 'label-password'*/
	#label_usuario, #label_password{
		font-size: 17px;
		color: #212121;
	}
	
	/*Estilo para el QLable cuyo nombre es #label_login*/
	#label_login{
		font-size:30px;
		color: #fff;
	}
{% endhighlight %}

Cosas por decir acá:

* Cuando en los estilos colocamos el nombre del componente como tal, por ejemplo: `QLabel`, `QPushButton` o `QLineEdit`, estamos estableciendo reglas generales para tales componentes. Es decir, en nuestra ventana, *todos* los botones serán de fondo naranja, con un tipo de letra _'Roboto'_.

* Cuando queramos definir un regla particular podemos usar el **nombre del objeto** que le hemos dado al componente, esto se hace antecediendo el caracter '#' al nombre (e.g `#label_login`).

* Podemos usar algunas pseudoclases como en CSS, si te fijas anteriormente le he añadido la pseudoclase _hover_ a `QPushButton`, este comportamiento será general para todos los botones que hayan en la ventana. Prueba usando la pseudoclase _pressed_ y observa lo que ocurre.

Con los estilos anteriores nuestro login ha quedado así:

![loginbonito](http://i.imgur.com/l5X8GIZ.png)

# Bonus

> ¿Que te parece si pasamos la ventana de login a código Python?

Esto es muy fácil, guarda la interfaz anterior dentro de la carpeta PyQt4 (donde se instaló la librería), por defecto la extensión será `.ui`, yo la he guardado como `login.ui`.

Abre una terminal y ubicate en la carpeta donde guardaste el archivo, luego escribe `pyuic4 login.ui -o login.py` luego oprimes enter y listo, deberías ver un archivo `login.py` que puedes usar para programar el comportamiento de la ventana, eventos y demás.

# Conclusión

Hoy hemos aprendido como darle un poco de estilo a nuestras interfaces gráficas, PyQt nos ofrece muchas facilidades a la hora de gestionar estas reglas, además siempre puedes [dirigirte a la documentación](http://doc.qt.io/qt-4.8/stylesheet-examples.html) para ver mas ejemplos y jugar un poco con lo que has aprendido. Por último decirte que he basado este artículo en una [entrada de este blog](http://thesmithfam.org/blog/2009/09/10/qt-stylesheets-tutorial/#) que me fue útil hace un tiempo.

Como siempre, si tienes alguna duda o has tenido algún problema siguiendo este artículo, puedes dejar tu comentario más abajo, procuro responder en breve. No siendo más nos vemos en otra ocasión.


{% highlight python %}print("Hasta pronto"){% endhighlight %}