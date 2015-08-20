---
layout:     post
title:      ¿Cómo configurar Django 1.8 en Windows?
date:       2015-08-17 14:24:10
author:     Carlos Andrés Moreno
summary:    Explico como configurar Django 1.8 en Windows
categories: Blog
thumbnail:  django
tags:
- Como
- configurar
- Django 1.8
- Windows
---

Trabajar con Python sobre cualquier distribución de Windows puede ser un dolor de cabeza si no se hace la correcta configuración en dicho sistema operativo. La primera vez que instale Python en mi laptop fue de verdad un martirio, fue muy frustante puesto que todo lo que me arrojaba la consola al escrbir `python` era un `error, comando no reconocido`, vaya que si me estanque por algunos días, además no quería usar Linux, puesto que si elegía esa opción, debía de: instalar alguna distribución, mis IDES y mis editores de texto en él. Me parecía simplemente mucho trabajo.

Pero bueno, este post trata de explicar cómo configurar Django 1.8 en Windows, no Python; por lo que supongo que el lector tiene instalado y configurado correctamente Python en su máquina, de no ser así te recomiendo [esta entrada][1], explican muy bien la instalación de dicho lenguaje, además del genial paquete pip y del virtual-env, si aun no tienes pip y trabajas en Python, ¿qué esperas para descargarlo?. Dicho lo anterior continuemos:

* Abre la consola de Windows y en ella escribe: `pip install django==1.8`, ¿sencillo no?.
![instalado][2]

* Ahora intenta poner esto en tu consola:  `django-admin --version`. Debería de salirte algo como
`django-admin comando no encontrado`.
![negado][3]

Esto sucede porque debemos de configurar las variables de entorno de Windows. Vamos a ello:

* Da click en inicio, y luego click izquierdo en equipo, ve a propiedades.
![paso][4]

* Esperamos que se nos abra la ventana y damos click donde dice `Configuracion avanzada del sistema`
![paso1][5]

* Se nos abrirá una ventana donde debemos dar click en `Variables de entorno`.
![paso2][6]

* Selecciona en la parte de abajo la variable llamada `Path`, luego da click en editar
![paso3][7]

* Se te abrirá una pequeña ventana. En la parte que dice `Valor de variable` ve hasta al final, pon un 'punto y coma' seguido de la ruta donde está la carpeta Scripts, dicha carpeta está dentro de la carpeta donde fue instalado Python, en mi caso fue en `C:\Python27\Scripts`
![paso4][8]

* Por último dale Aceptar a todo.

Ahora probemos si funcionó, abre un nuevo prompt y pon de nuevo el comando `django-admin --version`, debe de arrojarte la versión que has descargado de Django, en nuestro caso la versión 1.8 
![exito][9]

Es un poco largo, pero no es difícil de hacerlo, si tienes algún problema con los pasos anteriores no dudes en dejar un comentario mas abajo, responderé lo antes posible. En los siguientes posts, para que la cosa se ponga interesante, empezaremos a programar una app Django nivel intermedio. {% highlight python %}print("Hasta pronto"){% endhighlight %}

[1]:https://aasanchez.wordpress.com/2013/09/20/django-en-windows-y-no-morir-en-el-intento/
[2]:../../../../../../images/2015-08-17/instalado.png
[3]:../../../../../../images/2015-08-17/negado.png
[4]:../../../../../../images/2015-08-17/paso.png
[5]:../../../../../../images/2015-08-17/paso1.png
[6]:../../../../../../images/2015-08-17/paso2.png
[7]:../../../../../../images/2015-08-17/paso3.png
[8]:../../../../../../images/2015-08-17/paso4.png
[9]:../../../../../../images/2015-08-17/exito.png